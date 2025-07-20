using System;

namespace Core.Entities;

public class Role : BaseEntity<int>
{
    public string Name { get; set; }
    public string Description { get; set; }
    public bool IsActive { get; set; } = true;
    public virtual ICollection<AppUser> Users { get; set; } = new List<AppUser>();
}
