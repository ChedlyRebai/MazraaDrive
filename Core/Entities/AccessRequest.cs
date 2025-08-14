using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities;

public class AccessRequest : BaseEntity<int>
{
    public int DocumentId { get; set; }
    public string RequesterId { get; set; } = null!;
    
    public bool RequestRead { get; set; }
    public bool RequestWrite { get; set; }

    public bool RequestDelete { get; set; }

    public string Status { get; set; } = "Pending"; // Pending, Approved, Rejected

    public DateTime? DecisionAt { get; set; }
    public string? DecidedById { get; set; }

    // Navigation
    public Document Document { get; set; } = null!;
    public AppUser Requester { get; set; } = null!;
    public AppUser? DecidedBy { get; set; }
}


