using System.ComponentModel.DataAnnotations;
using Core.DTO;
using Core.Entities;

namespace Core.DTOs
{
    public class UserDto
    {
        public string Id { get; set; }
        public string UserName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;

        public string PhoneNumber { get; set; } = string.Empty;
        public bool IsActive { get; set; }
        public long? Cin { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public int? RoleId { get; set; }
        public string RoleName { get; set; } = string.Empty;
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; } = string.Empty;
        public bool EmailConfirmed { get; set; }
        public bool PhoneNumberConfirmed { get; set; }
        public bool LockoutEnabled { get; set; }
        public DateTimeOffset? LockoutEnd { get; set; }
        public int AccessFailedCount { get; set; }
    }

    public class CreateUserDto
    {
        [Required(ErrorMessage = "Username is required")]
        [StringLength(50, ErrorMessage = "Username cannot exceed 50 characters")]
        public string UserName { get; set; } = string.Empty;


        public long? Cin { get; set; }

        [Required(ErrorMessage = "Password is required")]
        [StringLength(100, MinimumLength = 6, ErrorMessage = "Password must be at least 6 characters")]
        public string Password { get; set; } = string.Empty;

        [Compare("Password", ErrorMessage = "Passwords do not match")]
        public string ConfirmPassword { get; set; } = string.Empty;

        [Phone(ErrorMessage = "Invalid phone number format")]
        public string PhoneNumber { get; set; } = string.Empty;

        public int? RoleId { get; set; }

        [Required(ErrorMessage = "Department is required")]
        public int DepartmentId { get; set; }
    }

    public class UpdateUserDto
    {
        public string? UserName { get; set; }
        public long? Cin { get; set; }
        public string? Email { get; set; }
        public string? FullName { get; set; }
        public string? PhoneNumber { get; set; }
        public bool? IsActive { get; set; }
        public int? RoleId { get; set; }
        public int? DepartmentId { get; set; }
    }

    public class ChangePasswordDto
    {
        [Required(ErrorMessage = "Current password is required")]
        public string CurrentPassword { get; set; } = string.Empty;

        [Required(ErrorMessage = "New password is required")]
        [StringLength(100, MinimumLength = 6, ErrorMessage = "Password must be at least 6 characters")]
        public string NewPassword { get; set; } = string.Empty;

        [Compare("NewPassword", ErrorMessage = "Passwords do not match")]
        public string ConfirmNewPassword { get; set; } = string.Empty;
    }

    public class ResetPasswordDto
    {
        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid email format")]
        public string Email { get; set; } = string.Empty;

        [Required(ErrorMessage = "Token is required")]
        public string Token { get; set; } = string.Empty;

        [Required(ErrorMessage = "New password is required")]
        [StringLength(100, MinimumLength = 6, ErrorMessage = "Password must be at least 6 characters")]
        public string NewPassword { get; set; } = string.Empty;

        [Compare("NewPassword", ErrorMessage = "Passwords do not match")]
        public string ConfirmNewPassword { get; set; } = string.Empty;
    }

    public class UserRoleDto
    {
        public int UserId { get; set; }
        public string UserName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public List<string> Roles { get; set; } = new List<string>();
    }

    // Pagination DTOs
    public class UserFilterDto : PaginationParams
    {
        public string? UserName { get; set; }

        public string? PhoneNumber { get; set; }
        public bool? IsActive { get; set; }

        public int? RoleId { get; set; }
        public string? RoleName { get; set; }
        public int? DepartmentId { get; set; }
        public string? DepartmentName { get; set; }

    }

    public class UserPagedResult : PagedResult<UserDto>
    {
        public int TotalUsers { get; set; }
        public int ActiveUsers { get; set; }
        public int InactiveUsers { get; set; }
        public int TotalDocuments { get; set; }
        public int TotalFolders { get; set; }
    }

    public class UserWithDetailsDto : UserDto
    {
        public IEnumerable<UserDocumentDto> RecentDocuments { get; set; } = new List<UserDocumentDto>();
        public IEnumerable<UserFolderDto> RecentFolders { get; set; } = new List<UserFolderDto>();
        public IEnumerable<string> Permissions { get; set; } = new List<string>();
        public DateTime? LastLoginAt { get; set; }
        public string? LastLoginIP { get; set; }
    }

    // public string Name { get; set; }
    // public string FileType { get; set; }

    // public string StoragePath { get; set; }
    // public int FolderId { get; set; }
    // public string UploadedById { get; set; } 
    // public int Version { get; set; } = 1;
    // public bool IsValidated { get; set; } = false;
    // public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    // public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
    // public virtual Folder Folder { get; set; }
    // public virtual AppUser UploadedBy { get; set; }

    // public virtual ICollection<DocumentRequest> DocumentRequests { get; set; }


    public class UserDepartmentFoldersDocumentsDTO
    {
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; } = string.Empty;
        public List<UserFolderDto> Folders { get; set; } = new List<UserFolderDto>();
        public List<UserDocumentDto> Documents { get; set; } = new List<UserDocumentDto>();
    }


    public class UserDocumentDto
    {
        public int Id { get; set; }
        public long FileSize { get; set; }
        public string Name { get; set; } = string.Empty;
        public string FileType { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
    }



    public class UserFolderDto
    {
        public int Id { get; set; }
        public int DepartmentId { get; set; }
        public string Name { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; }

        public int SubFoldersCount { get; set; }
        public int DocumentsCount { get; set; }
    }
    

    public class UserStatisticsDto
    {
        public int TotalUsers { get; set; }
        public int ActiveUsers { get; set; }
        public int InactiveUsers { get; set; }
        public int TotalDocuments { get; set; }
        public int TotalFolders { get; set; }
    }
}