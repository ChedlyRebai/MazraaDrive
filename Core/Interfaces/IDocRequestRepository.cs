using System;
using Core.DTO;
using Core.Entities;

namespace Core.Interfaces;

public interface IDocRequestRepository:IGenericRepository<DocumentRequest>
{
 Task<PagedResult<DocumentRequest>> GetPagedAsync(DocumentRequestFilterDTO filter);
    Task<DocumentRequest?> GetByIdWithDetailsAsync(int id);
    Task<DocumentRequestStatsDto> GetDocumentStatisticsAsyncByUserId(string userId);
    Task<DocumentRequestStatsDto> GetDocumentStatisticsAsync();
    Task<IEnumerable<DocumentRequest>> GetByRequesterAsync(string requesterId);
    Task<IEnumerable<DocumentRequest>> GetByDepartmentAsync(int departmentId);
    Task<IEnumerable<DocumentRequest>> GetByStatusAsync(string status);
    Task<PagedResult<DocumentRequest>> GetByRequesterPagedAsync(string requesterId, PaginationParams pagination);
    Task<PagedResult<DocumentRequest>> GetByDepartmentPagedAsync(int departmentId, PaginationParams pagination);
    Task<bool> UpdateStatusAsync(int id, string status, string? processedById = null);
    Task<bool> AssignResponseDocumentAsync(int id, int responseDocumentId, string processedById);
    Task<Dictionary<string, int>> GetRequestStatisticsAsync(int? departmentId = null);
}
