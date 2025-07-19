using System;

namespace Core.Entities;
using System.ComponentModel.DataAnnotations;

public class AuditLog : BaseEntity<int>
{

    [Required]
    public Guid UserId { get; set; }

    [Required]
    [MaxLength(255)]
    public string Action { get; set; }

    [Required]
    [MaxLength(255)]
    public string TargetEntity { get; set; }

    [Required]
    public Guid TargetId { get; set; }

    public DateTime Timestamp { get; set; } = DateTime.UtcNow;

    // Navigation properties
    public AppUser User { get; set; }

}
