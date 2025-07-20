using System;

namespace Core.Entities;
using System.ComponentModel.DataAnnotations;

public class MailMessageFolder : BaseEntity<int>
{
    
    public Guid MessageId { get; set; }

    public Guid MailFolderId { get; set; }

    // Navigation properties
    public Message Message { get; set; }
    public MailFolder MailFolder { get; set; }
}
