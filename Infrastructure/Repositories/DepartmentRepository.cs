using System;
using System.Linq.Expressions;
using AutoMapper;
using Core.DTO;
using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories;

public class DepartmentRepository : GenericRepository<Department>, IDepartmentRepository
{
    private readonly AppDbContext _context;

    public DepartmentRepository(AppDbContext context) : base(context)
    {
        _context = context ?? throw new ArgumentNullException(nameof(context));
    }

    public async Task<PagedResult<Department>> GetPageAsync(DepartmentFilterDto filter)
    {
        var query = _context.Departments.AsQueryable();

        // Apply filters
        query = ApplyFilters(query, filter);

        // Get total count before pagination
        var totalRecords = await query.CountAsync();

        // Apply sorting
        query = ApplySorting(query, filter.SortBy, filter.SortDirection);

        // Apply pagination
        var departments = await query
            .Include(d => d.Users)
            .Skip((filter.PageNumber - 1) * filter.PageSize)
            .Take(filter.PageSize)
            .ToListAsync();

        return departments.ToPagedResult(
            filter.PageNumber,
            filter.PageSize,
            totalRecords,
            filter.Search,
            filter.SortBy,
            filter.SortDirection
        );
    }
    public async Task<Department> AddAsync(Department department)
    {
        if (department == null)
            throw new ArgumentNullException(nameof(department), "Department cannot be null");

        department.CreatedAt = DateTime.UtcNow;
        department.UpdatedAt = DateTime.UtcNow;

        var result = await _context.Departments.AddAsync(department);
        return result.Entity;
    }

    public async Task DeleteAsync(int id)
    {
        var department = await _context.Departments.FindAsync(id);
        if (department == null)
            throw new ArgumentException($"Department with id {id} not found");

        _context.Departments.Remove(department);
    }

    public async Task<IReadOnlyList<Department>> GetAllAsync()
    {
        return await _context.Departments
            .Include(d => d.Users)
            .Include(d => d.Folders)
            .Include(d => d.DocumentRequests)
            .OrderBy(d => d.Name)
            .ToListAsync();
    }

    public async Task<Department?> GetByIdAsync(int id)
    {
        return await _context.Departments
            .Include(d => d.Users)
            .Include(d => d.Folders)
            .Include(d => d.DocumentRequests)
            .FirstOrDefaultAsync(d => d.Id == id);
    }

    public async Task<Department?> GetByNameAsync(string name)
    {
        if (string.IsNullOrEmpty(name))
            return null;

        return await _context.Departments
            .FirstOrDefaultAsync(d => d.Name.ToLower() == name.ToLower());
    }

    public async Task UpdateAsync(Department department)
    {
        if (department == null)
            throw new ArgumentNullException(nameof(department), "Department cannot be null");

        department.UpdatedAt = DateTime.UtcNow;
        _context.Departments.Update(department);
    }

    public async Task<bool> ExistsAsync(int id)
    {
        return await _context.Departments.AnyAsync(d => d.Id == id);
    }

    public async Task<bool> ExistsByNameAsync(string name)
    {
        if (string.IsNullOrEmpty(name))
            return false;

        return await _context.Departments
            .AnyAsync(d => d.Name.ToLower() == name.ToLower());
    }

    public async Task<IReadOnlyList<Department>> GetWithUserCountAsync()
    {
        return await _context.Departments
            .Include(d => d.Users)
            .OrderBy(d => d.Name)
            .ToListAsync();
    }
    
    private IQueryable<Department> ApplyFilters(IQueryable<Department> query, DepartmentFilterDto filter)
        {
            if (!string.IsNullOrEmpty(filter.Name))
                query = query.Where(d => d.Name.Contains(filter.Name));

            if (filter.CreatedFrom.HasValue)
                query = query.Where(d => d.CreatedAt >= filter.CreatedFrom);

            if (filter.CreatedTo.HasValue)
                query = query.Where(d => d.CreatedAt <= filter.CreatedTo);

            if (!string.IsNullOrEmpty(filter.Search))
            {
                query = query.Where(d => 
                    d.Name.Contains(filter.Search) ||
                    d.Description.Contains(filter.Search)
                );
            }

            // Note: User count filtering will be applied after including users
            // This is done in the main query method

            return query;
        }

        private IQueryable<Department> ApplySorting(IQueryable<Department> query, string? sortBy, string? sortDirection)
        {
            if (string.IsNullOrEmpty(sortBy))
                return query.OrderBy(d => d.Name);

            var isDescending = sortDirection?.ToLower() == "desc";

            return sortBy.ToLower() switch
            {
                "name" => isDescending ? query.OrderByDescending(d => d.Name)
                                       : query.OrderBy(d => d.Name),
                "description" => isDescending ? query.OrderByDescending(d => d.Description)
                                              : query.OrderBy(d => d.Description),
                "createdat" => isDescending ? query.OrderByDescending(d => d.CreatedAt)
                                            : query.OrderBy(d => d.CreatedAt),
                "updatedat" => isDescending ? query.OrderByDescending(d => d.UpdatedAt)
                                            : query.OrderBy(d => d.UpdatedAt),
                _ => query.OrderBy(d => d.Name)
            };
        }

    public async Task<IEnumerable<DepartmentSearchDTO>> SearchAsync(string searchTerm)
    {
        if (string.IsNullOrEmpty(searchTerm))
        {
            return Array.Empty<DepartmentSearchDTO>();
        }

        var departments = await _context.Departments.Where(d => d.Name.Contains(searchTerm))
            .Select(d => new DepartmentSearchDTO
            {
                Name = d.Name,
                Description = d.Description
            })
            .ToListAsync();

        return departments;
    }
}