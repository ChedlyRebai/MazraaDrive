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

    private readonly IMapper mapper;
    private readonly AppDbContext _context;

    public DepartmentRepository(AppDbContext context, IMapper mapper) : base(context)
    {
        this.mapper = mapper;
        this._context = context;

    }

    public async Task AddAsync(Department department)
    {
        if (department == null)
        {
            throw new ArgumentNullException(nameof(department), "Department cannot be null");
        }

        var dep = await _context.Departments.AddAsync(department);
        await _context.SaveChangesAsync();

    }


    public Task DeleteAsync(int id)
    {
        var department = _context.Departments.Find(id);
        if (department == null)
        {
            throw new ArgumentException($"Department with id {id} not found");
        }

        _context.Departments.Remove(department);
        return _context.SaveChangesAsync();
    }

    public async Task<IReadOnlyList<Department>> GetAllAsync()
    {
        var departments = await _context.Departments.ToListAsync();
        if (departments == null || departments.Count == 0)
        {
            throw new InvalidOperationException("No departments found");
        }
        return departments;
    }



    public Task<Department> GetByIdAsync(int id)
    {
        var department = _context.Departments.FirstAsync(dep => dep.Id == id);
        if (department == null)
        {
            throw new ArgumentException($"Department with id {id} not found");
        }
        return department;
    }


    public Task UpdateAsync(Department entity)
    {
        if (entity == null)
        {
            throw new ArgumentNullException(nameof(entity), "Department cannot be null");
        }

        _context.Departments.Update(entity);
        return _context.SaveChangesAsync();
    }
}
