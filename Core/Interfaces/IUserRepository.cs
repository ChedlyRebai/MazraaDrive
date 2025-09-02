using System;
using Core.DTO;
using Core.DTOs;
using Core.Entities;

namespace Core.Interfaces;

public interface IUserRepository
{
        Task<AppUser> AddAsync(AppUser user);
        Task DeleteAsync(string id);
        Task<IReadOnlyList<AppUser>> GetAllAsync();
       
        Task<AppUser?> GetByIdAsync(string id);
        Task UpdateAsync(AppUser user);

        Task<PagedResult<UserDto>> GetPagedAsync(UserFilterDto filter);
        Task<AppUser?> GetByIdWithDetailsAsync(string id);
        Task<AppUser?> GetByEmailAsync(string email);
        
        Task<IReadOnlyList<AppUser>> GetUsersByDepartmentAsync(int departmentId);
        Task<IReadOnlyList<AppUser>> GetUsersByRoleAsync(int roleId);
        Task<bool> IsEmailTakenAsync(string email, string? excludeId = null);

        Task<int> GetTotalCountAsync();
        Task<int> GetActiveCountAsync();
        Task<int> GetInactiveCountAsync();
        Task<int> GetConfirmedEmailsCountAsync();
       
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

        Task<UserStatisticsDto> GetUserStatisticsAsync();
        Task<IReadOnlyList<AppUser>> GetRecentUsersAsync(int count = 10);
}
