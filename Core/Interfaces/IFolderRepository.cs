using System;
using Core.Entities;

namespace Core.Interfaces;

public interface IFolderRepository : IGenericRepository<Folder>
{
    Task<Folder> AddAsync(Folder folder);
        Task DeleteAsync(int id);
        Task<IReadOnlyList<Folder>> GetAllAsync();
        Task<Folder?> GetByIdAsync(int id);
        Task<Folder?> GetByNameAsync(string name, int departmentId);
        Task UpdateAsync(Folder folder);
        Task<bool> ExistsAsync(int id);
        Task<IReadOnlyList<Folder>> GetByDepartmentAsync(int departmentId);
        Task<IReadOnlyList<Folder>> GetRootFoldersAsync(int departmentId);
        Task<IReadOnlyList<Folder>> GetSubFoldersAsync(int parentFolderId);
        Task<IReadOnlyList<Folder>> GetFolderTreeAsync(int departmentId);
        Task<bool> HasSubFoldersAsync(int folderId);
        Task<bool> HasDocumentsAsync(int folderId);
        Task<IReadOnlyList<Folder>> GetByUserAsync(string userId);
    
}
