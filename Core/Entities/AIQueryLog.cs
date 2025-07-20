using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities;

public class AIQueryLog : BaseEntity<int>
{
    [Required]
    public string UserId { get; set; }  // FIXED: Changed from Guid to string

    [Required]
    public string Question { get; set; }

    public string ResultSummary { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    // Navigation properties
    [ForeignKey(nameof(UserId))]
    public virtual AppUser User { get; set; }
}