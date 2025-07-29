using System;

namespace Core.DTO;

public class FolderDTO
{
     public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public int? ParentFolderId { get; set; }
        public string? ParentFolderName { get; set; }
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; } = string.Empty;
        public string CreatedById { get; set; } = string.Empty;
        public string CreatedByName { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public bool IsActive { get; set; }
        public int SubFolderCount { get; set; }
        public int DocumentCount { get; set; }
}

public class CreateFolderDTO
{
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public int? ParentFolderId { get; set; }
    public int DepartmentId { get; set; }
    public bool IsActive { get; set; } = true;
}

public class UpdateFolderDTO
{
    public string? Name { get; set; }
    public string? Description { get; set; }
    public int? ParentFolderId { get; set; }
    public bool? IsActive { get; set; }
}

public class FolderWithDocumentsDTO : FolderDTO
{
    public int DocumentCount { get; set; }
    public int SubFolderCount { get; set; }
}

public class FolderTreeDto
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public int? ParentFolderId { get; set; }
    public int DepartmentId { get; set; }
    public string DepartmentName { get; set; } = string.Empty;
    public bool IsActive { get; set; }
    public int SubFolderCount { get; set; }
    public int DocumentCount { get; set; }
    public DateTime CreatedAt { get; set; }
    public IEnumerable<FolderTreeDto> SubFolders { get; set; } = new List<FolderTreeDto>();
}

public class FolderFilterDto : PaginationParams
{
    public string? Name { get; set; }
    public int? ParentFolderId { get; set; }
    public string? ParentFolderName { get; set; }
    public int? DepartmentId { get; set; }
    public string? DepartmentName { get; set; }
    public string? CreatedById { get; set; }
    public string? CreatedByName { get; set; }
    public bool? IsActive { get; set; }
    public DateTime? CreatedFrom { get; set; }
    public DateTime? CreatedTo { get; set; }
    public DateTime? UpdatedFrom { get; set; }
    public DateTime? UpdatedTo { get; set; }
    public int? MinSubFolderCount { get; set; }
    public int? MaxSubFolderCount { get; set; }
    public int? MinDocumentCount { get; set; }
    public int? MaxDocumentCount { get; set; }
    public bool? HasSubFolders { get; set; }
    public bool? HasDocuments { get; set; }
    public bool? IsRootFolder { get; set; } // Folders with no parent
}

public class FolderPagedResult : PagedResult<FolderDTO>
{
    public int TotalFolders { get; set; }
    public int TotalDepartments { get; set; }
    public int TotalDocuments { get; set; }
}


public class FolderWithSubFoldersDTO : FolderDTO
{
    public int SubFolderCount { get; set; }
    public int DocumentCount { get; set; }
}