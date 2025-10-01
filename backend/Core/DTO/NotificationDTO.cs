using System;

namespace Core.DTO;



public class NotificationDTO
{

    public string title { get; set; }

    public string UserId { get; set; }

    public string Message { get; set; }

    public bool IsRead { get; set; } = false;
    public string? Link { get; set; }

    public string? Type { get; set; }

    public string? ActionUrl { get; set; } // URL for the notification action

    public string? SenderId { get; set; } // ID of the user who triggered the notification

    public DateTime CreatedAt { get; set; }
    // Navigation properties

}


public class NotificationPagedResult : PagedResult<NotificationDTO>
{

    public int TotalNotifications { get; set; }
    public int UnreadNotifications { get; set; }
}
