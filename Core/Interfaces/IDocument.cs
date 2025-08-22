using System;
using Core.DTO;
using Core.DTOs;
using Core.Entities;


namespace Core.Interfaces;

public interface IDocument : IGenericRepository<Document>
{
    Task<Document?> GetByIdWithDetailsAsync(int id);
        
    Task<PagedResult<Document>> GetPagedAsync(DocumentFilterDto filter);
        Task<PagedResult<Document>> GetByFolderPagedAsync(int folderId, PaginationParams pagination);
        Task<PagedResult<Document>> GetByUserPagedAsync(string userId, PaginationParams pagination);
    Task<Document> AddAsync(Document document);

    Task<DocumentSearchDTO[]> getDocumentByName(string name);
    Task DeleteAsync(int id);
    Task<IReadOnlyList<Document>> GetAllAsync();
    Task<Document?> GetByIdAsync(int id);
    Task<Document?> GetByNameAsync(string name, int folderId);
    Task UpdateAsync(Document document);
    Task<bool> ExistsAsync(int id);
    Task<IReadOnlyList<Document>> GetByFolderAsync(int folderId);
    Task<IReadOnlyList<Document>> GetByUserAsync(string userId);
    Task<IReadOnlyList<Document>> GetValidatedDocumentsAsync();
    Task<IReadOnlyList<Document>> GetPendingValidationAsync();
    Task<IReadOnlyList<Document>> GetByFileTypeAsync(string fileType);
    Task<bool> ValidateDocumentAsync(int documentId, bool isValid);
    Task<long> GetTotalFileSizeAsync();
    Task<int> GetDocumentCountByFolderAsync(int folderId);
}
