using System;

namespace Core.DTO;

public class DepartmentDto
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
    public int UserCount { get; set; }
    public int FolderCount { get; set; }
    public int DocumentRequestCount { get; set; }
}
public class DepartmentCreateDTO
{
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
}

public class DepartmentUpdateDTO
{   
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
}

public class DepartmentDeleteDTO
{
    public int Id { get; set; }
}

public class DepartmentFilterDto : PaginationParams
{
    public string? Name { get; set; }
    public DateTime? CreatedFrom { get; set; }
    public DateTime? CreatedTo { get; set; }
    public int? MinUserCount { get; set; }
    public int? MaxUserCount { get; set; }
}

public class DepartmentPagedResult : PagedResult<DepartmentDto>
{
    public int TotalDepartments { get; set; }
    public int TotalUsers { get; set; }
}
public class DepartmentUserCountDTO
{
    public int DepartmentId { get; set; }
    public int UserCount { get; set; }
}


public class DepartmentSearchDTO
{
    public int Id { get; set; }
    public string? Name { get; set; }
    public string? Description { get; set; }
}