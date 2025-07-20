using System;
using System.Linq.Expressions;
using Core.Entities;
using Core.Interfaces;

namespace Infrastructure.Repositories;

public class RoleRepository : IRoleRepository
{
    public Task AddAsync(Role entity)
    {
        throw new NotImplementedException();
    }


    public Task DeleteAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<Role>> GetAllAsync()
    {
        throw new NotImplementedException();
    }

    public Task<Role> GetByIdAsync(int id)
    {
        throw new NotImplementedException();
    }


    public Task UpdateAsync(Role entity)
    {
        throw new NotImplementedException();
    }
}
