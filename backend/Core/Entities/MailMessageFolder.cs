using System;

namespace Core.Entities;
using System.ComponentModel.DataAnnotations;

public class MailMessageFolder : BaseEntity<int>
{
    
    public int MessageId { get; set; }

    public int MailFolderId { get; set; }

    // Navigation properties
    public Message Message { get; set; }
    public MailFolder MailFolder { get; set; }
}
