using System;
using Core.Entities;

namespace Core.Interfaces;

public interface IRoleRepository:IGenericRepository<Role>
{
    Task<IEnumerable<Role>> GetAllAsync();
        Task<Role?> GetByIdAsync(int id);
        Task<Role?> GetByNameAsync(string name);
        Task<Role> AddAsync(Role role);
        Task UpdateAsync(Role role);
        Task DeleteAsync(int id);
        Task<bool> ExistsAsync(int id);
        Task<bool> ExistsByNameAsync(string name);
        Task<string> testapi();
}
