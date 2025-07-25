using System;
using System.Linq.Expressions;
using AutoMapper;
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
}