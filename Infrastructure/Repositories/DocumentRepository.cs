using Core.DTO;
using Core.DTOs;
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


        public async Task<DocumentSearchDTO[]> getDocumentByName(string name)
        {
            try
            {
                var documents = await _context.Documents.Where(d => d.Name.Contains(name))
                .Select(d => new DocumentSearchDTO
                {
                    Id = d.Id,
                    Name = d.Name,
                    FolderId = d.FolderId.ToString(),
                    UploadedByName = d.UploadedBy.UserName,
                    UploadedById = d.UploadedById,
                    
                }).ToArrayAsync();

                return documents;
            }
            catch (System.Exception)
            {

                throw;
            }
        }


        public async Task<PagedResult<Document>> GetPagedAsync(DocumentFilterDto filter)
        {
            var query = _context.Documents
                .Include(d => d.Folder)
                .Include(d => d.UploadedBy)
                .AsQueryable();

            // Apply filters
            query = ApplyFilters(query, filter);

            // Get total count before pagination
            var totalRecords = await query.CountAsync();

            // Apply sorting
            query = ApplySorting(query, filter.SortBy, filter.SortDirection);

            // Apply pagination
            var documents = await query
                .Skip((filter.PageNumber - 1) * filter.PageSize)
                .Take(filter.PageSize)
                .ToListAsync();

            return documents.ToPagedResult(
                filter.PageNumber,
                filter.PageSize,
                totalRecords,
                filter.Search,
                filter.SortBy,
                filter.SortDirection
            );
        }

        public async Task<PagedResult<Document>> GetByFolderPagedAsync(int folderId, PaginationParams pagination)
        {
            var query = _context.Documents
                .Include(d => d.Folder)
                .Include(d => d.UploadedBy)
                .Where(d => d.FolderId == folderId);

            // Apply search if provided
            if (!string.IsNullOrEmpty(pagination.Search))
            {
                query = query.Where(d =>
                    d.Name.Contains(pagination.Search) 
                   
                );
            }

            var totalRecords = await query.CountAsync();

            query = ApplySorting(query, pagination.SortBy, pagination.SortDirection);

            var documents = await query
                .Skip((pagination.PageNumber - 1) * pagination.PageSize)
                .Take(pagination.PageSize)
                .ToListAsync();

            return documents.ToPagedResult(
                pagination.PageNumber,
                pagination.PageSize,
                totalRecords,
                pagination.Search,
                pagination.SortBy,
                pagination.SortDirection
            );
        }

        public async Task<PagedResult<Document>> GetByUserPagedAsync(string userId, PaginationParams pagination)
        {
            var query = _context.Documents
                .Include(d => d.Folder)
                .Include(d => d.UploadedBy)
                .Where(d => d.UploadedById.ToString() == userId);

            // Apply search if provided
            if (!string.IsNullOrEmpty(pagination.Search))
            {
                query = query.Where(d =>
                    d.Name.Contains(pagination.Search) ||
                  
                    d.Folder.Name.Contains(pagination.Search)
                );
            }

            var totalRecords = await query.CountAsync();

            query = ApplySorting(query, pagination.SortBy, pagination.SortDirection);

            var documents = await query
                .Skip((pagination.PageNumber - 1) * pagination.PageSize)
                .Take(pagination.PageSize)
                .ToListAsync();

            return documents.ToPagedResult(
                pagination.PageNumber,
                pagination.PageSize,
                totalRecords,
                pagination.Search,
                pagination.SortBy,
                pagination.SortDirection
            );
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
                .Where(d => d.FolderId == folderId)
                .OrderByDescending(d => d.CreatedAt)
                .ToListAsync();
        }
        public async Task<Document?> GetByIdWithDetailsAsync(int id)
        {
            return await _context.Documents
                .Include(d => d.Folder)
                .Include(d => d.UploadedBy)
                .FirstOrDefaultAsync(d => d.Id == id);
        }

        public async Task<IReadOnlyList<Document>> GetByUserAsync(string userId)
        {
            return await _context.Documents
                .Include(d => d.Folder)
                .Include(d => d.DocumentRequests)
                .Where(d => d.UploadedById == userId)
                .OrderByDescending(d => d.CreatedAt)
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Document>> GetValidatedDocumentsAsync()
        {
            return await _context.Documents
                .Include(d => d.Folder)
                .Include(d => d.UploadedBy)
                .Where(d => d.IsValidated == true)
                .OrderByDescending(d => d.CreatedAt)
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Document>> GetPendingValidationAsync()
        {
            return await _context.Documents
                .Include(d => d.Folder)
                .Include(d => d.UploadedBy)
                .Where(d => !d.IsValidated == true)
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
                .Where(d => d.FileType.ToLower() == fileType.ToLower())
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
                .CountAsync(d => d.FolderId == folderId);
        }
        


           private IQueryable<Document> ApplyFilters(IQueryable<Document> query, DocumentFilterDto filter)
        {
            if (!string.IsNullOrEmpty(filter.Name))
                query = query.Where(d => d.Name.Contains(filter.Name));

            if (!string.IsNullOrEmpty(filter.FileType))
                query = query.Where(d => d.FileType == filter.FileType);

            if (filter.FolderId.HasValue)
                query = query.Where(d => d.FolderId == filter.FolderId);

            if (!string.IsNullOrEmpty(filter.FolderName))
                query = query.Where(d => d.Folder.Name.Contains(filter.FolderName));

            if (!string.IsNullOrEmpty(filter.UploadedById))
                query = query.Where(d => d.UploadedById.ToString() == filter.UploadedById);

            if (!string.IsNullOrEmpty(filter.UploadedByName))
                query = query.Where(d => 
                    d.UploadedBy.UserName.Contains(filter.UploadedByName) ||
                    d.UploadedBy.UserName!.Contains(filter.UploadedByName)
                );

            if (filter.IsValidated.HasValue)
                query = query.Where(d => d.IsValidated == filter.IsValidated);

           
            // if (filter.CreatedFrom.HasValue)
            //     query = query.Where(d => d.CreatedAt >= filter.CreatedFrom);

            // if (filter.CreatedTo.HasValue)
            //     query = query.Where(d => d.CreatedAt <= filter.CreatedTo);

            // if (filter.UpdatedFrom.HasValue)
            //     query = query.Where(d => d.UpdatedAt >= filter.UpdatedFrom);

            // if (filter.UpdatedTo.HasValue)
            //     query = query.Where(d => d.UpdatedAt <= filter.UpdatedTo);

            // if (filter.MinFileSize.HasValue)
            //     query = query.Where(d => d.FileSize >= filter.MinFileSize);

            // if (filter.MaxFileSize.HasValue)
            //     query = query.Where(d => d.FileSize <= filter.MaxFileSize);

            // if (filter.MinVersion.HasValue)
            //     query = query.Where(d => d.Version >= filter.MinVersion);

            // if (filter.MaxVersion.HasValue)
            //     query = query.Where(d => d.Version <= filter.MaxVersion);

            if (filter.FileTypes?.Any() == true)
                query = query.Where(d => filter.FileTypes.Contains(d.FileType));

            if (!string.IsNullOrEmpty(filter.Search))
            {
                query = query.Where(d => 
                    d.Name.Contains(filter.Search) ||
                   
                   
                    d.Folder.Name.Contains(filter.Search)
                );
            }

            return query;
        }

        private IQueryable<Document> ApplySorting(IQueryable<Document> query, string? sortBy, string? sortDirection)
        {
            if (string.IsNullOrEmpty(sortBy))
                return query.OrderByDescending(d => d.CreatedAt);

            var isDescending = sortDirection?.ToLower() == "desc";

            return sortBy.ToLower() switch
            {
                "name" => isDescending ? query.OrderByDescending(d => d.Name)
                                       : query.OrderBy(d => d.Name),
                "filesize" => isDescending ? query.OrderByDescending(d => d.FileSize)
                                           : query.OrderBy(d => d.FileSize),
                "filetype" => isDescending ? query.OrderByDescending(d => d.FileType)
                                           : query.OrderBy(d => d.FileType),
                "foldername" => isDescending ? query.OrderByDescending(d => d.Folder.Name)
                                             : query.OrderBy(d => d.Folder.Name),

                "version" => isDescending ? query.OrderByDescending(d => d.Version)
                                          : query.OrderBy(d => d.Version),
                "createdat" => isDescending ? query.OrderByDescending(d => d.CreatedAt)
                                            : query.OrderBy(d => d.CreatedAt),
                "updatedat" => isDescending ? query.OrderByDescending(d => d.UpdatedAt)
                                            : query.OrderBy(d => d.UpdatedAt),
                "isvalidated" => isDescending ? query.OrderByDescending(d => d.IsValidated)
                                              : query.OrderBy(d => d.IsValidated),
             
                _ => query.OrderByDescending(d => d.CreatedAt)
            };
        }
    }
}