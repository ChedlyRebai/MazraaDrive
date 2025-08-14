using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Core.Interfaces;

using Core.DTOs.AccessRequests;
using Core.Entities;
using System.Security.Claims;
using Core.DTO;

namespace API.Controllers;

[ApiController]
[Route("api/[controller]")]
// [Authorize]
public class AccessRequestsController : ControllerBase
{
    private readonly IAccessRequestRepository _repo;
    private readonly IAccessRightService _accessRightService; // optional if you auto-create rights
    public AccessRequestsController(IAccessRequestRepository repo, IAccessRightService accessRightService)
    {
        _repo = repo;
        _accessRightService = accessRightService;
    }

    [HttpGet]
    public async Task<IActionResult> GetPaged([FromQuery] PaginationParams p)
    {
        var result = await _repo.GetPagedAsync(p);
        return Ok(result);
    }

    [HttpGet("{id:int}")]
    public async Task<IActionResult> Get(int id)
    {
        var entity = await _repo.GetByIdAsync(id);
        return entity == null ? NotFound() : Ok(entity);
    }

    [HttpPost]
    public async Task<IActionResult> Create([FromBody] AccessRequestCreateDto dto)
    {
        // var userId = User.FindFirstValue(ClaimTypes.NameIdentifier)!;
        var userId = "10";
        if (!dto.RequestRead && !dto.RequestWrite && !dto.RequestDelete)
            return BadRequest("At least one permission must be requested.");
        if (await _repo.ExistsPendingAsync(dto.DocumentId, userId))
            return Conflict("A pending request already exists for this document.");

        var entity = new AccessRequest
        {
            DocumentId = dto.DocumentId,
            RequesterId = userId,
            RequestRead = dto.RequestRead,
            RequestWrite = dto.RequestWrite,
            RequestDelete = dto.RequestDelete,
            Status = "Pending"
        };
        await _repo.AddAsync(entity);
        await _repo.SaveChangesAsync();
        return CreatedAtAction(nameof(Get), new { id = entity.Id }, entity);
    }

    [HttpPost("{id}/decision")]
    // [Authorize(Roles = "Admin,Manager")]
    public async Task<IActionResult> Decide(int id, [FromBody] AccessRequestDecisionDto dto)
    {
        var entity = await _repo.GetByIdAsync(id);
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

        await _repo.SaveChangesAsync();
        return Ok(entity);
    }

  // [HttpDelete("{id}")]
// [Authorize(Roles = "Admin")]
// public async Task<IActionResult> Delete(int id)
// {
//     var entity = await _repo.GetByIdAsync(id);
//     if (entity == null) return NotFound();

//     // implement actual delete logic
//      await _repo.DeleteAsync(entity);
//      await _repo.SaveChangesAsync();

//     return NoContent();
// }

}