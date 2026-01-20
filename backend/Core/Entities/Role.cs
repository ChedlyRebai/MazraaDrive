using System;
using Microsoft.AspNetCore.Identity;

namespace Core.Entities;

public class Role : IdentityRole<string>
{
   

    // public string Name { get; set; }
    public string Description { get; set; }
    //public bool IsActive { get; set; } = true;
   // public virtual ICollection<AppUser> Users { get; set; } = new List<AppUser>();
}
