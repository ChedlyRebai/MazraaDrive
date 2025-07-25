using System;
using System.Linq.Expressions;
using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories;

public class DocRequestRepository : IDocRequestRepository
{
    private readonly AppDbContext _context;
    public DocRequestRepository(AppDbContext context)
    {
        this._context = context;
    }

    public Task AddAsync(DocumentRequest entity)
    {
        if (entity == null)
        {
            throw new ArgumentNullException(nameof(entity), "DocumentRequest cannot be null");
        }

        _context.DocumentRequests.Add(entity);
        return _context.SaveChangesAsync();
    }


    public Task DeleteAsync(int id)
    {
        var docRequest = _context.DocumentRequests.Find(id);
        if (docRequest == null)
        {
            throw new ArgumentException($"DocumentRequest with id {id} not found");
        }

        _context.DocumentRequests.Remove(docRequest);
        return _context.SaveChangesAsync();
    }

    public async Task<IReadOnlyList<DocumentRequest>> GetAllAsync()
    {
        var docRequests = await _context.DocumentRequests.ToListAsync();
        if (docRequests == null || !docRequests.Any())
        {
            throw new InvalidOperationException("No DocumentRequests found");
        }
        return docRequests;
    }



    public Task<DocumentRequest> GetByIdAsync(int id)
    {
        var docRequest = _context.DocumentRequests.FirstOrDefaultAsync(req => req.Id == id);
        if (docRequest == null)
        {
            throw new ArgumentException($"DocumentRequest with id {id} not found");
        }
        return docRequest;
    }



    public Task UpdateAsync(DocumentRequest entity)
    {
        if (entity == null)
        {
            throw new ArgumentNullException(nameof(entity), "DocumentRequest cannot be null");
        }

        _context.DocumentRequests.Update(entity);
        return _context.SaveChangesAsync();
    }
}
