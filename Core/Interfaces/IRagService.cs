using System.Collections.Generic;
using System.Threading.Tasks;
using Core.Entities;

namespace Core.Interfaces
{
    public interface IRagService
    {
        Task<string> QueryAsync(string question, string? context = null);
        Task IndexDocumentAsync(int documentId, string content, string metadata);
        Task<List<DocumentChunk>> RetrieveRelevantChunksAsync(string query, int topK = 5);
        Task<bool> RemoveDocumentFromIndexAsync(int documentId);
    }
}