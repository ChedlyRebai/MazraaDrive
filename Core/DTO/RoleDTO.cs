// Create: Core/DTOs/RoleDto.cs
using Core.DTO;

namespace Core.DTOs
{
    public class RoleDto
    {
        public string id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string NormalizedName { get; set; } = string.Empty;
        public bool IsActive { get; set; } = true;
    }

    public class CreateRoleDto
    {
        public string NormalizedName { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public bool IsActive { get; set; } = true;
    }

    public class UpdateRoleDto
    {
        public string? Name { get; set; }
        public string? Description { get; set; }
        public bool? IsActive { get; set; }
    }

    public class RoleFilterDto : PaginationParams
    {
        public string? Name { get; set; }
        public bool? IsActive { get; set; }
        public DateTime? CreatedFrom { get; set; }
        public DateTime? CreatedTo { get; set; }
    }

    public class RolePagedResult : PagedResult<RoleDto>
    {
        public int TotalRoles { get; set; }
        public int ActiveRoles { get; set; }
        public int InactiveRoles { get; set; }
    }
}