using System.Data.SqlTypes;

namespace Core.DTOs.AccessRequests;

public class AccessRequestDto
{
    public int Id { get; set; }
    public int DocumentId { get; set; }
    public string DocumentName { get; set; }
    public string Message { get; set; } = null!;
    public string RequesterId { get; set; }
    public string RequesterName { get; set; }
    public bool RequestRead { get; set; }
    public bool RequestWrite { get; set; }
    public bool RequestDelete { get; set; }
    public string Status { get; set; }
    public System.DateTime CreatedAt { get; set; }
    public System.DateTime? DecisionAt { get; set; }
    public string? DecidedById { get; set; }
    public string? DecidedByName { get; set; }
}

public class AccessRequestCreateDto
{
    public int DocumentId { get; set; }
    public bool RequestRead { get; set; }
    public bool RequestWrite { get; set; }
    public bool RequestDelete { get; set; }
     public string Message { get; set; } = null!;
}


public class AccessRequestDecisionDto
{
    public bool Approve { get; set; }
}