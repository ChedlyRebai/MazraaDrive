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
    public bool? RequestUpdate { get; set; }

    public bool RequestDelete { get; set; }

    public string? Message { get; set; } = null;
    public string Status { get; set; } = "En Attente"; // En Attente, Approved, Rejected

    public DateTime? DecisionAt { get; set; }
    public string? DecidedById { get; set; }

    [ForeignKey(nameof(DocumentId))]
    public Document Document { get; set; } = null!;

    [ForeignKey(nameof(RequesterId))]
    public AppUser Requester { get; set; } = null!;

    [ForeignKey(nameof(DecidedById))]
    public AppUser? DecidedBy { get; set; }
}


