using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class DocumentRepository : GenericRepository<Document>, IDocument
    {
        private readonly AppDbContext _context;

        public DocumentRepository(AppDbContext context) : base(context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task<Document> AddAsync(Document document)
        {
            if (document == null)
                throw new ArgumentNullException(nameof(document));

            document.CreatedAt = DateTime.UtcNow;
            document.UpdatedAt = DateTime.UtcNow;

            var result = await _context.Documents.AddAsync(document);
            return result.Entity;
        }

        public async Task DeleteAsync(int id)
        {
            var document = await _context.Documents.FindAsync(id);
            if (document == null)
                throw new ArgumentException($"Document with id {id} not found");

            _context.Documents.Remove(document);
        }

        public async Task<IReadOnlyList<Document>> GetAllAsync()
        {
            return await _context.Documents
                .Include(d => d.Folder)
                .Include(d => d.UploadedBy)
                .Include(d => d.DocumentRequests)
                
                .OrderByDescending(d => d.CreatedAt)
                .ToListAsync();
        }

        public async Task<Document?> GetByIdAsync(int id)
        {
            return await _context.Documents
                .Include(d => d.Folder)
                .Include(d => d.UploadedBy)
                .Include(d => d.DocumentRequests)
                .FirstOrDefaultAsync(d => d.Id == id);
        }

        public async Task<Document?> GetByNameAsync(string name, int folderId)
        {
            if (string.IsNullOrEmpty(name))
                return null;

            return await _context.Documents
                .FirstOrDefaultAsync(d => d.Name.ToLower() == name.ToLower() && 
                                        d.FolderId == folderId);
        }

        public async Task UpdateAsync(Document document)
        {
            if (document == null)
                throw new ArgumentNullException(nameof(document));

            document.UpdatedAt = DateTime.UtcNow;
            _context.Documents.Update(document);
        }

        public async Task<bool> ExistsAsync(int id)
        {
            return await _context.Documents.AnyAsync(d => d.Id == id);
        }

        public async Task<IReadOnlyList<Document>> GetByFolderAsync(int folderId)
        {
            return await _context.Documents
                .Include(d => d.UploadedBy)
                .Include(d => d.DocumentRequests)
                .Where(d => d.FolderId == folderId )
                .OrderByDescending(d => d.CreatedAt)
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Document>> GetByUserAsync(string userId)
        {
            return await _context.Documents
                .Include(d => d.Folder)
                .Include(d => d.DocumentRequests)
                .Where(d => d.UploadedById == userId )
                .OrderByDescending(d => d.CreatedAt)
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Document>> GetValidatedDocumentsAsync()
        {
            return await _context.Documents
                .Include(d => d.Folder)
                .Include(d => d.UploadedBy)
                .Where(d => d.IsValidated )
                .OrderByDescending(d => d.CreatedAt)
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Document>> GetPendingValidationAsync()
        {
            return await _context.Documents
                .Include(d => d.Folder)
                .Include(d => d.UploadedBy)
                .Where(d => !d.IsValidated )
                .OrderByDescending(d => d.CreatedAt)
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Document>> GetByFileTypeAsync(string fileType)
        {
            if (string.IsNullOrEmpty(fileType))
                return new List<Document>();

            return await _context.Documents
                .Include(d => d.Folder)
                .Include(d => d.UploadedBy)
                .Where(d => d.FileType.ToLower() == fileType.ToLower() )
                .OrderByDescending(d => d.CreatedAt)
                .ToListAsync();
        }

        public async Task<bool> ValidateDocumentAsync(int documentId, bool isValid)
        {
            var document = await _context.Documents.FindAsync(documentId);
            if (document == null)
                return false;

            document.IsValidated = isValid;
            document.UpdatedAt = DateTime.UtcNow;
            
            return true;
        }

        public async Task<long> GetTotalFileSizeAsync()
        {
            return await _context.Documents
                //.Where(d => d.IsActive)
                .SumAsync(d => d.FileSize);
        }

        public async Task<int> GetDocumentCountByFolderAsync(int folderId)
        {
            return await _context.Documents
                .CountAsync(d => d.FolderId == folderId );
        }
    }
}