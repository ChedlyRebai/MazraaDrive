using System;
using System.ComponentModel.DataAnnotations;

namespace Core.Entities;

public class AccessRight:BaseEntity<int>
{
[Required]
        public Guid UserId { get; set; }
        
        public bool CanCreate { get; set; } = false;
        
        public bool CanRead { get; set; } = true;
        
        public bool CanUpdate { get; set; } = false;
        
        public bool CanDelete { get; set; } = false;
        
        // Navigation properties
        public AppUser User { get; set; }
}
