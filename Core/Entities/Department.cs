using System;

namespace Core.Entities;
using System.ComponentModel.DataAnnotations;

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
    public ICollection<AppUser> Users { get; set; }
    public ICollection<Folder> Folders { get; set; }
    public ICollection<DocumentRequest> DocumentRequests { get; set; }
}
