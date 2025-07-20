using System;

namespace Core.Entities;
using System.ComponentModel.DataAnnotations;

public class MailFolder : BaseEntity<int>
{

    public string Name { get; set; }

   
    public Guid UserId { get; set; }

    public Guid? ParentFolderId { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    // Navigation properties
    public AppUser User { get; set; }
    public MailFolder ParentFolder { get; set; }
    public ICollection<MailFolder> SubFolders { get; set; }
    public ICollection<MailMessageFolder> MailMessageFolders { get; set; }
}
