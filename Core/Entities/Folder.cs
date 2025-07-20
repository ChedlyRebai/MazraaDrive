using System;

namespace Core.Entities;
using System.ComponentModel.DataAnnotations;

public class Folder : BaseEntity<int>
{
   
    public string Name { get; set; }

    public Guid? ParentFolderId { get; set; }

  
    public Guid DepartmentId { get; set; }

  
    public Guid CreatedById { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    // Navigation properties
    public Folder ParentFolder { get; set; }
    public ICollection<Folder> SubFolders { get; set; }
    public Department Department { get; set; }
    public AppUser CreatedBy { get; set; }
    public ICollection<Document> Documents { get; set; }
}
