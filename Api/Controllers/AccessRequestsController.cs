using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Core.Interfaces;

using Core.DTOs.AccessRequests;
using Core.Entities;
using System.Security.Claims;
using Core.DTO;
using Api.Controllers;
using AutoMapper;
using Api.Helper;

namespace API.Controllers;


// [Authorize]
public class AccessRequestsController : BaseController
{


    private readonly IAccessRightService _accessRightService; // optional if you auto-create rights

    public AccessRequestsController(ICurrentUserService currentUser, IUnitOfWork unitOfWork, IMapper mapper, ILogger<AccessRequestsController> logger, IAccessRightService accessRightService, IAuditLogRepository auditLogger = null)
        : base(currentUser, unitOfWork, mapper, logger, auditLogger)
    {
        _accessRightService = accessRightService;
    }

    [HttpGet]
    public async Task<IActionResult> GetPaged([FromQuery] PaginationParams p)
    {
        _logger.LogInformation("Retrieving paged access requests");
        var result = await _unitOfWork.AccessRequestRepository.GetPagedAsync(p);
        return Ok(result);
    }

    [HttpGet("my-requests")]
    public async Task<ActionResult<PagedResult<AccessRequestDto>>> GetUserAccessRights(

            [FromQuery] PaginationParams pagination)
    {
        try
        {
            var userId = _currentUser.UserId;
            var result = await _unitOfWork.AccessRequestRepository.GetRequestsByUserIdAsync(userId, pagination);
            _logger.LogInformation("Retrieved access requests for user {UserId}", userId);
            return Ok(result);

        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving access requests for user {UserId}", _currentUser.UserId);
            return BadRequest(new { success = false, message = ex.Message });
        }
    }

    [HttpGet("{id:int}")]
    public async Task<IActionResult> Get(int id)
    {
        _logger.LogInformation("Retrieving access request with ID {Id}", id);
        var entity = await _unitOfWork.AccessRequestRepository.GetByIdAsync(id);
        return entity == null ? NotFound() : Ok(entity);
    }


    [HttpDelete("{id:int}")]
    public async Task<IActionResult> Delete(int id)
    {

        await _unitOfWork.AccessRequestRepository.DeleteAsync(id);
        await _unitOfWork.SaveChangesAsync();
        _logger.LogInformation("Deleted access request with ID {Id}", id);
        return Ok(new ResponseAPI(200, "Access request deleted successfully."));
    }

    [HttpPost]
    public async Task<IActionResult> Create([FromBody] AccessRequestCreateDto dto)
    {
        // var userId = User.FindFirstValue(ClaimTypes.NameIdentifier)!;
        var userId = _currentUser.UserId;
        if (!dto.RequestRead && !dto.RequestWrite && !dto.RequestDelete)
            return BadRequest("At least one permission must be requested.");
        if (await _unitOfWork.AccessRequestRepository.ExistsPendingAsync(dto.DocumentId, userId))
            return Conflict("A pending request already exists for this document.");


        var entity = new AccessRequest
        {

            Message = dto.Message,
            DocumentId = dto.DocumentId,
            RequesterId = userId,
            RequestRead = dto.RequestRead,
            RequestWrite = dto.RequestWrite,
            RequestDelete = dto.RequestDelete,
            DecidedById = userId,
            DecisionAt = System.DateTime.UtcNow,

            Status = "Pending"
        };
        await _unitOfWork.AccessRequestRepository.AddAsync(entity);
        await _unitOfWork.SaveChangesAsync();
        _logger.LogInformation("Created new access request with ID {Id}", entity.Id);
        return CreatedAtAction(nameof(Get), new { id = entity.Id }, entity);
    }

    [HttpPost("{id}/decision")]
    // [Authorize(Roles = "Admin,Manager")]
    public async Task<IActionResult> Decide(int id, [FromBody] AccessRequestDecisionDto dto)
    {
        var currentUserId = _currentUser.UserId;
        var entity = await _unitOfWork.AccessRequestRepository.GetByIdAsync(id);
        if (entity == null) return NotFound();
        if (entity.Status != "Pending") return BadRequest("Already decided.");

        entity.Status = dto.Approve ? "Approved" : "Rejected";
        entity.DecisionAt = System.DateTime.UtcNow;
        entity.DecidedById = currentUserId;

        // var updatedEntity = await _unitOfWork.AccessRequestRepository.UpdateAsync(entity);

        // if (updatedEntity == null) return BadRequest("Update failed.");
        var newReq = new AccessRequest
        {
            Id = entity.Id,
            DocumentId = entity.DocumentId,
            RequesterId = entity.RequesterId,
            RequestRead = entity.RequestRead,
            RequestWrite = entity.RequestWrite,
            RequestDelete = entity.RequestDelete,
            Status = entity.Status,
            Message = "dd",
            CreatedAt = entity.CreatedAt,
            DecisionAt = entity.DecisionAt,
            DecidedById = entity.DecidedById
        };
        var updatedEntity = await _unitOfWork.AccessRequestRepository.UpdateAsync(newReq);
        Console.WriteLine("Updated Entity: *************************************************" + updatedEntity.Status);
        Console.WriteLine("Updated Entity: *************************************************" + updatedEntity.Status);
        // Optional: grant rights if approved
        if (dto.Approve)
        {
            await
             _accessRightService.GrantAsync(entity.RequesterId,
             entity.DocumentId,
            read: entity.RequestRead,
            write: entity.RequestWrite,
            delete: entity.RequestDelete);
        }

        Console.WriteLine("Decision made: *************************************************" + dto);

        _logger.LogInformation("Access request with ID {Id} has been {Status} by user {UserId}", id, entity.Status, currentUserId);
        await _unitOfWork.SaveChangesAsync();
        return Ok(entity);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, [FromBody] AccessRequestCreateDto dto)
    {
        var currentUserId = _currentUser.UserId;
        var entity = await _unitOfWork.AccessRequestRepository.GetByIdAsync(id);
        if (entity == null) return NotFound();
        entity.DocumentId = dto.DocumentId;
        entity.RequestRead = dto.RequestRead;
        entity.RequestWrite = dto.RequestWrite;
        entity.RequestDelete = dto.RequestDelete;
        entity.Message = dto.Message;
        entity.DecidedById = currentUserId;
        entity.DecisionAt = System.DateTime.UtcNow;

        //await _unitOfWork.AccessRequestRepository.UpdateAsync(entity);
        await _unitOfWork.SaveChangesAsync();
        _logger.LogInformation("Updated access request with ID {Id}", id);
        return Ok(entity);
    }

    // [HttpDelete("{id}")]
    // [Authorize(Roles = "Admin")]
    // public async Task<IActionResult> Delete(int id)
    // {
    //     var entity = await _unitOfWork.GetByIdAsync(id);
    //     if (entity == null) return NotFound();

    //     // implement actual delete logic
    //      await _unitOfWork.DeleteAsync(entity);
    //      await _unitOfWork.SaveChangesAsync();

    //     return NoContent();
    // }

}