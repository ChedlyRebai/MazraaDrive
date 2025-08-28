using System;

namespace Core.Interfaces
{
    public interface ICurrentUserService
    {
        string? UserId { get; }
        string? DepartmentId { get; }

        string? RoleId { get; }
        
        string? UserName { get; }
        bool IsAuthenticated { get; }
    }
}