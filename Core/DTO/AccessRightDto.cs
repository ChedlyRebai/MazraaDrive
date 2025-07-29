
using System.ComponentModel.DataAnnotations;
using Core.DTO;

namespace Core.DTOs
{
     public class AccessRightFilterDto : PaginationParams
    {
        public string? UserId { get; set; }
        public string? UserName { get; set; }
        public int? DocumentId { get; set; }
        public int? FolderId { get; set; }
        public string? Type { get; set; } // "Document" or "Folder"
        public bool? IsActive { get; set; }
        public bool? CanCreate { get; set; }
        public bool? CanRead { get; set; }
        public bool? CanUpdate { get; set; }
        public bool? CanDelete { get; set; }
        public DateTime? CreatedFrom { get; set; }
        public DateTime? CreatedTo { get; set; }
    }

    public class AccessRightPagedResult : PagedResult<AccessRightDto>
    {
        public AccessRightSummaryDto? Summary { get; set; }
    }

    
    public class AccessRightDto
    {
        public int Id { get; set; }
        public string UserId { get; set; } = string.Empty;
        public string UserName { get; set; } = string.Empty;
        public string UserFullName { get; set; } = string.Empty;
        public int? DocumentId { get; set; }
        public string? DocumentName { get; set; }
        public int? FolderId { get; set; }
        public string? FolderName { get; set; }
        public string Type { get; set; } = string.Empty;
        public bool CanCreate { get; set; }
        public bool CanRead { get; set; }
        public bool CanUpdate { get; set; }
        public bool CanDelete { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
    }

    public class CreateAccessRightDto
    {
        [Required(ErrorMessage = "User ID is required")]
        public string UserId { get; set; } = string.Empty;

        public int? DocumentId { get; set; }
        public int? FolderId { get; set; }

        public bool CanCreate { get; set; } = false;
        public bool CanRead { get; set; } = true;
        public bool CanUpdate { get; set; } = false;
        public bool CanDelete { get; set; } = false;

        // Validation: Either DocumentId or FolderId must be provided
        public bool IsValid => (DocumentId.HasValue && !FolderId.HasValue) || 
                              (!DocumentId.HasValue && FolderId.HasValue);
    }

    public class UpdateAccessRightDto
    {
        public bool? CanCreate { get; set; }
        public bool? CanRead { get; set; }
        public bool? CanUpdate { get; set; }
        public bool? CanDelete { get; set; }
        public bool? IsActive { get; set; }
    }

    public class BulkAccessRightDto
    {
        [Required]
        public List<string> UserIds { get; set; } = new List<string>();
        
        public int? DocumentId { get; set; }
        public int? FolderId { get; set; }
        
        public bool CanCreate { get; set; } = false;
        public bool CanRead { get; set; } = true;
        public bool CanUpdate { get; set; } = false;
        public bool CanDelete { get; set; } = false;
    }

    public class AccessRightSummaryDto
    {
        public string UserId { get; set; } = string.Empty;
        public string UserName { get; set; } = string.Empty;
        public int TotalRights { get; set; }
        public int DocumentRights { get; set; }
        public int FolderRights { get; set; }
        public int CreateRights { get; set; }
        public int UpdateRights { get; set; }
        public int DeleteRights { get; set; }
    }
}