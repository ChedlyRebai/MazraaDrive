using System;
using System.Linq.Expressions;
using Core.Entities;
using Core.Interfaces;

namespace Infrastructure.Repositories;

public class DocRequestRepository : IDocRequestRepository
{
    public Task AddAsync(DocumentRequest entity)
    {
        throw new NotImplementedException();
    }

    
    public Task DeleteAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<DocumentRequest>> GetAllAsync()
    {
        throw new NotImplementedException();
    }

   

    public Task<DocumentRequest> GetByIdAsync(int id)
    {
        throw new NotImplementedException();
    }

    

    public Task UpdateAsync(DocumentRequest entity)
    {
        throw new NotImplementedException();
    }
}
