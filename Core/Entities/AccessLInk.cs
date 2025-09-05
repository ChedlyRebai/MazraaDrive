using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Entities
{
    public class DocumentAccessLink:BaseEntity<int>
    {
        public string Token { get; set; } = string.Empty;
        public int? DocumentId { get; set; }
        public string UserId { get; set; } = string.Empty;
        public DateTime ExpiresAt { get; set; }
        public bool CanRead { get; set; }
        public bool CanUpdate { get; set; }
        public bool CanDelete { get; set; }

        [ForeignKey(nameof(DocumentId))]
        public Document Document { get; set; }

        [ForeignKey(nameof(UserId))]
        public AppUser User { get; set; }
    }
}