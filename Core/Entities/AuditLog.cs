using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities;

public class AuditLog : BaseEntity<int>
{
    [Required]
    public string UserId { get; set; }
    public string ActionType { get; set; }

    public string? UserAgent { get; set; }

    public string? IPAddress { get; set; }
    [Required]
    [MaxLength(255)]
    public string Action { get; set; }

    [MaxLength(255)]
    public string TargetEntity { get; set; }
 // FIXED: Changed from Guid to int

    public DateTime Timestamp { get; set; } = DateTime.UtcNow;

    // Navigation properties
    [ForeignKey(nameof(UserId))]
    public virtual AppUser User { get; set; }



    public string Description { get; set; }

}