using System;
using System.ComponentModel.DataAnnotations;

namespace Core.DTOs
{public class AuditLogDto
{
    public int Id { get; set; }
    public string UserId { get; set; }
    public string UserName { get; set; }
    public string ActionType { get; set; }
    public string Action { get; set; }
    public string TargetEntity { get; set; }
    public string Description { get; set; }
    public string IPAddress { get; set; }
    public string UserAgent { get; set; }
    public DateTime CreatedAt { get; set; }
}

public class CreateAuditLogDto
{
    [Required]
    public string UserId { get; set; }
    
    [Required]
    [MaxLength(255)]
    public string ActionType { get; set; }
    
    [Required]
    [MaxLength(255)]
    public string Action { get; set; }
    
    [MaxLength(255)]
    public string TargetEntity { get; set; }
    
    public string Description { get; set; }
    
    public string IPAddress { get; set; }
    
    public string UserAgent { get; set; }
}

public class UpdateAuditLogDto
{
    [MaxLength(255)]
    public string ActionType { get; set; }
    
    public string Description { get; set; }
}

public class DeleteAuditLogsDto
{
    [Required]
    [MinLength(1, ErrorMessage = "At least one ID must be provided")]
    public IEnumerable<int> Ids { get; set; }
}

public class AuditLogStatisticsDto
{
    public int TotalLogs { get; set; }
    public List<string> ActionTypes { get; set; } = new();
    public List<string> TargetEntities { get; set; } = new();
    public DateTime GeneratedAt { get; set; }
}
}