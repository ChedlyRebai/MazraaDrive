using System;

namespace Core.Entities;
using System.ComponentModel.DataAnnotations;

public class DocumentRequest : BaseEntity<int>
{
    
    public Guid RequesterId { get; set; }

    
    public Guid DepartmentId { get; set; }

    
    
    public string DocumentType { get; set; }

  
    public string Description { get; set; }

    
    
    public string Priority { get; set; }

    
    
    public string Status { get; set; } = "Pending";

    public Guid? ResponseDocumentId { get; set; }

    public DateTime RequestedAt { get; set; } = DateTime.UtcNow;

    public DateTime? RespondedAt { get; set; }

    // Navigation properties
    public AppUser Requester { get; set; }
    public Department Department { get; set; }
    public Document ResponseDocument { get; set; }
}
