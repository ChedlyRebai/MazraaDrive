using System;
using System.Linq.Expressions;
using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories;

public class RoleRepository : IRoleRepository
{
    private readonly AppDbContext _context;
    public RoleRepository(AppDbContext context)
    {
        _context = context;
    }
    public Task AddAsync(Role entity)
    {
        if (entity == null)
        {
            throw new ArgumentNullException(nameof(entity), "Role cannot be null");
        }

        // If _context.Roles expects IdentityRole, map your Role to IdentityRole
        var identityRole = new Microsoft.AspNetCore.Identity.IdentityRole
        {
            Id = entity.Id.ToString(),
            Name = entity.Name,
            NormalizedName = entity.Name?.ToUpper()
        };
        _context.Roles.Add(identityRole);
        return _context.SaveChangesAsync();
    }


    public Task DeleteAsync(int id)
    {
        var role = _context.Roles.Find(id);
        if (role == null)
        {
            throw new ArgumentException($"Role with id {id} not found");
        }

        _context.Roles.Remove(role);
        return _context.SaveChangesAsync();
    }

    public async Task<IReadOnlyList<Role>> GetAllAsync()
    {
        var identityRoles = await _context.Roles.ToListAsync();
        if (identityRoles == null || !identityRoles.Any())
        {
            throw new InvalidOperationException("No Roles found");
        }

        // Map IdentityRole to your Role entity if needed
        var roles = identityRoles.Select(ir => new Role
        {
            Id = int.TryParse(ir.Id, out var id) ? id : 0,
            Name = ir.Name
        }).ToList();

        return roles;
    }

    public async Task<Role> GetByIdAsync(int id)
    {
        var identityRole = await _context.Roles.FirstOrDefaultAsync(r => r.Id == id.ToString());
        if (identityRole == null)
        {
            throw new ArgumentException($"Role with id {id} not found");
        }

        // Map IdentityRole to your Role entity if needed
        return new Role
        {
            Id = int.TryParse(identityRole.Id, out var roleId) ? roleId : 0,
            Name = identityRole.Name
        };
    }


    public Task UpdateAsync(Role entity)
    {
        if (entity == null)
        {
            throw new ArgumentNullException(nameof(entity), "Role cannot be null");
        }

        var identityRole = _context.Roles.Find(entity.Id.ToString());
        if (identityRole == null)
        {
            throw new ArgumentException($"Role with id {entity.Id} not found");
        }

        identityRole.Name = entity.Name;
        identityRole.NormalizedName = entity.Name?.ToUpper();
        
        _context.Roles.Update(identityRole);
        return _context.SaveChangesAsync();
    }
}
