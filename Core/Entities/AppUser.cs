using System;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities;

public class AppUser : IdentityUser
{
    [Required]
    [MaxLength(255)]
    public string FullName { get; set; }
    
    public bool IsActive { get; set; } = true;
    
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    
    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;
    
    // Foreign Keys - FIXED TYPES
    public int? RoleId { get; set; }  // Made nullable, points to Role table
    // Made nullable
    [Required]
    public int DepartmentId { get; set; }  // Changed from Guid to int

    // Navigation properties
    [ForeignKey(nameof(RoleId))]
    public virtual Role Role { get; set; }
    
    
    
    [ForeignKey(nameof(DepartmentId))]
    public virtual Department Department { get; set; }
    
    public virtual ICollection<AccessRight> AccessRights { get; set; }
    public virtual ICollection<Folder> CreatedFolders { get; set; }
    public virtual ICollection<Document> UploadedDocuments { get; set; }
    public virtual ICollection<DocumentRequest> DocumentRequests { get; set; }
    public virtual ICollection<AIQueryLog> AIQueryLogs { get; set; }
    public virtual ICollection<AuditLog> AuditLogs { get; set; }
    //public virtual ICollection<Message> SentMessages { get; set; }
   // public virtual ICollection<Message> ReceivedMessages { get; set; }
    public virtual ICollection<MailFolder> MailFolders { get; set; }
}