using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Core.Services;
using Core.Entities;
using Microsoft.EntityFrameworkCore;
using Core.Interfaces;
using Infrastructure.Data;
using System.Text.Json;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RagController : ControllerBase
    {
        private readonly IRagService _ragService;
        private readonly AppDbContext _context;

        public RagController(IRagService ragService, AppDbContext context)
        {
            _ragService = ragService;
            _context = context;
        }

        [HttpPost("index/{documentId}")]
        public async Task<IActionResult> IndexDocument(int documentId)
        {
            var document = await _context.Documents
                .Include(d => d.Department)
                .FirstOrDefaultAsync(d => d.Id == documentId);
            
            if (document == null)
                return NotFound("Document not found");
            
            // Read document content (you'll need to implement this based on your storage)
            var content = await ReadDocumentContentAsync(document.StoragePath);
            
            var metadata = JsonSerializer.Serialize(new
            {
                document.Name,
                document.FileType,
               
                document.CreatedAt
            });
            
            await _ragService.IndexDocumentAsync(documentId, content, metadata);
            
            return Ok(new { Message = "Document indexed successfully" });
        }

        [HttpPost("query")]
        public async Task<IActionResult> Query([FromBody] QueryRequest request)
        {
            if (string.IsNullOrEmpty(request.Question))
                return BadRequest("Question is required");
            
            var result = await _ragService.QueryAsync(request.Question);
            
            return Ok(new { Answer = result });
        }

        [HttpPost("query-with-context")]
        public async Task<IActionResult> QueryWithContext([FromBody] QueryWithContextRequest request)
        {
            var result = await _ragService.QueryAsync(request.Question, request.Context);
            return Ok(new { Answer = result });
        }

        [HttpGet("search")]
        public async Task<IActionResult> Search([FromQuery] string query, [FromQuery] int topK = 5)
        {
            var chunks = await _ragService.RetrieveRelevantChunksAsync(query, topK);
            return Ok(chunks);
        }

        [HttpDelete("index/{documentId}")]
        public async Task<IActionResult> RemoveFromIndex(int documentId)
        {
            var success = await _ragService.RemoveDocumentFromIndexAsync(documentId);
            return success ? Ok() : BadRequest("Failed to remove document from index");
        }

        private async Task<string> ReadDocumentContentAsync(string storagePath)
        {
            // Implement your document reading logic here
            // This could be reading from local storage, cloud storage, etc.
            // For example:
            // return await System.IO.File.ReadAllTextAsync(storagePath);
            
            // Placeholder implementation
            return "Sample document content. This would be the actual content of your document.";
        }
    }

    public class QueryRequest
    {
        public string Question { get; set; } = string.Empty;
    }

    public class QueryWithContextRequest
    {
        public string Question { get; set; } = string.Empty;
        public string Context { get; set; } = string.Empty;
    }
}