using System;

namespace Core.Entities;
using System.ComponentModel.DataAnnotations;

public class MailMessageFolder : BaseEntity<int>
{
    [Required]
    public Guid MessageId { get; set; }

    [Required]
    public Guid MailFolderId { get; set; }

    // Navigation properties
    public Message Message { get; set; }
    public MailFolder MailFolder { get; set; }
}
