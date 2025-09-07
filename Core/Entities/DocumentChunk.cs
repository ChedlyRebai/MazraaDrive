namespace Core.Entities
{
    public class DocumentChunk
    {
        public int Id { get; set; }
        public int DocumentId { get; set; }
        public string Content { get; set; } = string.Empty;
        public string Embedding { get; set; } = string.Empty; // JSON array or base64
        public int ChunkIndex { get; set; }
        public float[]? EmbeddingVector { get; set; } // For in-memory operations
        public float SimilarityScore { get; set; }
        
        // Navigation property
        public virtual Document Document { get; set; } = null!;
    }
}