using Core.DTO;
using Core.DTOs.AccessRequests;
using Core.Entities;

public interface IAccessRequestRepository
{
    Task<PagedResult<AccessRequestDto>> GetPagedAsync(PaginationParams @params);
    Task<AccessRequestDto?> GetByIdAsync(int id);
    Task<AccessRequestDto> AddAsync(AccessRequest entity);
    Task SaveChangesAsync();
    Task<bool> ExistsPendingAsync(int documentId, string requesterId);

    Task DeleteAsync(AccessRequest entity);

    Task<AccessRequestDto> UpdateAsync(AccessRequest entity);
    Task UpdateAsync(AccessRequestDto entity);
}