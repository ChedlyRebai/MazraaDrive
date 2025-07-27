using System;
using Core.Entities;
using Core.Interfaces;

namespace Infrastructure.Repositories;

public class UserRepository : IUserRepository
{
    public Task ActivateUserAsync(int userId)
    {
        throw new NotImplementedException();
    }

    public Task<AppUser> AddAsync(AppUser user)
    {
        throw new NotImplementedException();
    }

    public Task DeactivateUserAsync(int userId)
    {
        throw new NotImplementedException();
    }

    public Task DeleteAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<bool> ExistsAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<int> GetActiveUserCountAsync()
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<AppUser>> GetActiveUsersAsync()
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<AppUser>> GetAllAsync()
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<AppUser>> GetByDepartmentAsync(int departmentId)
    {
        throw new NotImplementedException();
    }

    public Task<AppUser?> GetByEmailAsync(string email)
    {
        throw new NotImplementedException();
    }

    public Task<AppUser?> GetByIdAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<AppUser?> GetByIdAsync(string id)
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<AppUser>> GetByRoleAsync(int roleId)
    {
        throw new NotImplementedException();
    }

    public Task<AppUser?> GetByUserNameAsync(string userName)
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<AppUser>> GetInactiveUsersAsync()
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<AppUser>> GetRecentUsersAsync(int count = 10)
    {
        throw new NotImplementedException();
    }

    public Task<int> GetUserCountAsync()
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<AppUser>> GetUsersWithRolesAsync()
    {
        throw new NotImplementedException();
    }

    public Task<bool> IsEmailTakenAsync(string email, int? excludeUserId = null)
    {
        throw new NotImplementedException();
    }

    public Task<bool> IsUserNameTakenAsync(string userName, int? excludeUserId = null)
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<AppUser>> SearchUsersAsync(string searchTerm)
    {
        throw new NotImplementedException();
    }

    public Task UpdateAsync(AppUser user)
    {
        throw new NotImplementedException();
    }
}
