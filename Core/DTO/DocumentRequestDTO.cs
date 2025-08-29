namespace Core.DTO;

public class DocumentRequestDTO{
    public int Id { get; set; }
    public string RequesterId { get; set; }
    public string RequesterName { get; set; } = string.Empty;
    public int DepartmentId { get; set; }
    public string DepartmentName { get; set; } = string.Empty;
    public string DocumentType { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string Priority { get; set; } = string.Empty;
    public string Status { get; set; } = string.Empty;
    public int? ResponseDocumentId { get; set; }
    public string? ResponseDocumentName { get; set; }
    public DateTime RequestedAt { get; set; }
    public DateTime? RespondedAt { get; set; }
    public string? ProcessedById { get; set; }
    public string? ProcessedByName { get; set; }
    public string? ResponseMessage { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
    public bool IsActive { get; set; }
}


   public class DocumentRequestStatsDto
    {
        public int TotalDocumentsRequest { get; set; }
        public int TotalUsers { get; set; }
        public int TotalDepartments { get; set; }
        public int TotalPendingRequests { get; set; }
        public int TotalProcessedRequests { get; set; }
        public int TotalRejectedRequests { get; set; }
    }
public class CreateDocumentRequestDTO
{
    public string RequesterId { get; set; }
    public string? ProcessedById { get; set; }
    public string? ResponseMessage { get; set; }
    public int DepartmentId { get; set; }
    public string DocumentType { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string Priority { get; set; } = "Normal";
}

public class UpdateDocumentRequestDTO
{
    public string? DocumentType { get; set; }
    public string? Description { get; set; }
    public string? Priority { get; set; }

    public string? ResponseMessage { get; set; }
    public string? Status { get; set; }
    public int? ResponseDocumentId { get; set; }
    public string? ProcessedById { get; set; }
}

public class DocumentRequestFilterDTO : PaginationParams
{
    public string? RequesterId { get; set; }
    public int? DepartmentId { get; set; }
    public string? DocumentType { get; set; }
    public string? Priority { get; set; }
    public string? Status { get; set; }
    public DateTime? RequestedFrom { get; set; }
    public DateTime? RequestedTo { get; set; }
    public string? ProcessedById { get; set; }
    public string? Search { get; set; }
}

public class DocumentRequestPagedResult : PagedResult<DocumentRequestDTO>
{
    public int TotalPendingRequests { get; set; }
    public int TotalProcessedRequests { get; set; }
    public int TotalRejectedRequests { get; set; }
}