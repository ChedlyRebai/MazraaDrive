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

    public async Task<Folder> AddAsync(Folder folder)
    {
        if (folder == null)
        {
            throw new ArgumentNullException(nameof(folder), "Folder cannot be null");
        }

        _context.Folders.Add(folder);
        await _context.SaveChangesAsync();
        return folder;
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
        return await _context.Folders
            .Include(f => f.Department)
            .Include(f => f.CreatedBy)
            .Include(f => f.ParentFolder)
            .Include(f => f.SubFolders)
            .Include(f => f.Documents)

            .OrderBy(f => f.Name)
            .ToListAsync();
    }

    public async Task<Folder?> GetByIdAsync(int id)
    {
        return await _context.Folders
            .Include(f => f.Department)
            .Include(f => f.CreatedBy)
            .Include(f => f.ParentFolder)
            .Include(f => f.SubFolders)
            .Include(f => f.Documents)
            .FirstOrDefaultAsync(f => f.Id == id);
    }

    public async Task<Folder?> GetByNameAsync(string name, int departmentId)
    {
        if (string.IsNullOrEmpty(name))
            return null;

        return await _context.Folders
            .FirstOrDefaultAsync(f =>
            f.Name.ToLower() == name.ToLower()
           // &&   f.DepartmentId == departmentId
            );
    }

    public async Task UpdateAsync(Folder folder)
    {
        if (folder == null)
            throw new ArgumentNullException(nameof(folder));

        //folder.UpdatedAt = DateTime.UtcNow;
        _context.Folders.Update(folder);
    }

    public async Task<bool> ExistsAsync(int id)
    {
        return await _context.Folders.AnyAsync(f => f.Id == id);
    }

    public async Task<IReadOnlyList<Folder>> GetByDepartmentAsync(int departmentId)
    {
        return await _context.Folders
            .Include(f => f.CreatedBy)
            .Include(f => f.ParentFolder)
            .Include(f => f.SubFolders)
            .Include(f => f.Documents)
            //.Where(f => f.DepartmentId == departmentId && f.IsActive)
            .OrderBy(f => f.Name)
            .ToListAsync();
    }

    public async Task<IReadOnlyList<Folder>> GetRootFoldersAsync(int departmentId)
    {
        return await _context.Folders
            .Include(f => f.CreatedBy)
            .Include(f => f.SubFolders)
            .Include(f => f.Documents)
            //.Where(f => f.DepartmentId == departmentId && f.ParentFolderId == null)
            .OrderBy(f => f.Name)
            .ToListAsync();
    }

    public async Task<IReadOnlyList<Folder>> GetSubFoldersAsync(int parentFolderId)
    {
        return await _context.Folders
            .Include(f => f.CreatedBy)
            .Include(f => f.SubFolders)
            .Include(f => f.Documents)
           // .Where(f => f.ParentFolderId == parentFolderId )
            .OrderBy(f => f.Name)
            .ToListAsync();
    }

    public async Task<IReadOnlyList<Folder>> GetFolderTreeAsync(int departmentId)
    {
        return await _context.Folders
            //.Where(f => f.DepartmentId == departmentId )
            .OrderBy(f => f.Name)
            .ToListAsync();
    }

    public async Task<bool> HasSubFoldersAsync(int folderId)
    {
        //  return await _context.Folders.FindAsync
        //    .AnyAsync(f => f.ParentFolderId == folderId );
        return true;
    }

    public async Task<bool> HasDocumentsAsync(int folderId)
    {
        return await _context.Documents
            .AnyAsync(d => d.FolderId == folderId);
    }

    public async Task<IReadOnlyList<Folder>> GetByUserAsync(string userId)
    {
        return await _context.Folders
            .Include(f => f.Department)
            .Include(f => f.ParentFolder)
           // .Where(f => f.CreatedById == userId )
            .OrderBy(f => f.Name)
            .ToListAsync();
    }

    Task IGenericRepository<Folder>.AddAsync(Folder entity)
    {
        return AddAsync(entity);
    }
}
