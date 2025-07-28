using System;
using Core.Entities;

namespace Core.Interfaces;

public interface IUserRepository
{
        Task<AppUser> AddAsync(AppUser user);
        Task DeleteAsync(string id);
        Task<IReadOnlyList<AppUser>> GetAllAsync();
       
        Task<AppUser?> GetByIdAsync(string id);
        Task UpdateAsync(AppUser user);


        Task<AppUser?> GetByUserNameAsync(string userName);
        Task<IReadOnlyList<AppUser>> GetByDepartmentAsync(int departmentId);
        Task<IReadOnlyList<AppUser>> GetByRoleAsync(int roleId);
        Task<IReadOnlyList<AppUser>> GetActiveUsersAsync();
        Task<IReadOnlyList<AppUser>> GetInactiveUsersAsync();
        
        Task<bool> IsUserNameTakenAsync(string userName, string? excludeUserId = null);
        Task<int> GetUserCountAsync();
        Task<int> GetActiveUserCountAsync();
        Task<IReadOnlyList<AppUser>> SearchUsersAsync(string searchTerm);
        Task DeactivateUserAsync(string userId);
        Task ActivateUserAsync(string userId);
        Task<IReadOnlyList<AppUser>> GetUsersWithRolesAsync();
        Task<IReadOnlyList<AppUser>> GetRecentUsersAsync(int count = 10);
}
