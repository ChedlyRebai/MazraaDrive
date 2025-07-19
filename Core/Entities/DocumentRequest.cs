using System;

namespace Core.Entities;
using System.ComponentModel.DataAnnotations;

public class DocumentRequest : BaseEntity<int>
{
    [Required]
    public Guid RequesterId { get; set; }

    [Required]
    public Guid DepartmentId { get; set; }

    [Required]
    [MaxLength(255)]
    public string DocumentType { get; set; }

    [MaxLength(1000)]
    public string Description { get; set; }

    [Required]
    [MaxLength(50)]
    public string Priority { get; set; }

    [Required]
    [MaxLength(50)]
    public string Status { get; set; } = "Pending";

    public Guid? ResponseDocumentId { get; set; }

    public DateTime RequestedAt { get; set; } = DateTime.UtcNow;

    public DateTime? RespondedAt { get; set; }

    // Navigation properties
    public AppUser Requester { get; set; }
    public Department Department { get; set; }
    public Document ResponseDocument { get; set; }
}
