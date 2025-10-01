using System.Linq;
using System.Threading.Tasks;
using Core.Entities;
using Core.Interfaces;
using Core.DTOs.AccessRequests;
using Microsoft.EntityFrameworkCore;
using Infrastructure.Data;
using Core.DTO;

namespace Infrastructure.Repositories;

public class AccessRequestRepository : IAccessRequestRepository
{
    private readonly AppDbContext _ctx;
    public AccessRequestRepository(AppDbContext ctx) => _ctx = ctx;

    public async Task<AccessRequestDto> AddAsync(AccessRequest entity)
    {
        await _ctx.AccessRequests.AddAsync(entity);
        return new AccessRequestDto
        {
            Id = entity.Id,
            DocumentId = entity.DocumentId,
            RequesterId = entity.RequesterId,
            RequestRead = entity.RequestRead,
            RequestWrite = entity.RequestWrite,
            RequestDelete = entity.RequestDelete,
            Status = entity.Status,
            CreatedAt = entity.CreatedAt,
            DecisionAt = entity.DecisionAt,
            DecidedById = entity.DecidedById
        };
    }

    public async Task<AccessRequestDto?> GetByIdAsync(int id) =>
        await _ctx.AccessRequests
            .Include(a => a.Document)
            .Include(a => a.Requester)
            .Include(a => a.DecidedBy)
            .Where(a => a.Id == id)
            .Select(a => new AccessRequestDto
            {
                Id = a.Id,
                DocumentId = a.DocumentId,
                RequesterId = a.RequesterId,
                RequestRead = a.RequestRead,
                RequestWrite = a.RequestWrite,
                RequestDelete = a.RequestDelete,
                Message = a.Message,
                DocumentName = a.Document.Name,
                Status = a.Status,
                CreatedAt = a.CreatedAt,
                DecisionAt = a.DecisionAt,
                DecidedById = a.DecidedById,
                DecidedByName = a.DecidedBy != null ? a.DecidedBy.UserName : null
            })
            .FirstOrDefaultAsync();

    public async Task<bool> ExistsPendingAsync(int documentId, string requesterId) =>
        await _ctx.AccessRequests.AnyAsync(r =>
            r.DocumentId == documentId &&
            r.RequesterId == requesterId &&
            r.Status == "En Attente");

    public async Task<PagedResult<AccessRequestDto>> GetMyRequestsAsync(PaginationParams paginationParams)
    {
        var currentUserId = "10";
        var q = _ctx.AccessRequests
            .Where(a => a.RequesterId == currentUserId)
            .AsQueryable();

        var total = await q.CountAsync();
        var items = await q
            .Skip((paginationParams.PageNumber - 1) * paginationParams.PageSize)
            .Take(paginationParams.PageSize)
            .Select(x => new AccessRequestDto
            {
                Id = x.Id,
                DocumentId = x.DocumentId,
                DocumentName = x.Document.Name,
                RequesterId = x.RequesterId,
                RequesterName = x.Requester.UserName,
                RequestRead = x.RequestRead,
                RequestWrite = x.RequestWrite,
                RequestDelete = x.RequestDelete,
                Status = x.Status,
                Message = x.Message,
                CreatedAt = x.CreatedAt,
                DecisionAt = x.DecisionAt,
                DecidedById = x.DecidedById,
                DecidedByName = x.DecidedBy != null ? x.DecidedBy.UserName : null
            })
            .ToListAsync();


        return new PagedResult<AccessRequestDto>
        {
            Data = items,
            PageNumber = paginationParams.PageNumber,
            PageSize = paginationParams.PageSize,
            TotalRecords = total
        };
    }

    public async Task<AccessRequestPageResult> GetPagedAsync(PaginationParams p)
    {
        var q = _ctx.AccessRequests
            .AsNoTracking()
            
            .Include(a => a.Document)
            .Include(a => a.Requester)
            .Include(a => a.DecidedBy)
            .AsQueryable();

        // if (!string.IsNullOrWhiteSpace(p.Status))
        //     q = q.Where(x => x.Status == p.Status);
        // if (p.DocumentId.HasValue)
        //     q = q.Where(x => x.DocumentId == p.DocumentId.Value);
        // if (!string.IsNullOrEmpty(p.RequesterId))
        //     q = q.Where(x => x.RequesterId == p.RequesterId);
        // if (!string.IsNullOrEmpty(p.DecidedById))
        //     q = q.Where(x => x.DecidedById == p.DecidedById);
        if (!string.IsNullOrEmpty(p.Search))
        {
            q = q.Where(x => x.Requester    .UserName.ToLower().Contains(p.Search.ToLower()));
        }
        q = p.SortBy switch
        {
            "createdAsc" => q.OrderBy(x => x.CreatedAt),
            "decisionDesc" => q.OrderByDescending(x => x.DecisionAt),
            "decisionAsc" => q.OrderBy(x => x.DecisionAt),
            _ => q.OrderByDescending(x => x.CreatedAt)
        };

        var total = await q.CountAsync();
        var items = await q
            .Skip((p.PageNumber - 1) * p.PageSize)
            .Take(p.PageSize)
            .Select(x => new AccessRequestDto
            {
                Id = x.Id,
                DocumentId = x.DocumentId,
                DocumentName = x.Document.Name,
                RequesterId = x.RequesterId,
                RequesterName = x.Requester.UserName,
                RequestRead = x.RequestRead,
                RequestWrite = x.RequestWrite,
                Message = x.Message,
                RequestDelete = x.RequestDelete,
                Status = x.Status,
                CreatedAt = x.CreatedAt,
                DecisionAt = x.DecisionAt,
                DecidedById = x.DecidedById,
                DecidedByName = x.DecidedBy != null ? x.DecidedBy.UserName : null
            })
            .ToListAsync();

        return new AccessRequestPageResult
        {   
            HasNextPage= total > p.PageSize * p.PageNumber,
            HasPreviousPage= p.PageNumber > 1,
            TotalPending = await _ctx.AccessRequests.CountAsync(r => r.Status == "En Attente"),
            TotalRejected = await _ctx.AccessRequests.CountAsync(r => r.Status == "Rejected"),
            TotalApproved = await _ctx.AccessRequests.CountAsync(r => r.Status == "Approved"),
            Data = items,
            PageNumber = p.PageNumber,
            PageSize = p.PageSize,
            TotalRecords = total
        };
    }

    public Task SaveChangesAsync() => _ctx.SaveChangesAsync();

    public async Task DeleteAsync(int id)
    {
        var accessRequest = await _ctx.AccessRequests.FindAsync(id);

        _ctx.AccessRequests.Remove(accessRequest);

    }

    public Task<AccessRequestDto> UpdateAsync(AccessRequest entity)
    {
        _ctx.AccessRequests.Update(entity);
        var dto = new AccessRequestDto
        {
            Id = entity.Id,
            DocumentId = entity.DocumentId,
            RequesterId = entity.RequesterId,
            RequestRead = entity.RequestRead,
            RequestWrite = entity.RequestWrite,
            RequestDelete = entity.RequestDelete,
            Message = entity.Message,
            Status = entity.Status,
            CreatedAt = entity.CreatedAt,
            DecisionAt = entity.DecisionAt,
            DecidedById = entity.DecidedById
        };
        
        return Task.FromResult(dto);
    }

    public Task UpdateAsync(AccessRequestDto entity)
    {
        throw new NotImplementedException();
    }


    public async Task<PagedResult<AccessRequestDto>> GetRequestsByUserIdAsync(string userId, PaginationParams paginationParams)
    {
        
        var q = _ctx.AccessRequests
            .Where(a => a.RequesterId == userId)
            .AsQueryable();
        if (!string.IsNullOrEmpty(paginationParams.Search))
        {
            // q = q.Where(a => a.Document.Name.Contains(paginationParams.Search));
            q = q.Where(a => a.Document.Name.ToLower().Contains(paginationParams.Search.ToLower()));
        }
        var total = await q.CountAsync();
        var items = await q
            .Skip((paginationParams.PageNumber - 1) * paginationParams.PageSize)
            .Take(paginationParams.PageSize)
            .Select(x => new AccessRequestDto
            {
                Id = x.Id,
                DocumentId = x.DocumentId,
                DocumentName = x.Document.Name,
                RequesterId = x.RequesterId,
                RequesterName = x.Requester.UserName,
                RequestRead = x.RequestRead,
                Message = x.Message,
                RequestWrite = x.RequestWrite,
                RequestDelete = x.RequestDelete,
                Status = x.Status,
                CreatedAt = x.CreatedAt,
                DecisionAt = x.DecisionAt,
                DecidedById = x.DecidedById,
                DecidedByName = x.DecidedBy != null ? x.DecidedBy.UserName : null
            })
            .ToListAsync();


        return new PagedResult<AccessRequestDto>
        {
            Data = items,
            PageNumber = paginationParams.PageNumber,
            PageSize = paginationParams.PageSize,
            TotalRecords = total
        };
    }
}