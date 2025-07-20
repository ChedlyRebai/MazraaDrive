using System;
using System.Linq.Expressions;
using Core.Entities;
using Core.Interfaces;

namespace Infrastructure.Repositories;

public class FolderRepository : IFolderRepository
{
    public Task AddAsync(Folder entity)
    {
        throw new NotImplementedException();
    }

    public Task<int> CountAsync()
    {
        throw new NotImplementedException();
    }

    public Task DeleteAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<Folder>> GetAllAsync()
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<Folder>> GetAllAsync(params Expression<Func<Folder, object>>[] includes)
    {
        throw new NotImplementedException();
    }

    public Task<Folder> GetByIdAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<Folder> GetByIdAsync(int id, params Expression<Func<Folder, object>>[] includes)
    {
        throw new NotImplementedException();
    }

    public Task UpdateAsync(Folder entity)
    {
        throw new NotImplementedException();
    }
}
