using System;

namespace Core.Entities;
using System.ComponentModel.DataAnnotations;

public class Folder : BaseEntity<int>
{
    [Required]
    [MaxLength(255)]
    public string Name { get; set; }

    public Guid? ParentFolderId { get; set; }

    [Required]
    public Guid DepartmentId { get; set; }

    [Required]
    public Guid CreatedById { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    // Navigation properties
    public Folder ParentFolder { get; set; }
    public ICollection<Folder> SubFolders { get; set; }
    public Department Department { get; set; }
    public AppUser CreatedBy { get; set; }
    public ICollection<Document> Documents { get; set; }
}
