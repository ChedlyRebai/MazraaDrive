using System;
using Core.DTOs;
using Core.Entities;

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
         public Folder ParentFolder { get; set; }
        public ICollection<SubFolderDTO> SubFolders { get; set; }
         
        public ICollection<DocumentDto> Documents { get; set; }
        public int DocumentCount { get; set; }
}
public class SubFolderDTO


{

    
    public string CreatedById { get; set; }
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    
    public UserDto CreatedBy { get; set; } = new UserDto();
    public int ParentFolderId { get; set; }
    public DateTime CreatedAt { get; set; }
    public bool IsActive { get; set; }
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
    public string? ParentFolderName { get; set; }
    public int? DepartmentId { get; set; }
    public string? DepartmentName { get; set; }
    public string? CreatedById { get; set; }
    public string? CreatedByName { get; set; }
    public bool? IsActive { get; set; }
    public int? MinDocumentCount { get; set; }
    public int? MaxDocumentCount { get; set; }
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