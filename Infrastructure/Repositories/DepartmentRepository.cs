using System;
using System.Linq.Expressions;
using Core.Entities;
using Core.Interfaces;

namespace Infrastructure.Repositories;

public class DepartmentRepository : IDepartmentRepository
{
    public Task AddAsync(Department entity)
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

    public Task<IReadOnlyList<Department>> GetAllAsync()
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<Department>> GetAllAsync(params Expression<Func<Department, object>>[] includes)
    {
        throw new NotImplementedException();
    }

    public Task<Department> GetByIdAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<Department> GetByIdAsync(int id, params Expression<Func<Department, object>>[] includes)
    {
        throw new NotImplementedException();
    }

    public Task UpdateAsync(Department entity)
    {
        throw new NotImplementedException();
    }
}
