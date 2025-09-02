using System;
using System.ComponentModel.DataAnnotations.Schema;

using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;



namespace Core.Entities;

public class AppUser : IdentityUser<string>
{
    [Required]
    [MaxLength(255)]
    public bool IsActive { get; set; } = true;

    public long? Cin { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    public DateTime UpdatedAt { get; set; } = DateTime.UtcNow;

    // Foreign Keys - FIXED TYPES
    //public string? RoleId { get; set; }  // Made nullable, points to Role table
    // Made nullable
    [Required]
    public int DepartmentId { get; set; }  // Changed from Guid to int

    // Navigation properties
    // [ForeignKey(nameof(RoleId))]
    // public virtual Role Role { get; set; }

    [ForeignKey(nameof(DepartmentId))]
    public virtual Department Department { get; set; }

    public virtual ICollection<AccessRight> AccessRights { get; set; }
    public virtual ICollection<Folder> CreatedFolders { get; set; }
    public virtual ICollection<Document> UploadedDocuments { get; set; }
    public ICollection<DocumentRequest> RequestedDocuments { get; set; } = new List<DocumentRequest>();
    public ICollection<DocumentRequest> ProcessedDocuments { get; set; } = new List<DocumentRequest>();
    public virtual ICollection<AIQueryLog> AIQueryLogs { get; set; }
    public virtual ICollection<AuditLog> AuditLogs { get; set; }
    //public virtual ICollection<Message> SentMessages { get; set; }
    // public virtual ICollection<Message> ReceivedMessages { get; set; }
    public virtual ICollection<MailFolder> MailFolders { get; set; }
}