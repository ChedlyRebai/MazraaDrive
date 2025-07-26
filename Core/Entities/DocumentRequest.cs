using System;

namespace Core.Entities;
using System.ComponentModel.DataAnnotations;

public class DocumentRequest : BaseEntity<int>
{
    
    public int RequesterId { get; set; }

    
    public int DepartmentId { get; set; }

    
    
    public string DocumentType { get; set; }

  
    public string Description { get; set; }

    
    
    public string Priority { get; set; }

    
    
    public string Status { get; set; } = "Pending";

    public int? ResponseDocumentId { get; set; }

    public DateTime RequestedAt { get; set; } = DateTime.UtcNow;

    public DateTime? RespondedAt { get; set; }

    // Navigation properties
    public AppUser Requester { get; set; }
    public Department Department { get; set; }
    public Document ResponseDocument { get; set; }
}
