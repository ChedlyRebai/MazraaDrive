using System;
using Core.Entities;

namespace Core.Interfaces;

public interface IFolderRepository : IGenericRepository<Folder>
{
    Task<Folder> AddAsync(Folder folder);
    Task DeleteFolderAsync(int id);
    Task<IReadOnlyList<Folder>> GetAllFoldersAsync();
    Task<Folder> GetFolderByIdAsync(int id);
    Task<Folder> UpdateFolderAsync(Folder folder);

    Task<IReadOnlyList<Folder>> GetFoldersByParentIdAsync(int parentId);
    
}
