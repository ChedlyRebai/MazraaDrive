using System;

namespace Core.DTO;

public class HomeDto
{

    public int TotalUsers { get; set; }
    public int TotalDocuments { get; set; }
    public int TotalFolders { get; set; }
    
    public DateTime LastUpdated { get; set; }

    public List<HomeFolderDto> Folders { get; set; } = new List<HomeFolderDto>();
    public List<HomeDocumentDTO> Documents { get; set; } = new List<HomeDocumentDTO>();
}


public class HomeDocumentDTO
{
    public int Id { get; set; }
    public long FileSize { get; set; }
    public string Name { get; set; } = string.Empty;
    public string FileType { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}



public class HomeFolderDto
{
    public int Id { get; set; }
    public int DepartmentId { get; set; }
    public string Name { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; }

    public int SubFoldersCount { get; set; }
    public int DocumentsCount { get; set; }
}

public class HomeFilterDto : PaginationParams
    {
        public string? UserName { get; set; }
        
        public bool? IsActive { get; set; }
      
        public bool? PhoneNumberConfirmed { get; set; }
     
        public int? RoleId { get; set; }
        public string? RoleName { get; set; }
        public int? DepartmentId { get; set; }
        public string? DepartmentName { get; set; }
        public DateTime? CreatedFrom { get; set; }
        public DateTime? CreatedTo { get; set; }
        public DateTime? UpdatedFrom { get; set; }
        public DateTime? UpdatedTo { get; set; }
        
        
    }

    public class HomePagedResult : PagedResult<HomeDto>
    {
        public int TotalUsers { get; set; }
        public int ActiveUsers { get; set; }
        public int InactiveUsers { get; set; }
        public int ConfirmedEmails { get; set; }
        public int UnconfirmedEmails { get; set; }
        public int LockedOutUsers { get; set; }
        public int TotalDocuments { get; set; }
        public int TotalFolders { get; set; }
    }

