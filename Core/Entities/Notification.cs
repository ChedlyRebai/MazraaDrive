using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities;

public class Notification:BaseEntity<int>
{
    [Required]
    public string title { get; set; }
    [Required]
    public string UserId { get; set; }
    [Required]
    public string Message { get; set; }
   
    public bool IsRead { get; set; } = false;
    public string? Link { get; set; }

    public NotificationType Type { get; set; } = NotificationType.Info;

    public string? ActionUrl { get; set; } // URL for the notification action

    public string? SenderId { get; set; } // ID of the user who triggered the notification

    // Navigation properties
    [ForeignKey(nameof(UserId))]
    public virtual AppUser User { get; set; } = null!;

    [ForeignKey(nameof(SenderId))]
    public virtual AppUser? Sender { get; set; }
    public enum NotificationType
    {
        Info,
        Success,
        Warning,
        Error,
        AccessRequest,
        DocumentUpdate,
        SystemAlert
    }
}
