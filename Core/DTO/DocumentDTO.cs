using System.ComponentModel.DataAnnotations;
using Core.DTO;
using Microsoft.AspNetCore.Http;

namespace Core.DTOs
{
    public class DocumentDto
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string FileType { get; set; } = string.Empty;
        public long FileSize { get; set; }
        public string FileSizeFormatted { get; set; } = string.Empty;
        public string StoragePath { get; set; } = string.Empty;
        public int FolderId { get; set; }
        public string FolderName { get; set; } = string.Empty;
        public string UploadedById { get; set; } = string.Empty;
        public string UploadedByName { get; set; } = string.Empty;
        public int Version { get; set; }
        public bool IsValidated { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public int RequestCount { get; set; }
    }
   
    public class CreateDocumentDto
    {
        [Required(ErrorMessage = "Document name is required")]
        [StringLength(255, ErrorMessage = "Document name cannot exceed 255 characters")]
        public string Name { get; set; } = string.Empty;

        [StringLength(1000, ErrorMessage = "Description cannot exceed 1000 characters")]
        public string Description { get; set; } = string.Empty;

        [Required(ErrorMessage = "File type is required")]
        [StringLength(50, ErrorMessage = "File type cannot exceed 50 characters")]
        public string FileType { get; set; } = string.Empty;

        [Required(ErrorMessage = "Folder ID is required")]
        public int FolderId { get; set; }

        [Required(ErrorMessage = "File is required")]
        public IFormFile File { get; set; } = null!;
    }

    public class UpdateDocumentDto
    {
        [StringLength(255, ErrorMessage = "Document name cannot exceed 255 characters")]
        public string? Name { get; set; }
        
        [StringLength(1000, ErrorMessage = "Description cannot exceed 1000 characters")]
        public string? Description { get; set; }
        
        public int? FolderId { get; set; }
        public bool? IsValidated { get; set; }
        public bool? IsActive { get; set; }
    }

    public class DocumentUploadDto
    {
        [Required(ErrorMessage = "File is required")]
        public IFormFile File { get; set; } = null!;
        
        [Required(ErrorMessage = "Folder ID is required")]
        public int FolderId { get; set; }
        
        [StringLength(1000)]
        public string Description { get; set; } = string.Empty;
    }

    public class DocumentSummaryDto
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string FileType { get; set; } = string.Empty;
        public string FileSizeFormatted { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; }
        public bool IsValidated { get; set; }
    }



    public class DocumentFilterDto : PaginationParams
    {
        public string? Name { get; set; }
        public string? FileType { get; set; }
        public int? FolderId { get; set; }
        public string? FolderName { get; set; }
        public string? UploadedById { get; set; }
        public string? UploadedByName { get; set; }
        public bool? IsValidated { get; set; }
        public bool? IsActive { get; set; }
        public DateTime? CreatedFrom { get; set; }
        public DateTime? CreatedTo { get; set; }
        public DateTime? UpdatedFrom { get; set; }
        public DateTime? UpdatedTo { get; set; }
        public long? MinFileSize { get; set; }
        public long? MaxFileSize { get; set; }
        public int? MinVersion { get; set; }
        public int? MaxVersion { get; set; }
        public string[]? FileTypes { get; set; } // Filter by multiple file types
    }

    public class DocumentPagedResult : PagedResult<DocumentDto>
{
    public int TotalDocuments { get; set; }
    public int TotalUsers { get; set; }
}

}