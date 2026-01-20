using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities;

public class DocumentRequest : BaseEntity<int>
{
    [ForeignKey("Requester")]
    public string RequesterId { get; set; }

    
    public int DepartmentId { get; set; }
    
    [Required]
    [MaxLength(100)]
    public string DocumentType { get; set; } = string.Empty;


    [Required]
    [MaxLength(500)]
    public string Description { get; set; } = string.Empty;
    
    [Required]
    [MaxLength(20)]
    public string Priority { get; set; } = "Normal";
    
    [Required]
    [MaxLength(20)]
    public string Status { get; set; } = "En Attente";

    public int? ResponseDocumentId { get; set; }

    public DateTime RequestedAt { get; set; } = DateTime.UtcNow;

    public DateTime? RespondedAt { get; set; }

    public string? ResponseMessage { get; set; }

    [ForeignKey("ProcessedBy")]
    public string? ProcessedById { get; set; }
// For document requests
    // Navigation properties
    public AppUser Requester { get; set; } = null!;
    public Department Department { get; set; } = null!;
    public Document? ResponseDocument { get; set; }
    public AppUser? ProcessedBy { get; set; }
}