using System;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities;

public class Department : BaseEntity<int>
{
    [Required]
    [MaxLength(255)]
    public string Name { get; set; }

    [MaxLength(1000)]
    public string Description { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    // Navigation properties
    public virtual ICollection<AppUser> Users { get; set; }
    public virtual ICollection<Folder> Folders { get; set; }
    public virtual ICollection<DocumentRequest> DocumentRequests { get; set; }
}