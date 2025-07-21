using System;
using System.Linq.Expressions;
using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories;

public class FolderRepository : IFolderRepository
{
    private readonly AppDbContext _context;

    public FolderRepository(AppDbContext context)
    {
        _context = context;
    }

    public Task AddAsync(Folder entity)
    {
        if (entity == null)
        {
            throw new ArgumentNullException(nameof(entity), "Folder cannot be null");
        }

        _context.Folders.Add(entity);
        return _context.SaveChangesAsync();
    }


    public Task DeleteAsync(int id)
    {
        var folder = _context.Folders.Find(id);
        if (folder == null)
        {
            throw new ArgumentException($"Folder with id {id} not found");
        }
        _context.Folders.Remove(folder);
        return _context.SaveChangesAsync();
    }

    public async Task<IReadOnlyList<Folder>> GetAllAsync()
    {
        var folders =await  _context.Folders.ToListAsync();
        if (folders == null || !folders.Any() )
        {
            throw new InvalidOperationException("No Folders found");
        }
        return folders;
    }


    public Task<Folder> GetByIdAsync(int id)
    {
        var folder = _context.Folders.FirstOrDefaultAsync(f => f.Id == id);
        if (folder == null)
        {
            throw new ArgumentException($"Folder with id {id} not found");
        }
        return folder;
    }



    public Task UpdateAsync(Folder entity)
    {
        if (entity == null)
        {
            throw new ArgumentNullException(nameof(entity), "Folder cannot be null");
        }

        _context.Folders.Update(entity);
        return _context.SaveChangesAsync();
    }
}
