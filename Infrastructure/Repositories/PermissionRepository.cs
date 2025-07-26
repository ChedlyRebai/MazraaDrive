using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class PermissionsRepository : GenericRepository<AccessRight>, IPermissionsRepository
    {
        private readonly AppDbContext _context;

        public PermissionsRepository(AppDbContext context) : base(context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task<AccessRight> AddAsync(AccessRight accessRight)
        {
            if (accessRight == null)
                throw new ArgumentNullException(nameof(accessRight));

            // Validate that either DocumentId or FolderId is set, but not both
            if ((accessRight.DocumentId.HasValue && accessRight.FolderId.HasValue) ||
                (!accessRight.DocumentId.HasValue && !accessRight.FolderId.HasValue))
            {
                throw new ArgumentException("Either DocumentId or FolderId must be set, but not both");
            }

            // accessRight.CreatedAt = DateTime.UtcNow;
            // accessRight.UpdatedAt = DateTime.UtcNow;

            var result = await _context.AccessRights.AddAsync(accessRight);
            return result.Entity;
        }

        public async Task DeleteAsync(int id)
        {
            var accessRight = await _context.AccessRights.FindAsync(id);
            if (accessRight == null)
                throw new ArgumentException($"AccessRight with id {id} not found");

            _context.AccessRights.Remove(accessRight);
        }

        public async Task<IReadOnlyList<AccessRight>> GetAllAsync()
        {
            return await _context.AccessRights
                .Include(ar => ar.User)
                .Include(ar => ar.Document)
                .Include(ar => ar.Folder)
                //.Where(ar => ar.IsActive)
                .OrderBy(ar => ar.User.UserName)
                .ToListAsync();
        }

        public async Task<AccessRight?> GetByIdAsync(int id)
        {
            return await _context.AccessRights
                .Include(ar => ar.User)
                .Include(ar => ar.Document)
                .Include(ar => ar.Folder)
                .FirstOrDefaultAsync(ar => ar.Id == id);
        }

        public async Task UpdateAsync(AccessRight accessRight)
        {
            if (accessRight == null)
                throw new ArgumentNullException(nameof(accessRight));

            // accessRight.UpdatedAt = DateTime.UtcNow;
            _context.AccessRights.Update(accessRight);
        }

        public async Task<bool> ExistsAsync(int id)
        {
            return await _context.AccessRights.AnyAsync(ar => ar.Id == id);
        }

        public async Task<IReadOnlyList<AccessRight>> GetByUserAsync(string userId)
        {
            return await _context.AccessRights
                .Include(ar => ar.Document)
                .Include(ar => ar.Folder)
                //.Where(ar => ar.UserId == userId )
                .OrderBy(ar => ar.Type)
                .ToListAsync();
        }

        public async Task<IReadOnlyList<AccessRight>> GetByDocumentAsync(int documentId)
        {
            return await _context.AccessRights
                .Include(ar => ar.User)
                .Where(ar => ar.DocumentId == documentId )
                .OrderBy(ar => ar.User.UserName)
                .ToListAsync();
        }

        public async Task<IReadOnlyList<AccessRight>> GetByFolderAsync(int folderId)
        {
            return await _context.AccessRights
                .Include(ar => ar.User)
                .Where(ar => ar.FolderId == folderId )
                .OrderBy(ar => ar.User.UserName)
                .ToListAsync();
        }

        public async Task<AccessRight?> GetUserDocumentAccessAsync(string userId, int documentId)
        {
            return await _context.AccessRights
                .FirstOrDefaultAsync(ar => ar.UserId == userId && 
                                          ar.DocumentId == documentId 
                                          );
        }

        public async Task<AccessRight?> GetUserFolderAccessAsync(string userId, int folderId)
        {
            return await _context.AccessRights
                .FirstOrDefaultAsync(ar => ar.UserId == userId && 
                                          ar.FolderId == folderId 
                                          );
        }

        public async Task<bool> HasPermissionAsync(string userId, int? documentId, int? folderId, string permission)
        {
            var query = _context.AccessRights
                .Where(ar => ar.UserId == userId );

            if (documentId.HasValue)
                query = query.Where(ar => ar.DocumentId == documentId);
            
            if (folderId.HasValue)
                query = query.Where(ar => ar.FolderId == folderId);

            var accessRight = await query.FirstOrDefaultAsync();
            if (accessRight == null) return false;

            return permission.ToLower() switch
            {
                "create" => accessRight.CanCreate,
                "read" => accessRight.CanRead,
                "update" => accessRight.CanUpdate,
                "delete" => accessRight.CanDelete,
                _ => false
            };
        }

        public async Task<bool> CanUserCreateAsync(string userId, int? folderId = null)
        {
            return await HasPermissionAsync(userId, null, folderId, "create");
        }

        public async Task<bool> CanUserReadAsync(string userId, int? documentId = null, int? folderId = null)
        {
            return await HasPermissionAsync(userId, documentId, folderId, "read");
        }

        public async Task<bool> CanUserUpdateAsync(string userId, int? documentId = null, int? folderId = null)
        {
            return await HasPermissionAsync(userId, documentId, folderId, "update");
        }

        public async Task<bool> CanUserDeleteAsync(string userId, int? documentId = null, int? folderId = null)
        {
            return await HasPermissionAsync(userId, documentId, folderId, "delete");
        }

        public async Task BulkCreateAsync(List<AccessRight> accessRights)
        {
            if (accessRights == null || !accessRights.Any())
                return;

            foreach (var accessRight in accessRights)
            {
                // accessRight.CreatedAt = DateTime.UtcNow;
                // accessRight.UpdatedAt = DateTime.UtcNow;
            }

            await _context.AccessRights.AddRangeAsync(accessRights);
        }

        public async Task RemoveUserAccessAsync(string userId, int? documentId = null, int? folderId = null)
        {
            var query = _context.AccessRights
                .Where(ar => ar.UserId == userId);

            if (documentId.HasValue)
                query = query.Where(ar => ar.DocumentId == documentId);
            
            if (folderId.HasValue)
                query = query.Where(ar => ar.FolderId == folderId);

            var accessRights = await query.ToListAsync();
            _context.AccessRights.RemoveRange(accessRights);
        }

        public async Task<IReadOnlyList<AccessRight>> GetInheritedFolderPermissionsAsync(string userId, int folderId)
        {
            // Get folder hierarchy and check permissions at each level
            var folder = await _context.Folders
                .Include(f => f.ParentFolder)
                .FirstOrDefaultAsync(f => f.Id == folderId);

            var permissions = new List<AccessRight>();
            var currentFolder = folder;

            while (currentFolder != null)
            {
                var folderPermission = await GetUserFolderAccessAsync(userId, currentFolder.Id);
                if (folderPermission != null)
                {
                    permissions.Add(folderPermission);
                }

                currentFolder = currentFolder.ParentFolder;
            }

            return permissions;
        }
    }
}