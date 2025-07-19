using System;

namespace Core.Entities;
using System.ComponentModel.DataAnnotations;

public class Message : BaseEntity<int>
{
    [Required]
    public Guid SenderId { get; set; }

    [Required]
    public Guid ReceiverId { get; set; }

    [Required]
    [MaxLength(255)]
    public string Subject { get; set; }

    [Required]
    public string Body { get; set; }

    public bool IsRead { get; set; } = false;

    public DateTime SentAt { get; set; } = DateTime.UtcNow;

    // Navigation properties
    public AppUser Sender { get; set; }
    public AppUser Receiver { get; set; }
    public ICollection<MailMessageFolder> MailMessageFolders { get; set; }
}
