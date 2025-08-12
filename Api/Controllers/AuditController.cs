using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Core.Interfaces;
using Core.Entities;
using Core.DTO;
using System.Security.Claims;
using Core.DTOs;

namespace API.Controllers;

[ApiController]
[Route("api/[controller]")]
// Require authentication for all audit log operations
public class AuditLogController : ControllerBase
{
    private readonly IAuditLogRepository _auditLogRepository;
    private readonly ILogger<AuditLogController> _logger;

    public AuditLogController(
        IAuditLogRepository auditLogRepository,
        ILogger<AuditLogController> logger)
    {
        _auditLogRepository = auditLogRepository;
        _logger = logger;
    }

    /// <summary>
    /// Get all audit logs with pagination
    /// </summary>
    [HttpGet]
    // [Authorize(Roles = "Admin,SuperAdmin")]
    public async Task<ActionResult<PagedResult<AuditLogDto>>> GetAuditLogs([FromQuery] PaginationParams paginationParams)
    {
        try
        {
            var result = await _auditLogRepository.GetPagedAsync(paginationParams);
            
            var auditLogDtos = result.Data.Select(al => new AuditLogDto
            {
                Id = al.Id,
                UserId = al.UserId,
                UserName = al.User?.UserName,
                ActionType = al.ActionType,
                Action = al.Action,
                TargetEntity = al.TargetEntity,
                Description = al.Description,
                IPAddress = al.IPAddress,
                UserAgent = al.UserAgent,
                Timestamp = al.Timestamp
            });

            var pagedResult = auditLogDtos.ToPagedResult(
                result.PageNumber,
                result.PageSize,
                result.TotalRecords,
                result.Search,
                result.SortBy,
                result.SortDirection);

            return Ok(pagedResult);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving audit logs");
            return StatusCode(500, "An error occurred while retrieving audit logs");
        }
    }

    /// <summary>
    /// Get audit logs with advanced filtering
    /// </summary>
    [HttpGet("filtered")]
    // [Authorize(Roles = "Admin,SuperAdmin")]
    public async Task<ActionResult<PagedResult<AuditLogDto>>> GetAuditLogsWithFilters(
        [FromQuery] PaginationParams paginationParams,
        [FromQuery] string actionType = null,
        [FromQuery] DateTime? startDate = null,
        [FromQuery] DateTime? endDate = null,
        [FromQuery] string userId = null)
    {
        try
        {
            var result = await _auditLogRepository.GetPagedWithFiltersAsync(
                paginationParams, actionType, startDate, endDate, userId);
            
            var auditLogDtos = result.Data.Select(al => new AuditLogDto
            {
                Id = al.Id,
                UserId = al.UserId,
                UserName = al.User?.UserName,
                ActionType = al.ActionType,
                Action = al.Action,
                TargetEntity = al.TargetEntity,
                Description = al.Description,
                IPAddress = al.IPAddress,
                UserAgent = al.UserAgent,
                Timestamp = al.Timestamp
            });

            var pagedResult = auditLogDtos.ToPagedResult(
                result.PageNumber,
                result.PageSize,
                result.TotalRecords,
                result.Search,
                result.SortBy,
                result.SortDirection);

            return Ok(pagedResult);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving filtered audit logs");
            return StatusCode(500, "An error occurred while retrieving filtered audit logs");
        }
    }

    /// <summary>
    /// Get audit log by ID
    /// </summary>
    [HttpGet("{id}")]
    // [Authorize(Roles = "Admin,SuperAdmin")]
    public async Task<ActionResult<AuditLogDto>> GetAuditLog(int id)
    {
        try
        {
            var auditLog = await _auditLogRepository.GetByIdAsync(id);
            
            if (auditLog == null)
            {
                return NotFound($"Audit log with ID {id} not found");
            }

            var auditLogDto = new AuditLogDto
            {
                Id = auditLog.Id,
                UserId = auditLog.UserId,
                UserName = auditLog.User?.UserName,
                ActionType = auditLog.ActionType,
                Action = auditLog.Action,
                TargetEntity = auditLog.TargetEntity,
                Description = auditLog.Description,
                IPAddress = auditLog.IPAddress,
                UserAgent = auditLog.UserAgent,
                Timestamp = auditLog.Timestamp
            };

            return Ok(auditLogDto);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving audit log with ID {Id}", id);
            return StatusCode(500, "An error occurred while retrieving the audit log");
        }
    }

    /// <summary>
    /// Get current user's audit logs
    /// </summary>
    [HttpGet("my-logs")]
    public async Task<ActionResult<PagedResult<AuditLogDto>>> GetMyAuditLogs([FromQuery] PaginationParams paginationParams)
    {
        try
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            
            if (string.IsNullOrEmpty(userId))
            {
                // return Unauthorized("User ID not found in token");
            }

            var result = await _auditLogRepository.GetByUserIdPagedAsync(userId, paginationParams);
            
            var auditLogDtos = result.Data.Select(al => new AuditLogDto
            {
                Id = al.Id,
                UserId = al.UserId,
                UserName = al.User?.UserName,
                ActionType = al.ActionType,
                Action = al.Action,
                TargetEntity = al.TargetEntity,
                Description = al.Description,
                IPAddress = al.IPAddress,
                UserAgent = al.UserAgent,
                Timestamp = al.Timestamp
            });

            var pagedResult = auditLogDtos.ToPagedResult(
                result.PageNumber,
                result.PageSize,
                result.TotalRecords,
                result.Search,
                result.SortBy,
                result.SortDirection);

            return Ok(pagedResult);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving user audit logs");
            return StatusCode(500, "An error occurred while retrieving your audit logs");
        }
    }

    /// <summary>
    /// Get audit logs by user ID
    /// </summary>
    [HttpGet("user/{userId}")]
    // [Authorize(Roles = "Admin,SuperAdmin")]
    public async Task<ActionResult<PagedResult<AuditLogDto>>> GetUserAuditLogs(
        string userId, 
        [FromQuery] PaginationParams paginationParams)
    {
        try
        {
            var result = await _auditLogRepository.GetByUserIdPagedAsync(userId, paginationParams);
            
            var auditLogDtos = result.Data.Select(al => new AuditLogDto
            {
                Id = al.Id,
                UserId = al.UserId,
                UserName = al.User?.UserName,
                ActionType = al.ActionType,
                Action = al.Action,
                TargetEntity = al.TargetEntity,
                Description = al.Description,
                IPAddress = al.IPAddress,
                UserAgent = al.UserAgent,
                Timestamp = al.Timestamp
            });

            var pagedResult = auditLogDtos.ToPagedResult(
                result.PageNumber,
                result.PageSize,
                result.TotalRecords,
                result.Search,
                result.SortBy,
                result.SortDirection);

            return Ok(pagedResult);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving audit logs for user {UserId}", userId);
            return StatusCode(500, "An error occurred while retrieving user audit logs");
        }
    }

    /// <summary>
    /// Get audit logs by date range
    /// </summary>
    [HttpGet("date-range")]
    // [Authorize(Roles = "Admin,SuperAdmin")]
    public async Task<ActionResult<PagedResult<AuditLogDto>>> GetAuditLogsByDateRange(
        [FromQuery] DateTime startDate,
        [FromQuery] DateTime endDate,
        [FromQuery] PaginationParams paginationParams)
    {
        try
        {
            if (startDate > endDate)
            {
                return BadRequest("Start date cannot be greater than end date");
            }

            var result = await _auditLogRepository.GetByDateRangePagedAsync(startDate, endDate, paginationParams);
            
            var auditLogDtos = result.Data.Select(al => new AuditLogDto
            {
                Id = al.Id,
                UserId = al.UserId,
                UserName = al.User?.UserName,
                ActionType = al.ActionType,
                Action = al.Action,
                TargetEntity = al.TargetEntity,
                Description = al.Description,
                IPAddress = al.IPAddress,
                UserAgent = al.UserAgent,
                Timestamp = al.Timestamp
            });

            var pagedResult = auditLogDtos.ToPagedResult(
                result.PageNumber,
                result.PageSize,
                result.TotalRecords,
                result.Search,
                result.SortBy,
                result.SortDirection);

            return Ok(pagedResult);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving audit logs by date range");
            return StatusCode(500, "An error occurred while retrieving audit logs by date range");
        }
    }

    /// <summary>
    /// Create a new audit log entry
    /// </summary>
    [HttpPost]
    // [Authorize(Roles = "Admin,SuperAdmin")]
    public async Task<ActionResult<AuditLogDto>> CreateAuditLog([FromBody] CreateAuditLogDto createDto)
    {
        try
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var auditLog = new AuditLog
            {
                UserId = createDto.UserId,
                ActionType = createDto.ActionType,
                Action = createDto.Action,
                TargetEntity = createDto.TargetEntity,
                Description = createDto.Description,
                IPAddress = createDto.IPAddress ?? GetClientIpAddress(),
                UserAgent = createDto.UserAgent ?? Request.Headers["User-Agent"].ToString(),
                Timestamp = DateTime.UtcNow
            };

            var createdAuditLog = await _auditLogRepository.CreateAsync(auditLog);
            
            var auditLogDto = new AuditLogDto
            {
                Id = createdAuditLog.Id,
                UserId = createdAuditLog.UserId,
                UserName = createdAuditLog.User?.UserName,
                ActionType = createdAuditLog.ActionType,
                Action = createdAuditLog.Action,
                TargetEntity = createdAuditLog.TargetEntity,
                Description = createdAuditLog.Description,
                IPAddress = createdAuditLog.IPAddress,
                UserAgent = createdAuditLog.UserAgent,
                Timestamp = createdAuditLog.Timestamp
            };

            return CreatedAtAction(nameof(GetAuditLog), new { id = auditLogDto.Id }, auditLogDto);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error creating audit log");
            return StatusCode(500, "An error occurred while creating the audit log");
        }
    }

    /// <summary>
    /// Update an audit log entry
    /// </summary>
    [HttpPut("{id}")]
    // [Authorize(Roles = "SuperAdmin")]
    public async Task<ActionResult<AuditLogDto>> UpdateAuditLog(int id, [FromBody] UpdateAuditLogDto updateDto)
    {
        try
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var existingAuditLog = await _auditLogRepository.GetByIdAsync(id);
            if (existingAuditLog == null)
            {
                return NotFound($"Audit log with ID {id} not found");
            }

            // Update only allowed fields
            existingAuditLog.Description = updateDto.Description ?? existingAuditLog.Description;
            existingAuditLog.ActionType = updateDto.ActionType ?? existingAuditLog.ActionType;

            var updatedAuditLog = await _auditLogRepository.UpdateAsync(existingAuditLog);
            
            var auditLogDto = new AuditLogDto
            {
                Id = updatedAuditLog.Id,
                UserId = updatedAuditLog.UserId,
                UserName = updatedAuditLog.User?.UserName,
                ActionType = updatedAuditLog.ActionType,
                Action = updatedAuditLog.Action,
                TargetEntity = updatedAuditLog.TargetEntity,
                Description = updatedAuditLog.Description,
                IPAddress = updatedAuditLog.IPAddress,
                UserAgent = updatedAuditLog.UserAgent,
                Timestamp = updatedAuditLog.Timestamp
            };

            return Ok(auditLogDto);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error updating audit log with ID {Id}", id);
            return StatusCode(500, "An error occurred while updating the audit log");
        }
    }

    /// <summary>
    /// Delete an audit log entry
    /// </summary>
    [HttpDelete("{id}")]
    // [Authorize(Roles = "SuperAdmin")]
    public async Task<ActionResult> DeleteAuditLog(int id)
    {
        try
        {
            var exists = await _auditLogRepository.ExistsAsync(id);
            if (!exists)
            {
                return NotFound($"Audit log with ID {id} not found");
            }

            await _auditLogRepository.DeleteAsync(id);
            
            // Log the deletion
            _logger.LogWarning("Audit log with ID {Id} was deleted by user {UserId}", 
                id, User.FindFirst(ClaimTypes.NameIdentifier)?.Value);

            return NoContent();
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error deleting audit log with ID {Id}", id);
            return StatusCode(500, "An error occurred while deleting the audit log");
        }
    }

    /// <summary>
    /// Delete multiple audit log entries
    /// </summary>
    [HttpDelete("bulk")]
    // [Authorize(Roles = "SuperAdmin")]
    public async Task<ActionResult> DeleteAuditLogs([FromBody] DeleteAuditLogsDto deleteDto)
    {
        try
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _auditLogRepository.DeleteRangeAsync(deleteDto.Ids);
            
            // Log the bulk deletion
            _logger.LogWarning("Bulk deletion of {Count} audit logs by user {UserId}", 
                deleteDto.Ids.Count(), User.FindFirst(ClaimTypes.NameIdentifier)?.Value);

            return NoContent();
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error deleting multiple audit logs");
            return StatusCode(500, "An error occurred while deleting audit logs");
        }
    }

    /// <summary>
    /// Get audit log statistics
    /// </summary>
    [HttpGet("statistics")]
    // [Authorize(Roles = "Admin,SuperAdmin")]
    public async Task<ActionResult<AuditLogStatisticsDto>> GetStatistics()
    {
        try
        {
            var totalCount = await _auditLogRepository.GetCountAsync();
            var actionTypes = await _auditLogRepository.GetDistinctActionTypesAsync();
            var targetEntities = await _auditLogRepository.GetDistinctTargetEntitiesAsync();

            var statistics = new AuditLogStatisticsDto
            {
                TotalLogs = totalCount,
                ActionTypes = actionTypes.ToList(),
                TargetEntities = targetEntities.ToList(),
                GeneratedAt = DateTime.UtcNow
            };

            return Ok(statistics);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving audit log statistics");
            return StatusCode(500, "An error occurred while retrieving statistics");
        }
    }

    /// <summary>
    /// Get distinct action types
    /// </summary>
    [HttpGet("action-types")]
    // [Authorize(Roles = "Admin,SuperAdmin")]
    public async Task<ActionResult<IEnumerable<string>>> GetActionTypes()
    {
        try
        {
            var actionTypes = await _auditLogRepository.GetDistinctActionTypesAsync();
            return Ok(actionTypes);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving action types");
            return StatusCode(500, "An error occurred while retrieving action types");
        }
    }

    /// <summary>
    /// Get distinct target entities
    /// </summary>
    [HttpGet("target-entities")]
    // [Authorize(Roles = "Admin,SuperAdmin")]
    public async Task<ActionResult<IEnumerable<string>>> GetTargetEntities()
    {
        try
        {
            var targetEntities = await _auditLogRepository.GetDistinctTargetEntitiesAsync();
            return Ok(targetEntities);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving target entities");
            return StatusCode(500, "An error occurred while retrieving target entities");
        }
    }

    private string GetClientIpAddress()
    {
        var ipAddress = HttpContext.Connection.RemoteIpAddress?.ToString();
        
        // Check for forwarded IP (when behind proxy/load balancer)
        if (Request.Headers.ContainsKey("X-Forwarded-For"))
        {
            ipAddress = Request.Headers["X-Forwarded-For"].FirstOrDefault()?.Split(',')[0].Trim();
        }
        else if (Request.Headers.ContainsKey("X-Real-IP"))
        {
            ipAddress = Request.Headers["X-Real-IP"].FirstOrDefault();
        }

        return ipAddress ?? "Unknown";
    }
}