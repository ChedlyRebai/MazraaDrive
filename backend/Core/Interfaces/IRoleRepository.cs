using System;
using Core.DTO;
using Core.DTOs;
using Core.Entities;
using Microsoft.AspNetCore.Identity;

namespace Core.Interfaces;

public interface IRoleRepository : IGenericRepository<Role>
{

    Task<IEnumerable<IdentityRole<string>>> GetAllAsync();
    Task<Role?> GetByIdAsync(string id);
    Task<Role?> GetByNameAsync(string name);
    Task<Role?> AddAsync(Role role);
    Task<bool> UpdateAsync(Role role);
    Task<bool> DeleteAsync(string id);
    Task<bool> ExistsAsync(string id);
    Task<bool> ExistsByNameAsync(string name);
    Task<List<Role>> GetAllRoles();
    Task<PagedResult<Role>> GetPagedAsync(RoleFilterDto filter, PaginationParams paginationParams);
    Task<Role[]> SearchAsync(string searchTerm);
}
