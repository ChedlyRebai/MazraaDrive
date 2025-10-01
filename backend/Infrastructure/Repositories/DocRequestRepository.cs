using Core.DTO;
using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories;

public class DocRequestRepository : GenericRepository<DocumentRequest>, IDocRequestRepository
{
    private readonly AppDbContext _context;
    public DocRequestRepository(AppDbContext context) : base(context)
    {

        _context = context ?? throw new ArgumentNullException(nameof(context));
    }


    public async Task<PagedResult<DocumentRequest>> GetPagedAsync(DocumentRequestFilterDTO filter)
    {
        var query = _context.DocumentRequests
            .Include(dr => dr.Requester)
            .Include(dr => dr.Department)
            .Include(dr => dr.ResponseDocument)
            .Include(dr => dr.ProcessedBy)
            .AsQueryable();

        // Apply filters
        // if (filter.RequesterId.HasValue)
        // {
        //     query = query.Where(dr => dr.RequesterId == filter.RequesterId.Value);
        // }

        if (filter.DepartmentId.HasValue)
        {
            query = query.Where(dr => dr.DepartmentId == filter.DepartmentId.Value);
        }

        if (!string.IsNullOrEmpty(filter.DocumentType))
        {
            query = query.Where(dr => dr.DocumentType.Contains(filter.DocumentType));
        }

        if (!string.IsNullOrEmpty(filter.Priority))
        {
            query = query.Where(dr => dr.Priority == filter.Priority);
        }

        if (!string.IsNullOrEmpty(filter.Status))
        {
            query = query.Where(dr => dr.Status == filter.Status);
        }

        if (filter.RequestedFrom.HasValue)
        {
            query = query.Where(dr => dr.RequestedAt >= filter.RequestedFrom.Value);
        }

        if (filter.RequestedTo.HasValue)
        {
            query = query.Where(dr => dr.RequestedAt <= filter.RequestedTo.Value);
        }

        // if (filter.ProcessedById.has)
        // {
        //     query = query.Where(dr => dr.ProcessedById == filter.ProcessedById);
        // }

        if (!string.IsNullOrEmpty(filter.Search))
        {
            query = query.Where(dr =>
                dr.DocumentType.Contains(filter.Search) ||
                dr.Description.Contains(filter.Search) ||

                dr.Department.Name.Contains(filter.Search));
        }

        // Apply sorting
        query = ApplySorting(query, filter.SortBy, filter.SortDirection);

        var totalRecords = await query.CountAsync();

        var requests = await query
            .Skip((filter.PageNumber - 1) * filter.PageSize)
            .Take(filter.PageSize)
            .ToListAsync();

        return new PagedResult<DocumentRequest>
        {
            Data = requests,
            TotalRecords = totalRecords,
            PageNumber = filter.PageNumber,
            PageSize = filter.PageSize,
            TotalPages = (int)Math.Ceiling((double)totalRecords / filter.PageSize),
            HasNextPage = filter.PageNumber * filter.PageSize < totalRecords,
            HasPreviousPage = filter.PageNumber > 1,
            Search = filter.Search,
            SortBy = filter.SortBy,
            SortDirection = filter.SortDirection
        };
    }

    public async Task<DocumentRequest?> GetByIdWithDetailsAsync(int id)
    {
        return await _context.DocumentRequests
            .Include(dr => dr.Requester)
            .Include(dr => dr.Department)
            .Include(dr => dr.ResponseDocument)
            .Include(dr => dr.ProcessedBy)
            .FirstOrDefaultAsync(dr => dr.Id == id);
    }

    public async Task<IEnumerable<DocumentRequest>> GetByRequesterAsync(string requesterId)
    {
        return await _context.DocumentRequests
            .Include(dr => dr.Department)
            .Include(dr => dr.ResponseDocument)
            .Include(dr => dr.ProcessedBy)
            .Where(dr => dr.RequesterId == requesterId)
            .OrderByDescending(dr => dr.RequestedAt)
            .ToListAsync();
    }

    public async Task<IEnumerable<DocumentRequest>> GetByDepartmentAsync(int departmentId)
    {
        return await _context.DocumentRequests
            .Include(dr => dr.Requester)
            .Include(dr => dr.ResponseDocument)
            .Include(dr => dr.ProcessedBy)
            .Where(dr => dr.DepartmentId == departmentId)
            .OrderByDescending(dr => dr.RequestedAt)
            .ToListAsync();
    }

    public async Task<IEnumerable<DocumentRequest>> GetByStatusAsync(string status)
    {
        return await _context.DocumentRequests
            .Include(dr => dr.Requester)
            .Include(dr => dr.Department)
            .Include(dr => dr.ResponseDocument)
            .Include(dr => dr.ProcessedBy)
            .Where(dr => dr.Status == status)
            .OrderByDescending(dr => dr.RequestedAt)
            .ToListAsync();
    }

    public async Task<PagedResult<DocumentRequest>> GetByRequesterPagedAsync(string requesterId, PaginationParams pagination)
    {
        var query = _context.DocumentRequests
            .Include(dr => dr.Department)
            .Include(dr => dr.ResponseDocument)
            .Include(dr => dr.ProcessedBy)
            .Where(dr => dr.RequesterId == requesterId)
            .OrderByDescending(dr => dr.RequestedAt);

        var totalRecords = await query.CountAsync();

        var requests = await query
            .Skip((pagination.PageNumber - 1) * pagination.PageSize)
            .Take(pagination.PageSize)
            .ToListAsync();

        return new PagedResult<DocumentRequest>
        {
            Data = requests,
            TotalRecords = totalRecords,
            PageNumber = pagination.PageNumber,
            PageSize = pagination.PageSize,
            TotalPages = (int)Math.Ceiling((double)totalRecords / pagination.PageSize),
            HasNextPage = pagination.PageNumber * pagination.PageSize < totalRecords,
            HasPreviousPage = pagination.PageNumber > 1
        };
    }

    public async Task<PagedResult<DocumentRequest>> GetByDepartmentPagedAsync(int departmentId, PaginationParams pagination)
    {
        var query = _context.DocumentRequests
            .Include(dr => dr.Requester)
            .Include(dr => dr.ResponseDocument)
            .Include(dr => dr.ProcessedBy)
            .Where(dr => dr.DepartmentId == departmentId)
            .OrderByDescending(dr => dr.RequestedAt);

        var totalRecords = await query.CountAsync();

        var requests = await query
            .Skip((pagination.PageNumber - 1) * pagination.PageSize)
            .Take(pagination.PageSize)
            .ToListAsync();

        return new PagedResult<DocumentRequest>
        {
            Data = requests,
            TotalRecords = totalRecords,
            PageNumber = pagination.PageNumber,
            PageSize = pagination.PageSize,
            TotalPages = (int)Math.Ceiling((double)totalRecords / pagination.PageSize),
            HasNextPage = pagination.PageNumber * pagination.PageSize < totalRecords,
            HasPreviousPage = pagination.PageNumber > 1
        };
    }

    public async Task<bool> UpdateStatusAsync(int id, string status, string? processedById = null)
    {
        var request = await GetByIdAsync(id);
        if (request == null) return false;

        request.Status = status;
        request.ProcessedById = processedById;
        request.RespondedAt = DateTime.UtcNow;
        request.UpdatedAt = DateTime.UtcNow;

        await UpdateAsync(request);
        return true;
    }

    public async Task<bool> AssignResponseDocumentAsync(int id, int responseDocumentId, string? processedById = null)
    {
        var request = await GetByIdAsync(id);
        if (request == null) return false;

        request.ResponseDocumentId = responseDocumentId;
        request.ProcessedById = processedById;
        request.Status = "Completed";
        request.RespondedAt = DateTime.UtcNow;
        request.UpdatedAt = DateTime.UtcNow;

        await UpdateAsync(request);
        return true;
    }

    public async Task<Dictionary<string, int>> GetRequestStatisticsAsync(int? departmentId = null)
    {
        var query = _context.DocumentRequests.AsQueryable();

        if (departmentId.HasValue)
        {
            query = query.Where(dr => dr.DepartmentId == departmentId.Value);
        }

        var stats = await query
            .GroupBy(dr => dr.Status)
            .Select(g => new { Status = g.Key, Count = g.Count() })
            .ToListAsync();

        return stats.ToDictionary(s => s.Status, s => s.Count);
    }

    private IQueryable<DocumentRequest> ApplySorting(IQueryable<DocumentRequest> query, string? sortBy, string? sortDirection)
    {
        if (string.IsNullOrEmpty(sortBy))
        {
            return query.OrderByDescending(dr => dr.RequestedAt);
        }

        var isDescending = sortDirection?.ToLower() == "desc";

        return sortBy.ToLower() switch
        {
            "requestedat" => isDescending ? query.OrderByDescending(dr => dr.RequestedAt) : query.OrderBy(dr => dr.RequestedAt),
            "respondedat" => isDescending ? query.OrderByDescending(dr => dr.RespondedAt) : query.OrderBy(dr => dr.RespondedAt),
            "documenttype" => isDescending ? query.OrderByDescending(dr => dr.DocumentType) : query.OrderBy(dr => dr.DocumentType),
            "priority" => isDescending ? query.OrderByDescending(dr => dr.Priority) : query.OrderBy(dr => dr.Priority),
            "status" => isDescending ? query.OrderByDescending(dr => dr.Status) : query.OrderBy(dr => dr.Status),
            "requestername" => isDescending ? query.OrderByDescending(dr => dr.Requester.UserName) : query.OrderBy(dr => dr.Requester.UserName),
            "departmentname" => isDescending ? query.OrderByDescending(dr => dr.Department.Name) : query.OrderBy(dr => dr.Department.Name),
            _ => query.OrderByDescending(dr => dr.RequestedAt)
        };
    }

    public async Task<DocumentRequestStatsDto> GetDocumentStatisticsAsync()
    {
        try
        {
            var totalRequests = await _context.DocumentRequests.CountAsync();
            var pendingRequests = await _context.DocumentRequests.CountAsync(dr => dr.Status == "En Attente");
            var completedRequests = await _context.DocumentRequests.CountAsync(dr => dr.Status == "Completed");
            var rejectedRequests = await _context.DocumentRequests.CountAsync(dr => dr.Status == "Rejected");

            return new DocumentRequestStatsDto
            {
                TotalDocumentsRequest = totalRequests,
                TotalPendingRequests = pendingRequests,
                TotalProcessedRequests = completedRequests,
                TotalRejectedRequests = rejectedRequests
            };
        }
        catch (System.Exception)
        {

            throw;
        }
    }

    public async Task<DocumentRequestStatsDto> GetDocumentStatisticsAsyncByUserId(string userId)
    {
        try
        {
            var totalRequests = await _context.DocumentRequests.CountAsync(dr => dr.RequesterId == userId);
            var pendingRequests = await _context.DocumentRequests.CountAsync(dr => dr.Status == "En Attente" && dr.RequesterId == userId);
            var completedRequests = await _context.DocumentRequests.CountAsync(dr => dr.Status == "Completed" && dr.RequesterId == userId);
            var rejectedRequests = await _context.DocumentRequests.CountAsync(dr => dr.Status == "Rejected" && dr.RequesterId == userId);

            return new DocumentRequestStatsDto
            {
                TotalDocumentsRequest = totalRequests,
                TotalPendingRequests = pendingRequests,
                TotalProcessedRequests = completedRequests,
                TotalRejectedRequests = rejectedRequests
            };
        }
        catch (System.Exception)
        {
            
            throw;
        }
    }
}