using System;

namespace Core.Entities;
using System.ComponentModel.DataAnnotations;

public class Document : BaseEntity<int>
{
    [Required]
    [MaxLength(255)]
    public string Name { get; set; }

    [Required]
    [MaxLength(50)]
    public string FileType { get; set; }

    public long FileSize { get; set; }

    [Required]
    [MaxLength(500)]
    public string StoragePath { get; set; }

    [Required]
    public Guid FolderId { get; set; }

    [Required]
    public Guid UploadedById { get; set; }

    public int Version { get; set; } = 1;

    public bool IsValidated { get; set; } = false;

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    // Navigation properties
    public Folder Folder { get; set; }
    public AppUser UploadedBy { get; set; }
    public ICollection<DocumentRequest> DocumentRequests { get; set; }
}
