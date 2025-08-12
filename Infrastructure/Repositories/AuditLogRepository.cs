using System;
using System.Linq.Expressions;
using Core.DTO;
using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories;

public class AuditLogRepository : IAuditLogRepository
{
     private readonly AppDbContext _context;
     private readonly IHttpContextAccessor _httpContextAccessor;

    public AuditLogRepository(AppDbContext context, IHttpContextAccessor httpContextAccessor)
    {
        _context = context;
         _httpContextAccessor = httpContextAccessor;
    }

     public async Task LogAsync(string actionType, string description, string? userId = null, string? targetEntity = null)
    {
        var httpContext = _httpContextAccessor.HttpContext;
        var ipAddress = httpContext?.Connection?.RemoteIpAddress?.ToString();
        var userAgent = httpContext?.Request?.Headers["User-Agent"].ToString();

        var log = new AuditLog
        {
            UserId = userId,
            Action = httpContext?.Request?.Path,
            TargetEntity = targetEntity,
            ActionType = actionType,
            Description = description,
            CreatedAt = DateTime.UtcNow,
            IPAddress = ipAddress,
            UserAgent = userAgent
        };

        _context.AuditLogs.Add(log);
        await _context.SaveChangesAsync();
    }

    public async Task<AuditLog> CreateAsync(AuditLog auditLog)
    {
        await _context.AuditLogs.AddAsync(auditLog);
        await _context.SaveChangesAsync();
        return auditLog;
    }

    public async Task<AuditLog> GetByIdAsync(int id)
    {
        return await _context.AuditLogs
            .Include(al => al.User)
            .FirstOrDefaultAsync(al => al.Id == id);
    }

    public async Task<IEnumerable<AuditLog>> GetAllAsync()
    {
        return await _context.AuditLogs
            .Include(al => al.User)
            .OrderByDescending(al => al.CreatedAt)
            .ToListAsync();
    }

    public async Task<PagedResult<AuditLog>> GetPagedAsync(PaginationParams paginationParams)
    {
        var query = _context.AuditLogs
            .Include(al => al.User)
            .AsQueryable();

        // Apply search filter
        if (!string.IsNullOrEmpty(paginationParams.Search))
        {
            var searchTerm = paginationParams.Search.ToLower();
            query = query.Where(al => 
                al.Action.ToLower().Contains(searchTerm) ||
                al.Description.ToLower().Contains(searchTerm) ||
                al.TargetEntity.ToLower().Contains(searchTerm) ||
                al.ActionType.ToLower().Contains(searchTerm) ||
                al.User.UserName.ToLower().Contains(searchTerm) ||
                al.IPAddress.ToLower().Contains(searchTerm));
        }

        // Apply sorting
        query = ApplySorting(query, paginationParams.SortBy, paginationParams.SortDirection);

        // Get total count before pagination
        var totalRecords = await query.CountAsync();

        // Apply pagination
        var items = await query
            .Skip((paginationParams.PageNumber - 1) * paginationParams.PageSize)
            .Take(paginationParams.PageSize)
            .ToListAsync();

        return items.ToPagedResult(
            paginationParams.PageNumber,
            paginationParams.PageSize,
            totalRecords,
            paginationParams.Search,
            paginationParams.SortBy,
            paginationParams.SortDirection);
    }

    public async Task<PagedResult<AuditLog>> GetPagedWithFiltersAsync(
        PaginationParams paginationParams,
        string actionType = null,
        DateTime? startDate = null,
        DateTime? endDate = null,
        string userId = null)
    {
        var query = _context.AuditLogs
            .Include(al => al.User)
            .AsQueryable();

        // Apply filters
        if (!string.IsNullOrEmpty(actionType))
        {
            query = query.Where(al => al.ActionType == actionType);
        }

        if (!string.IsNullOrEmpty(userId))
        {
            query = query.Where(al => al.UserId == userId);
        }

        if (startDate.HasValue)
        {
            query = query.Where(al => al.CreatedAt >= startDate.Value);
        }

        if (endDate.HasValue)
        {
            query = query.Where(al => al.CreatedAt <= endDate.Value);
        }

        // Apply search filter
        if (!string.IsNullOrEmpty(paginationParams.Search))
        {
            var searchTerm = paginationParams.Search.ToLower();
            query = query.Where(al => 
                al.Action.ToLower().Contains(searchTerm) ||
                al.Description.ToLower().Contains(searchTerm) ||
                al.TargetEntity.ToLower().Contains(searchTerm) ||
                al.ActionType.ToLower().Contains(searchTerm) ||
                al.User.UserName.ToLower().Contains(searchTerm) ||
                al.IPAddress.ToLower().Contains(searchTerm));
        }

        // Apply sorting
        query = ApplySorting(query, paginationParams.SortBy, paginationParams.SortDirection);

        // Get total count before pagination
        var totalRecords = await query.CountAsync();

        // Apply pagination
        var items = await query
            .Skip((paginationParams.PageNumber - 1) * paginationParams.PageSize)
            .Take(paginationParams.PageSize)
            .ToListAsync();

        return items.ToPagedResult(
            paginationParams.PageNumber,
            paginationParams.PageSize,
            totalRecords,
            paginationParams.Search,
            paginationParams.SortBy,
            paginationParams.SortDirection);
    }

    public async Task<PagedResult<AuditLog>> GetByUserIdPagedAsync(string userId, PaginationParams paginationParams)
    {
        var query = _context.AuditLogs
            .Include(al => al.User)
            .Where(al => al.UserId == userId);

        // Apply search filter
        if (!string.IsNullOrEmpty(paginationParams.Search))
        {
            var searchTerm = paginationParams.Search.ToLower();
            query = query.Where(al => 
                al.Action.ToLower().Contains(searchTerm) ||
                al.Description.ToLower().Contains(searchTerm) ||
                al.TargetEntity.ToLower().Contains(searchTerm) ||
                al.ActionType.ToLower().Contains(searchTerm));
        }

        // Apply sorting
        query = ApplySorting(query, paginationParams.SortBy, paginationParams.SortDirection);

        var totalRecords = await query.CountAsync();

        var items = await query
            .Skip((paginationParams.PageNumber - 1) * paginationParams.PageSize)
            .Take(paginationParams.PageSize)
            .ToListAsync();

        return items.ToPagedResult(
            paginationParams.PageNumber,
            paginationParams.PageSize,
            totalRecords,
            paginationParams.Search,
            paginationParams.SortBy,
            paginationParams.SortDirection);
    }

    public async Task<PagedResult<AuditLog>> GetByDateRangePagedAsync(
        DateTime startDate, 
        DateTime endDate, 
        PaginationParams paginationParams)
    {
        var query = _context.AuditLogs
            .Include(al => al.User)
            .Where(al => al.CreatedAt >= startDate && al.CreatedAt <= endDate);

        // Apply search filter
        if (!string.IsNullOrEmpty(paginationParams.Search))
        {
            var searchTerm = paginationParams.Search.ToLower();
            query = query.Where(al => 
                al.Action.ToLower().Contains(searchTerm) ||
                al.Description.ToLower().Contains(searchTerm) ||
                al.TargetEntity.ToLower().Contains(searchTerm) ||
                al.ActionType.ToLower().Contains(searchTerm) ||
                al.User.UserName.ToLower().Contains(searchTerm));
        }

        // Apply sorting
        query = ApplySorting(query, paginationParams.SortBy, paginationParams.SortDirection);

        var totalRecords = await query.CountAsync();

        var items = await query
            .Skip((paginationParams.PageNumber - 1) * paginationParams.PageSize)
            .Take(paginationParams.PageSize)
            .ToListAsync();

        return items.ToPagedResult(
            paginationParams.PageNumber,
            paginationParams.PageSize,
            totalRecords,
            paginationParams.Search,
            paginationParams.SortBy,
            paginationParams.SortDirection);
    }

    private IQueryable<AuditLog> ApplySorting(IQueryable<AuditLog> query, string sortBy, string sortDirection)
    {
        if (string.IsNullOrEmpty(sortBy))
        {
            return query.OrderByDescending(al => al.CreatedAt);
        }

        var isDescending = sortDirection?.ToLower() == "desc";

        return sortBy.ToLower() switch
        {
            "CreatedAt" => isDescending ? query.OrderByDescending(al => al.CreatedAt) : query.OrderBy(al => al.CreatedAt),
            "action" => isDescending ? query.OrderByDescending(al => al.Action) : query.OrderBy(al => al.Action),
            "actiontype" => isDescending ? query.OrderByDescending(al => al.ActionType) : query.OrderBy(al => al.ActionType),
            "targetentity" => isDescending ? query.OrderByDescending(al => al.TargetEntity) : query.OrderBy(al => al.TargetEntity),
            "userid" => isDescending ? query.OrderByDescending(al => al.UserId) : query.OrderBy(al => al.UserId),
            "username" => isDescending ? query.OrderByDescending(al => al.User.UserName) : query.OrderBy(al => al.User.UserName),
            "ipaddress" => isDescending ? query.OrderByDescending(al => al.IPAddress) : query.OrderBy(al => al.IPAddress),
            _ => query.OrderByDescending(al => al.CreatedAt)
        };
    }

    public async Task<IEnumerable<AuditLog>> GetByUserIdAsync(string userId)
    {
        return await _context.AuditLogs
            .Include(al => al.User)
            .Where(al => al.UserId == userId)
            .OrderByDescending(al => al.CreatedAt)
            .ToListAsync();
    }

    public async Task<IEnumerable<AuditLog>> GetByActionTypeAsync(string actionType)
    {
        return await _context.AuditLogs
            .Include(al => al.User)
            .Where(al => al.ActionType == actionType)
            .OrderByDescending(al => al.CreatedAt)
            .ToListAsync();
    }

    public async Task<IEnumerable<AuditLog>> GetByDateRangeAsync(DateTime startDate, DateTime endDate)
    {
        return await _context.AuditLogs
            .Include(al => al.User)
            .Where(al => al.CreatedAt >= startDate && al.CreatedAt <= endDate)
            .OrderByDescending(al => al.CreatedAt)
            .ToListAsync();
    }

    public async Task<AuditLog> UpdateAsync(AuditLog auditLog)
    {
        _context.AuditLogs.Update(auditLog);
        await _context.SaveChangesAsync();
        return auditLog;
    }

    public async Task DeleteAsync(int id)
    {
        var auditLog = await GetByIdAsync(id);
        if (auditLog != null)
        {
            _context.AuditLogs.Remove(auditLog);
            await _context.SaveChangesAsync();
        }
    }

    public async Task DeleteRangeAsync(IEnumerable<int> ids)
    {
        var auditLogs = await _context.AuditLogs
            .Where(al => ids.Contains(al.Id))
            .ToListAsync();
        
        if (auditLogs.Any())
        {
            _context.AuditLogs.RemoveRange(auditLogs);
            await _context.SaveChangesAsync();
        }
    }

    public async Task<bool> ExistsAsync(int id)
    {
        return await _context.AuditLogs.AnyAsync(al => al.Id == id);
    }

    public async Task<int> GetCountAsync()
    {
        return await _context.AuditLogs.CountAsync();
    }

    public async Task<IEnumerable<string>> GetDistinctActionTypesAsync()
    {
        return await _context.AuditLogs
            .Select(al => al.ActionType)
            .Distinct()
            .Where(at => !string.IsNullOrEmpty(at))
            .OrderBy(at => at)
            .ToListAsync();
    }

    public async Task<IEnumerable<string>> GetDistinctTargetEntitiesAsync()
    {
        return await _context.AuditLogs
            .Select(al => al.TargetEntity)
            .Distinct()
            .Where(te => !string.IsNullOrEmpty(te))
            .OrderBy(te => te)
            .ToListAsync();
    }

    Task<IReadOnlyList<AuditLog>> IGenericRepository<AuditLog>.GetAllAsync()
    {
        throw new NotImplementedException();
    }

    public Task AddAsync(AuditLog entity)
    {
        throw new NotImplementedException();
    }

    Task IGenericRepository<AuditLog>.UpdateAsync(AuditLog entity)
    {
        return UpdateAsync(entity);
    }
}
