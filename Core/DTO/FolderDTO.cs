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
public class FolderWithSubFoldersDTO : FolderDTO
{
    public int SubFolderCount { get; set; }
    public int DocumentCount { get; set; }
}