using System;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities;
using Microsoft.AspNetCore.Identity;


public class AppUser : IdentityUser
{
    public string DisplayName { get; set; }


    [Required]
    [MaxLength(50)]
    public string Role { get; set; }
    public Address Address { get; set; }
    public int AddressId { get; set; }
    [Required]
    public Guid DepartmentId { get; set; }

    // Navigation properties
    public Department Department { get; set; }
    public ICollection<AccessRight> AccessRights { get; set; }
    public ICollection<Folder> CreatedFolders { get; set; }
    public ICollection<Document> UploadedDocuments { get; set; }
    public ICollection<DocumentRequest> DocumentRequests { get; set; }
    public ICollection<AIQueryLog> AIQueryLogs { get; set; }
    public ICollection<AuditLog> AuditLogs { get; set; }
    public ICollection<Message> SentMessages { get; set; }
    public ICollection<Message> ReceivedMessages { get; set; }
    public ICollection<MailFolder> MailFolders { get; set; }
}
