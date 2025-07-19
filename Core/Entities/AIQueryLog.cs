using System;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities;

public class AIQueryLog : BaseEntity<int>
{


    [Required]
    public Guid UserId { get; set; }

    [Required]
    public string Question { get; set; }

    public string ResultSummary { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    // Navigation properties
    public AppUser User { get; set; }
}
