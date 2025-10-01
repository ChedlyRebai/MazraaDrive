using System;

namespace Core.Interfaces
{
    public interface ICurrentUserService
    {
        string? UserId { get; }
        string? DepartmentId { get; }

        string? RoleId { get; }
        string? RoleName { get; }

        string? UserName { get; }
        bool IsAuthenticated { get; }

        bool IsInAllRoles(params string[] roles);
        bool IsInAnyRole(params string[] roles);
    }
}