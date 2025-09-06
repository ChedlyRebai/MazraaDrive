using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using Core.Entities;
using Core.Services;
using Microsoft.AspNetCore.Authorization;
using Core.Interfaces;
using Api.Controllers;
using AutoMapper;

namespace API.Controllers
{
    // [ApiController]
    // [Route("api/[controller]")]
    // [Authorize]
    public class DocumentAccessController : BaseController
    {
        private readonly IDocumentAccessService _accessService;
        private readonly IGenericRepository<AccessRequest> _accessRequestRepository;

        public DocumentAccessController(
            ICurrentUserService currentUser,
            IUnitOfWork unitOfWork,
            IMapper mapper,
            IDocumentAccessService accessService,
            IGenericRepository<AccessRequest> accessRequestRepository,
            ILogger<BaseController> logger
           ) : base(currentUser, unitOfWork, mapper, logger)
        {

            _accessService = accessService;
            _accessRequestRepository = accessRequestRepository;
        }


        [HttpPost("request/{documentId}")]
        public async Task<IActionResult> RequestDocumentAccess(int documentId,
            [FromBody] AccessRequestDto requestDto)
        {
            var userId = User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value;

            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            // Create access request
            var accessRequest = new AccessRequest
            {
                DocumentId = documentId,
                RequesterId = userId,
                RequestRead = requestDto.RequestRead,
                RequestUpdate = requestDto.RequestUpdate,
                RequestDelete = requestDto.RequestDelete,
                Message = requestDto.Message,
                Status = "Pending"
            };

            await _accessRequestRepository.AddAsync(accessRequest);
            await _unitOfWork.SaveChangesAsync();

            return Ok(new { Message = "Access request submitted successfully", RequestId = accessRequest.Id });
        }

        [HttpPost("approve/{requestId}")]
        // [Authorize(Roles = "Admin,Manager")]
        public async Task<IActionResult> ApproveAccessRequest(int requestId,
            [FromBody] ApproveRequestDto approveDto)
        {
            var accessRequest = await _accessRequestRepository.GetByIdAsync(requestId);
            if (accessRequest == null)
                return NotFound("Access request not found");

            // var approverId = User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value;
            var approverId = _currentUser.UserId;
            // Generate access link
            var accessLink = await _accessService.GenerateAccessLink(
                accessRequest.DocumentId,
                accessRequest.RequesterId,
                approveDto.ValidityDuration,
                accessRequest.RequestRead,
                accessRequest.RequestUpdate ?? false,
                accessRequest.RequestDelete

            );

            // Update access request status
            accessRequest.Status = "Approved";
            accessRequest.DecidedById = approverId;
            accessRequest.DecisionAt = DateTime.UtcNow;
            accessRequest.Message = $"Approved. Access Link: {accessLink}";

            await _accessRequestRepository.UpdateAsync(accessRequest);
            await _unitOfWork.SaveChangesAsync();

            return Ok(new
            {
                Message = "Access request approved",
                AccessLink = accessLink,
                ExpiresAt = DateTime.UtcNow.Add(approveDto.ValidityDuration)
            });
        }

        [HttpGet("access/{token}")]
        //  [AllowAnonymous]
        public async Task<IActionResult> AccessDocument(string token, [FromQuery] string action)
        {
            var accessLink = await _accessService.ValidateAccessLink(token);
            if (accessLink == null)
                return NotFound("Invalid or expired access link");

            if (!await _accessService.HasPermission(token, action))
                return Forbid("You don't have permission for this action");

            // Get document and serve based on action
            return Ok(new
            {
                Action = action,
                Message = $"Access granted for {action} action",
                DocumentId = accessLink.DocumentId,
                ValidUntil = accessLink.ExpiresAt
            });
        }
    }

    public class AccessRequestDto
    {
        public bool RequestRead { get; set; }
        public bool? RequestUpdate { get; set; }
        public bool RequestDelete { get; set; }
        public string? Message { get; set; }
    }

    public class ApproveRequestDto
    {
        public TimeSpan ValidityDuration { get; set; } = TimeSpan.FromHours(24);
    }
}