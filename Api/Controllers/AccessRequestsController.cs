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

namespace API.Controllers;

[ApiController]
[Route("api/[controller]")]
// [Authorize]
public class AccessRequestsController : BaseController
{

    private readonly IAccessRequestRepository _unitOfWork;
    private readonly IAccessRightService _accessRightService; // optional if you auto-create rights
    
    private readonly IAuditLogRepository _auditLogger;
    public AccessRequestsController(IUnitOfWork unitOfWork, IAccessRightService accessRightService, IMapper mapper, IAuditLogRepository auditLogger) : base(unitOfWork, mapper)
    {
        _auditLogger = auditLogger;
        _accessRightService = accessRightService;
    }
   
    [HttpGet]
    public async Task<IActionResult> GetPaged([FromQuery] PaginationParams p)
    {
        var result = await _unitOfWork.GetPagedAsync(p);
        return Ok(result);
    }

    [HttpGet("{id:int}")]
    public async Task<IActionResult> Get(int id)
    {
        var entity = await _unitOfWork.GetByIdAsync(id);
        return entity == null ? NotFound() : Ok(entity);
    }

    [HttpPost]
    public async Task<IActionResult> Create([FromBody] AccessRequestCreateDto dto)
    {
        // var userId = User.FindFirstValue(ClaimTypes.NameIdentifier)!;
        var userId = "10";
        if (!dto.RequestRead && !dto.RequestWrite && !dto.RequestDelete)
            return BadRequest("At least one permission must be requested.");
        if (await _unitOfWork.ExistsPendingAsync(dto.DocumentId, userId))
            return Conflict("A pending request already exists for this document.");

        var entity = new AccessRequest
        {
            Message = dto.Message,
            DocumentId = dto.DocumentId,
            RequesterId = userId,
            RequestRead = dto.RequestRead,
            RequestWrite = dto.RequestWrite,
            RequestDelete = dto.RequestDelete,
            Status = "Pending"
        };
        await _unitOfWork.AddAsync(entity);
        await _unitOfWork.SaveChangesAsync();
        return CreatedAtAction(nameof(Get), new { id = entity.Id }, entity);
    }

    [HttpPost("{id}/decision")]
    // [Authorize(Roles = "Admin,Manager")]
    public async Task<IActionResult> Decide(int id, [FromBody] AccessRequestDecisionDto dto)
    {
        var entity = await _unitOfWork.GetByIdAsync(id);
        if (entity == null) return NotFound();
        if (entity.Status != "Pending") return BadRequest("Already decided.");

        entity.Status = dto.Approve ? "Approved" : "Rejected";
        entity.DecisionAt = System.DateTime.UtcNow;
        entity.DecidedById = User.FindFirstValue(ClaimTypes.NameIdentifier);

        // Optional: grant rights if approved
        if (dto.Approve)
        {
            await _accessRightService.GrantAsync(entity.RequesterId, entity.DocumentId,
                read: entity.RequestRead, write: entity.RequestWrite, delete: entity.RequestDelete);
        }

        await _unitOfWork.SaveChangesAsync();
        return Ok(entity);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, [FromBody] AccessRequestCreateDto dto)
    {
        var entity = await _unitOfWork.GetByIdAsync(id);
        if (entity == null) return NotFound();

        entity.DocumentId = dto.DocumentId;
        entity.RequestRead = dto.RequestRead;
        entity.RequestWrite = dto.RequestWrite;
        entity.RequestDelete = dto.RequestDelete;
        entity.Message = dto.Message;

        
        
        await _unitOfWork.UpdateAsync(entity);
        await _unitOfWork.SaveChangesAsync();
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