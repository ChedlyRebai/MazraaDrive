using System;

namespace Core.Entities;
using System.ComponentModel.DataAnnotations;

public class Folder : BaseEntity<int>
{
   
    public string Name { get; set; }

    public int? ParentFolderId { get; set; }

  
    public int DepartmentId { get; set; }

  
    public string CreatedById { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    // Navigation properties
    public Folder ParentFolder { get; set; }
    public ICollection<Folder> SubFolders { get; set; }
    public Department Department { get; set; }
    public AppUser CreatedBy { get; set; }
    public ICollection<Document> Documents { get; set; }
}
