using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities;

public class BaseEntity<T>
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)] // This ensures auto-increment
    public T Id { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime? UpdatedAt { get; set; }
    // public bool Equals(BaseEntity<T>? other)
    // {
    //     if (other is null) return false;
    //     if (ReferenceEquals(this, other)) return true;
    //     return Id.Equals(other.Id);
    // }

    // public override int GetHashCode() => Id.GetHashCode();

    // public override bool Equals(object? obj) => Equals(obj as BaseEntity<T>);

}
