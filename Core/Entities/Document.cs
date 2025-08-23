using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities;

public class Document : BaseEntity<int>
{
    [Required]
    [MaxLength(255)]
    public string Name { get; set; }

    [Required]
    [MaxLength(50)]
    public string FileType { get; set; }

    public long FileSize { get; set; }

    public string? Description { get; set; } = string.Empty;

    [Required]
    [MaxLength(500)]
    public string StoragePath { get; set; }

    
    public int? FolderId { get; set; }  // FIXED: Changed from Guid to int

    [Required]
    public string UploadedById { get; set; }  // FIXED: Changed from Guid to string

    public int DepartmentId { get; set; }  // FIXED: Changed from Guid to int
    [ForeignKey(nameof(DepartmentId))]
    public virtual Department? Department { get; set; }
    public int? Version { get; set; } = 1;
    public bool? IsValidated { get; set; } = false;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    // Navigation properties
    [ForeignKey(nameof(FolderId))]
    public virtual Folder? Folder { get; set; }
    
    [ForeignKey(nameof(UploadedById))]
    public virtual AppUser UploadedBy { get; set; }
    
    public virtual ICollection<DocumentRequest> DocumentRequests { get; set; }
}