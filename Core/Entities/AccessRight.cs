using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities;

public class AccessRight : BaseEntity<int>
{
    [Required]
    public string UserId { get; set; }


    public int? DocumentId { get; set; }  // FIXED: Changed from Guid to int
    [ForeignKey(nameof(DocumentId))]
    public virtual Document Document { get; set; }

    public AccessRightType Type => DocumentId.HasValue ? AccessRightType.Document : AccessRightType.Folder;

    public int? FolderId { get; set; }
    [ForeignKey(nameof(FolderId))]
    public virtual Folder Folder { get; set; }
    // CORRECT: AppUser.Id is string

    public bool CanCreate
    { get; set; } = false;
    public bool CanRead { get; set; } = true;
    public bool CanUpdate { get; set; } = false;
    public bool CanDelete { get; set; } = false;

    [ForeignKey(nameof(UserId))]
    public virtual AppUser User { get; set; }
}


public enum AccessRightType
{
    Document,
    Folder
}