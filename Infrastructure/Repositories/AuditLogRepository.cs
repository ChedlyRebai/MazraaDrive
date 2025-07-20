using System;
using System.Linq.Expressions;
using Core.Entities;
using Core.Interfaces;

namespace Infrastructure.Repositories;

public class AuditLogRepository : IAuditLogRepository
{
    public Task AddAsync(AuditLog entity)
    {
        throw new NotImplementedException();
    }


    public Task DeleteAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<AuditLog>> GetAllAsync()
    {
        throw new NotImplementedException();
    }

    
    public Task<AuditLog> GetByIdAsync(int id)
    {
        throw new NotImplementedException();
    }

    

    public Task UpdateAsync(AuditLog entity)
    {
        throw new NotImplementedException();
    }
}
