using System;
using Core.DTO;
using Core.DTOs;
using Core.Entities;
using Microsoft.AspNetCore.Identity;

namespace Core.Interfaces;

public interface IRoleRepository : IGenericRepository<Role>
{
    // Task<PagedResult<Role>> GetPagedAsync(RoleFilterDto filter, PaginationParams paginationParams);

    // Task<Role[]> SearchAsync(string searchTerm);
    // Task<IEnumerable<IdentityRole<string>>> GetAllAsync();
    // Task<Role?> GetByIdAsync(string id);
    // Task<Role?> GetByNameAsync(string name);
    // Task<Role> AddAsync(Role role);
    // Task UpdateAsync(Role role);
    // Task DeleteAsync(string id);
    // Task<bool> ExistsAsync(string id);
    // Task<bool> ExistsByNameAsync(string name);
    // Task<string> testapi();
    Task<IEnumerable<IdentityRole<string>>> GetAllAsync();
    Task<Role?> GetByIdAsync(string id);
    Task<Role?> GetByNameAsync(string name);
    Task<Role?> AddAsync(Role role);
    Task<bool> UpdateAsync(Role role);
    Task<bool> DeleteAsync(string id);
    Task<bool> ExistsAsync(string id);
    Task<bool> ExistsByNameAsync(string name);
    Task<PagedResult<Role>> GetPagedAsync(RoleFilterDto filter, PaginationParams paginationParams);
    Task<Role[]> SearchAsync(string searchTerm);
}
