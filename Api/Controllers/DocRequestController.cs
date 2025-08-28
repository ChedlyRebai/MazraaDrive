using AutoMapper;
using Core.DTO;
using Core.Entities;
using Core.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class DocumentRequestController : BaseController
{
    public DocumentRequestController(ICurrentUserService currentUser, IUnitOfWork unitOfWork, IMapper mapper, IAuditLogRepository auditLogger = null)
        : base(currentUser, unitOfWork, mapper, auditLogger)
    {
    }

    [HttpGet]
    public async Task<ActionResult<DocumentRequestPagedResult>> GetDocumentRequests([FromQuery] DocumentRequestFilterDTO filter)
    {
        try{
            var pagedRequests = await _unitOfWork.DocRequestRepository.GetPagedAsync(filter);
            var requestDtos = _mapper.Map<IEnumerable<DocumentRequestDTO>>(pagedRequests.Data);

            var result = new DocumentRequestPagedResult
            {
                Data = requestDtos,
                PageNumber = pagedRequests.PageNumber,
                PageSize = pagedRequests.PageSize,
                TotalRecords = pagedRequests.TotalRecords,
                TotalPages = pagedRequests.TotalPages,
                HasPreviousPage = pagedRequests.HasPreviousPage,
                HasNextPage = pagedRequests.HasNextPage,
                Search = pagedRequests.Search,
                SortBy = pagedRequests.SortBy,
                SortDirection = pagedRequests.SortDirection,
                TotalPendingRequests = requestDtos.Count(r => r.Status == "Pending"),
                TotalProcessedRequests = requestDtos.Count(r => r.Status == "Completed"),
                TotalRejectedRequests = requestDtos.Count(r => r.Status == "Rejected")
            };

            //await _auditLogger.LogAsync("GetDocumentRequests", "Retrieved paged list of document requests", "10", "DocumentRequest");

            return Ok(result);
        }
        catch (Exception ex)
        {
            return BadRequest(new { success = false, message = ex.Message });
        }
    }


    [HttpGet("GetMyDepartmentDocumentRequests")]
    public async Task<ActionResult<DocumentRequestPagedResult>> GetMyDepartmentDocRequest([FromQuery] PaginationParams pagination)
    {

        var _currentUseriD = _currentUser.UserId;
        var _currentUserDepId= _unitOfWork.UserRepository.GetByIdAsync(_currentUseriD).Result.DepartmentId;
       // var _currentUserRoleId = _currentUser.RoleId;
        Console.WriteLine("Current User Department ID: " + _currentUserDepId);
        try

        {
            var pagedRequests = await _unitOfWork.DocRequestRepository.GetByDepartmentPagedAsync(_currentUserDepId, pagination);
            var requestDtos = _mapper.Map<IEnumerable<DocumentRequestDTO>>(pagedRequests.Data);

            var result = requestDtos.ToPagedResult(
                pagedRequests.PageNumber,
                pagedRequests.PageSize,
                pagedRequests.TotalRecords
            );

            //await _auditLogger.LogAsync("GetRequestsByDepartment", "Retrieved document requests by department", "10", "DocumentRequest");
            return Ok(result);
        }
        catch (Exception ex)
        {
            return BadRequest(new { success = false, message = ex.Message });
        }

    }

    [HttpGet("{id}")]
    public async Task<ActionResult<DocumentRequestDTO>> GetDocumentRequest(int id)
    {
        try
        {
            var request = await _unitOfWork.DocRequestRepository.GetByIdWithDetailsAsync(id);
            if (request == null)
                return NotFound(new { success = false, message = "Document request not found" });

            var requestDto = _mapper.Map<DocumentRequestDTO>(request);
            //await _auditLogger.LogAsync("GetDocumentRequest", "Retrieved document request details", "10", "DocumentRequest");
            return Ok(requestDto);
        }
        catch (Exception ex)
        {
            return BadRequest(new { success = false, message = ex.Message });
        }
    }

    [HttpPost]
    public async Task<ActionResult<DocumentRequestDTO>> CreateDocumentRequest([FromBody] CreateDocumentRequestDTO createDto)
    {
        try
        {
            var currentUserId = _currentUser.UserId;
            var currentDepId = _unitOfWork.UserRepository.GetByIdAsync(currentUserId).Result.DepartmentId;
            Console.WriteLine("Creating document request with data: " + createDto);
            if (!ModelState.IsValid)
                return BadRequest(new { success = false, message = "Invalid data", errors = ModelState });

            var request = _mapper.Map<DocumentRequest>(createDto);
            request.RequestedAt = DateTime.UtcNow;
            request.RequesterId = currentUserId; // Replace with actual requester ID from authenticated user
            request.DepartmentId = currentDepId;
            request.CreatedAt = DateTime.UtcNow;
            request.DocumentType = createDto.DocumentType ?? string.Empty;
            request.Priority = createDto.Priority ?? string.Empty;
            request.Description = createDto.Description ?? string.Empty;
            request.Status = "Pending";

            await _unitOfWork.DocRequestRepository.AddAsync(request);
            // if (!success)
            //     return BadRequest(new { success = false, message = "Failed to create document request" });

            // await _unitOfWork.CompleteAsync();

            var createdRequest = await _unitOfWork.DocRequestRepository.GetByIdWithDetailsAsync(request.Id);
            var requestDto = _mapper.Map<DocumentRequestDTO>(createdRequest);

            //await _auditLogger.LogAsync("CreateDocumentRequest", "Created new document request", "10", "DocumentRequest");
            return CreatedAtAction(nameof(GetDocumentRequest), new { id = request.Id }, requestDto);
        }
        catch (Exception ex)
        {
            return BadRequest(new { success = false, message = ex.Message });
        }
    }

    [HttpPut("{id}")]
    public async Task<ActionResult<DocumentRequestDTO>> UpdateDocumentRequest(int id, [FromBody] UpdateDocumentRequestDTO updateDto)
    {
        try{

        var currentUserId = _currentUser.UserId;
        var currentDepId = _unitOfWork.UserRepository.GetByIdAsync(currentUserId).Result.DepartmentId;
        
            if (!ModelState.IsValid)
                return BadRequest(new { success = false, message = "Invalid data", errors = ModelState });

            var existingRequest = await _unitOfWork.DocRequestRepository.GetByIdAsync(id);
            existingRequest.ProcessedById = currentUserId;
            if (existingRequest == null)
                return NotFound(new { success = false, message = "Document request not found" });

            _mapper.Map(updateDto, existingRequest);
            existingRequest.UpdatedAt = DateTime.UtcNow;

            await _unitOfWork.DocRequestRepository.UpdateAsync(existingRequest);
            // if (!success)
            //     return BadRequest(new { success = false, message = "Failed to update document request" });

            // await _unitOfWork.CompleteAsync();

            var updatedRequest = await _unitOfWork.DocRequestRepository.GetByIdWithDetailsAsync(id);
            var requestDto = _mapper.Map<DocumentRequestDTO>(updatedRequest);
            //await _auditLogger.LogAsync("UpdateDocumentRequest", "Updated document request details", "10", "DocumentRequest");
            return Ok(requestDto);
        }
        catch (Exception ex)
        {
            return BadRequest(new { success = false, message = ex.Message });
        }
    }

    [HttpPut("{id}/status")]
    public async Task<ActionResult> UpdateRequestStatus(int id, [FromBody] UpdateRequestStatusDTO statusDto)
    {
        try
        {
            var currentUserId = _currentUser.UserId;
            var success = await _unitOfWork.DocRequestRepository.UpdateStatusAsync(id, statusDto.Status, currentUserId);

            if (!success)
                return NotFound(new { success = false, message = "Document request not found" });

            // await _unitOfWork.CompleteAsync();
            //await _auditLogger.LogAsync("UpdateRequestStatus", "Updated document request status", currentUserId, "DocumentRequest");
            return Ok(new { success = true, message = "Status updated successfully" });
        }
        catch (Exception ex)
        {
            return BadRequest(new { success = false, message = ex.Message });
        }
    }

    [HttpPut("{id}/assign-document")]
    public async Task<ActionResult> AssignResponseDocument(int id, [FromBody] AssignDocumentDTO assignDto)
    {
        try
        {
            var currentUserId = "10";
            var success = await _unitOfWork.DocRequestRepository.AssignResponseDocumentAsync(
                id, assignDto.DocumentId, currentUserId);

            if (!success)
                return NotFound(new { success = false, message = "Document request not found" });

            //  await _unitOfWork.CompleteAsync();
            //await _auditLogger.LogAsync("AssignResponseDocument", "Assigned response document to request", currentUserId, "DocumentRequest");
            return Ok(new { success = true, message = "Response document assigned successfully" });
        }
        catch (Exception ex)
        {
            return BadRequest(new { success = false, message = ex.Message });
        }
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult> DeleteDocumentRequest(int id)
    {
        try
        {
            await _unitOfWork.DocRequestRepository.DeleteAsync(id);
            // if (!success)
            //     return NotFound(new { success = false, message = "Document request not found" });

            // await _unitOfWork.CompleteAsync();
            //await _auditLogger.LogAsync("DeleteDocumentRequest", "Deleted document request", "10", "DocumentRequest");
            return Ok(new { success = true, message = "Document request deleted successfully" });
        }
        catch (Exception ex)
        {
            return BadRequest(new { success = false, message = ex.Message });
        }
    }

    [HttpGet("requester/{requesterId}")]
    public async Task<ActionResult<PagedResult<DocumentRequestDTO>>> GetRequestsByRequester(
        string requesterId, [FromQuery] PaginationParams pagination)
    {
        try
        {
            var pagedRequests = await _unitOfWork.DocRequestRepository.GetByRequesterPagedAsync(requesterId, pagination);
            var requestDtos = _mapper.Map<IEnumerable<DocumentRequestDTO>>(pagedRequests.Data);

            var result = requestDtos.ToPagedResult(
                pagedRequests.PageNumber,
                pagedRequests.PageSize,
                pagedRequests.TotalRecords
            );

            return Ok(result);
        }
        catch (Exception ex)
        {
            return BadRequest(new { success = false, message = ex.Message });
        }
    }

    [HttpGet("department/{departmentId}")]
    public async Task<ActionResult<PagedResult<DocumentRequestDTO>>> GetRequestsByDepartment(
        int departmentId, [FromQuery] PaginationParams pagination)
    {
        try
        {
            var pagedRequests = await _unitOfWork.DocRequestRepository.GetByDepartmentPagedAsync(departmentId, pagination);
            var requestDtos = _mapper.Map<IEnumerable<DocumentRequestDTO>>(pagedRequests.Data);

            var result = requestDtos.ToPagedResult(
                pagedRequests.PageNumber,
                pagedRequests.PageSize,
                pagedRequests.TotalRecords
            );

            //await _auditLogger.LogAsync("GetRequestsByDepartment", "Retrieved document requests by department", "10", "DocumentRequest");
            return Ok(result);
        }
        catch (Exception ex)
        {
            return BadRequest(new { success = false, message = ex.Message });
        }
    }

    [HttpGet("statistics")]
    public async Task<ActionResult> GetRequestStatistics([FromQuery] int? departmentId = null)
    {
        try
        {
            var statistics = await _unitOfWork.DocRequestRepository.GetRequestStatisticsAsync(departmentId);
            //await _auditLogger.LogAsync("GetRequestStatistics", "Retrieved document request statistics", "10", "DocumentRequest");
            return Ok(statistics);
        }
        catch (Exception ex)
        {
            return BadRequest(new { success = false, message = ex.Message });
        }
    }
}

public class UpdateRequestStatusDTO
{
    public string Status { get; set; } = string.Empty;
}

public class AssignDocumentDTO
{
    public int DocumentId { get; set; }
}