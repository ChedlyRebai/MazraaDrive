using System;
using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories;

public class DocumentRepository : IDocument
{
    private readonly AppDbContext _context;

    public DocumentRepository(AppDbContext context = null)
    {
        _context = context;
    }
    public Task AddAsync(Document entity)
    {
        if (entity == null)
        {
            throw new ArgumentNullException(nameof(entity), "Document cannot be null");
        }

        _context.Documents.Add(entity);
        return _context.SaveChangesAsync();
    }

    public Task DeleteAsync(int id)
    {
        var document = _context.Documents.Find(id);
        if (document == null)
        {
            throw new ArgumentException($"Document with id {id} not found");
        }

        _context.Documents.Remove(document);
        return _context.SaveChangesAsync();
    }

    public async Task<IReadOnlyList<Document>> GetAllAsync()
    {
        var documents = await _context.Documents.ToListAsync();
        if (documents == null || !documents.Any())
        {
            throw new InvalidOperationException("No Documents found");
        }
        return documents;
    }

    public Task<Document> GetByIdAsync(int id)
    {
        var document = _context.Documents.FirstOrDefaultAsync(doc => doc.Id == id);
        if (document == null)
        {
            throw new ArgumentException($"Document with id {id} not found");
        }
        return document;
    }

    public Task UpdateAsync(Document entity)
    {
        if (entity == null)
        {
            throw new ArgumentNullException(nameof(entity), "Document cannot be null");
        }

        _context.Documents.Update(entity);
        return _context.SaveChangesAsync();
    }
}
