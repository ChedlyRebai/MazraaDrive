using System;
using Core.DTO;
using Core.Entities;

namespace Core.Interfaces;

public interface IFolderRepository : IGenericRepository<Folder>
{
    Task<PagedResult<Folder>> GetPagedAsync(FolderFilterDto filter);
    Task<PagedResult<Folder>> GetByDepartmentPagedAsync(int departmentId, PaginationParams pagination);
    Task<PagedResult<Folder>> GetHomeFolders(FolderFilterDto filter,int departmentId);
    Task<PagedResult<Folder>> GetByParentPagedAsync(int? parentFolderId, PaginationParams pagination);
    Task<PagedResult<Folder>> GetByUserPagedAsync(string userId, PaginationParams pagination);
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

    Task<Folder?> GetByIdWithDetailsAsync(int id);

    Task<IReadOnlyList<Folder>> GetAllWithDetailsAsync();
}
