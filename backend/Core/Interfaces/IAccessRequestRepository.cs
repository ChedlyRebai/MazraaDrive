using Core.DTO;
using Core.DTOs.AccessRequests;
using Core.Entities;

public interface IAccessRequestRepository
{
    Task<AccessRequestPageResult> GetPagedAsync(PaginationParams @params);
    Task<PagedResult<AccessRequestDto>> GetMyRequestsAsync(PaginationParams paginationParams);
    Task<PagedResult<AccessRequestDto>> GetRequestsByUserIdAsync(string userId, PaginationParams paginationParams);
    Task<AccessRequestDto?> GetByIdAsync(int id);
    Task<AccessRequestDto> AddAsync(AccessRequest entity);
    Task SaveChangesAsync();
    Task<bool> ExistsPendingAsync(int documentId, string requesterId);
    

    Task DeleteAsync(int id);

    Task<AccessRequestDto> UpdateAsync(AccessRequest entity);
    Task UpdateAsync(AccessRequestDto entity);
}