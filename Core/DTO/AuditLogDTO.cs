using System;
using System.ComponentModel.DataAnnotations;

namespace Core.DTOs
{
    public class AuditLogDTO
    {
        [Required]
        public string UserId { get; set; } = string.Empty;

        public string ActionType { get; set; } = string.Empty;

        public string? UserAgent { get; set; }

        public string? IPAddress { get; set; }

        [Required]
        [MaxLength(255)]
        public string Action { get; set; } = string.Empty;

        [MaxLength(255)]
        public string TargetEntity { get; set; } = string.Empty;

        public DateTime Timestamp { get; set; } = DateTime.UtcNow;

        public string Description { get; set; } = string.Empty;
    }
}