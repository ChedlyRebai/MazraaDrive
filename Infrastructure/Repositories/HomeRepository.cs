using System;
using Core.DTO;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories;

public class HomeRepository : IHomeRepository
{
    private readonly AppDbContext _context;

    public HomeRepository(AppDbContext context)
    {
        _context = context ?? throw new ArgumentNullException(nameof(context));
    }
    public async Task<HomeDto> GetHomeDocumentFolders(HomeFilterDto filter)
    {
        var query = _context.Folders
            .Include(f => f.Department)
            .Include(f => f.Documents)
            .Where(f => f.DepartmentId == filter.DepartmentId || filter.DepartmentId == null);

        // Optional: Add filtering by date range etc.
        if (filter.CreatedFrom != null)
        {
            query = query.Where(f => f.CreatedAt >= filter.CreatedFrom);
        }

        if (filter.CreatedTo != null)
        {
            query = query.Where(f => f.CreatedAt <= filter.CreatedTo);
        }

        // Pagination
        var folders = await query
            .Skip((filter.PageNumber - 1) * filter.PageSize)
            .Take(filter.PageSize)
            .ToListAsync();

        var folderDtos = folders.Select(folder => new HomeFolderDto
        {
            Id = folder.Id,
            Name = folder.Name,
            DepartmentId = folder.DepartmentId,
            CreatedAt = folder.CreatedAt,
            DocumentsCount = folder.Documents.Count,
            SubFoldersCount = 0 // Update if you track subfolders
        }).ToList();

        var documentDtos = folders
            .SelectMany(f => f.Documents)
            .Select(doc => new HomeDocumentDTO
            {
                Id = doc.Id,
                Name = doc.Name,
                FileSize = doc.FileSize,
                FileType = doc.FileType,
                CreatedAt = doc.CreatedAt,
                UpdatedAt = doc.UpdatedAt
            }).ToList();
        
        var documents = await _context.Documents
            .Where(d => d.DepartmentId == filter.DepartmentId || filter.DepartmentId == null)
            .ToListAsync();

        documentDtos.AddRange(documents.Select(doc => new HomeDocumentDTO
        {
            Id = doc.Id,
            Name = doc.Name,
            FileSize = doc.FileSize,
            FileType = doc.FileType,
            CreatedAt = doc.CreatedAt,
            UpdatedAt = doc.UpdatedAt
        }));
        


        return new HomeDto
        {
            TotalFolders = folderDtos.Count,
            TotalDocuments = documentDtos.Count,
            LastUpdated = DateTime.UtcNow,
            Folders = folderDtos,
            Documents = documentDtos
        };
}


    private IQueryable<HomeDto> ApplySorting(IQueryable<HomeDto> query, string? sortBy, string? sortDirection)
    {
        // if (string.IsNullOrEmpty(sortBy))
        // {
        //     return query.OrderBy(f => f.CreatedAt);
        // }

        return sortDirection?.ToLower() == "desc"
            ? query.OrderByDescending(f => EF.Property<object>(f, sortBy))
            : query.OrderBy(f => EF.Property<object>(f, sortBy));
    }

    // Task<PagedResult<HomeDto>> IHomeRepository.GetHomeDocumentFolders(HomeFilterDto filter)
    // {
    //     throw new NotImplementedException();
    // }
}
