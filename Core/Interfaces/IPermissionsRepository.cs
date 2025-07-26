using Core.Entities;

namespace Core.Interfaces
{
    public interface IPermissionsRepository : IGenericRepository<AccessRight>
    {
        Task<AccessRight> AddAsync(AccessRight accessRight);
        Task DeleteAsync(int id);
        Task<IReadOnlyList<AccessRight>> GetAllAsync();
        Task<AccessRight?> GetByIdAsync(int id);
        Task UpdateAsync(AccessRight accessRight);
        Task<bool> ExistsAsync(int id);
        
        // Specific to AccessRights
        Task<IReadOnlyList<AccessRight>> GetByUserAsync(string userId);
        Task<IReadOnlyList<AccessRight>> GetByDocumentAsync(int documentId);
        Task<IReadOnlyList<AccessRight>> GetByFolderAsync(int folderId);
        Task<AccessRight?> GetUserDocumentAccessAsync(string userId, int documentId);
        Task<AccessRight?> GetUserFolderAccessAsync(string userId, int folderId);
        Task<bool> HasPermissionAsync(string userId, int? documentId, int? folderId, string permission);
        Task<bool> CanUserCreateAsync(string userId, int? folderId = null);
        Task<bool> CanUserReadAsync(string userId, int? documentId = null, int? folderId = null);
        Task<bool> CanUserUpdateAsync(string userId, int? documentId = null, int? folderId = null);
        Task<bool> CanUserDeleteAsync(string userId, int? documentId = null, int? folderId = null);
        Task BulkCreateAsync(List<AccessRight> accessRights);
        Task RemoveUserAccessAsync(string userId, int? documentId = null, int? folderId = null);
        Task<IReadOnlyList<AccessRight>> GetInheritedFolderPermissionsAsync(string userId, int folderId);
    }
}