using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities;

public class AccessRight : BaseEntity<int>
{
    [Required]
    public string UserId { get; set; }  // CORRECT: AppUser.Id is string
    
    public bool CanCreate { get; set; } = false;
    public bool CanRead { get; set; } = true;
    public bool CanUpdate { get; set; } = false;
    public bool CanDelete { get; set; } = false;

    [ForeignKey(nameof(UserId))]
    public virtual AppUser User { get; set; }
}