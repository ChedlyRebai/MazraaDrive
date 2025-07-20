using System;
using Core.Entities;
using Core.Interfaces;

namespace Infrastructure.Repositories;

public class DocumentRepository : IDocument
{
    public Task AddAsync(Document entity)
    {
        throw new NotImplementedException();
    }

    public Task DeleteAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<Document>> GetAllAsync()
    {
        throw new NotImplementedException();
    }

    public Task<Document> GetByIdAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task UpdateAsync(Document entity)
    {
        throw new NotImplementedException();
    }
}
