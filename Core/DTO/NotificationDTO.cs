using System;

namespace Core.DTO;



public class NotificationDTO
{

    public string title { get; set; }

    public string UserId { get; set; }

    public string Message { get; set; }

    public bool IsRead { get; set; } = false;
    public string? Link { get; set; }

    public NotificationType Type { get; set; } = NotificationType.Info;

    public string? ActionUrl { get; set; } // URL for the notification action

    public string? SenderId { get; set; } // ID of the user who triggered the notification

    // Navigation properties
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