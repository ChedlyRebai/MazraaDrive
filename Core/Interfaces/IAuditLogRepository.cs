using System;
using Core.DTO;
using Core.DTOs;
using Core.Entities;

namespace Core.Interfaces;

public interface IAuditLogRepository:IGenericRepository<AuditLog>
{
      Task<AuditLog> CreateAsync(AuditLog auditLog);
    Task<AuditLog> GetByIdAsync(int id);
    Task<IEnumerable<AuditLog>> GetAllAsync();
    Task<AuditLog> UpdateAsync(AuditLog auditLog);
    Task DeleteAsync(int id);
    Task DeleteRangeAsync(IEnumerable<int> ids);
    Task<bool> ExistsAsync(int id);
    Task<int> GetCountAsync();

    // Pagination methods using your PaginationParams model
    Task<PagedResult<AuditLog>> GetPagedAsync(PaginationParams paginationParams);
    Task<PagedResult<AuditLog>> GetPagedWithFiltersAsync(
        PaginationParams paginationParams,
        string actionType = null,
        DateTime? startDate = null,
        DateTime? endDate = null,
        string userId = null);

    // Specific filtered pagination methods
    Task<PagedResult<AuditLog>> GetByUserIdPagedAsync(string userId, PaginationParams paginationParams);
    Task<PagedResult<AuditLog>> GetByDateRangePagedAsync(DateTime startDate, DateTime endDate, PaginationParams paginationParams);

    // Non-paginated filtered methods (for backwards compatibility)
    Task<IEnumerable<AuditLog>> GetByUserIdAsync(string userId);
    Task<IEnumerable<AuditLog>> GetByActionTypeAsync(string actionType);
    Task<IEnumerable<AuditLog>> GetByDateRangeAsync(DateTime startDate, DateTime endDate);
    
    // Utility methods
    Task<IEnumerable<string>> GetDistinctActionTypesAsync();
    Task<IEnumerable<string>> GetDistinctTargetEntitiesAsync();
}
