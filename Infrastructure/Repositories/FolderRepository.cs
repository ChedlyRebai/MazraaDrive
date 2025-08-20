using Core.Entities;
using Core.Interfaces;
using Core.DTO;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class FolderRepository : GenericRepository<Folder>, IFolderRepository
    {
        private readonly AppDbContext _context;

        public FolderRepository(AppDbContext context) : base(context)
        {
            _context = context;
        }


        public async Task<PagedResult<Folder>> GetHomeFolders(FolderFilterDto filter, int departmentId)
        {
            var query = _context.Folders
                .Include(f => f.ParentFolder)
                .Include(f => f.Department)
                .Include(f => f.CreatedBy)
                .Include(f => f.SubFolders)
                .Where(f => f.DepartmentId == departmentId)
                .Include(f => f.Documents)
                .AsQueryable();

            // Apply filters
            query = ApplyFilters(query, filter);

            // Get total count before pagination
            var totalRecords = await query.CountAsync();

            // Apply sorting
            query = ApplySorting(query, filter.SortBy, filter.SortDirection);

            // Apply pagination
            var folders = await query
                .Skip((filter.PageNumber - 1) * filter.PageSize)
                .Take(filter.PageSize)
                .ToListAsync();

            return folders.ToPagedResult(
                filter.PageNumber,
                filter.PageSize,
                totalRecords,
                filter.Search,
                filter.SortBy,
                filter.SortDirection
            );
        }

        public async Task<PagedResult<Folder>> GetSubFoldersAsync(FolderFilterDto filter, int parentFolderId)
        {
            var query = _context.Folders
                .Include(f => f.ParentFolder)
                .Include(f => f.Department)
                .Include(f => f.CreatedBy)
                .Include(f => f.SubFolders)
                .Where(f => f.ParentFolderId == parentFolderId)
                .AsQueryable();

            // Apply filters
            query = ApplyFilters(query, filter);

            // Get total count before pagination
            var totalRecords = await query.CountAsync();

            // Apply sorting
            query = ApplySorting(query, filter.SortBy, filter.SortDirection);

            // Apply pagination
            var folders = await query
                .Skip((filter.PageNumber - 1) * filter.PageSize)
                .Take(filter.PageSize)
                .ToListAsync();

            return folders.ToPagedResult(
                filter.PageNumber,
                filter.PageSize,
                totalRecords,
                filter.Search,
                filter.SortBy,
                filter.SortDirection
            );
        }

        public async Task<PagedResult<Folder>> GetPagedAsync(FolderFilterDto filter)
        {
            var query = _context.Folders
                .Include(f => f.ParentFolder)
                .Include(f => f.Department)
                .Include(f => f.CreatedBy)
                .Include(f => f.SubFolders)
                .Include(f => f.Documents)
                .AsQueryable();

            // Apply filters
            query = ApplyFilters(query, filter);

            // Get total count before pagination
            var totalRecords = await query.CountAsync();

            // Apply sorting
            query = ApplySorting(query, filter.SortBy, filter.SortDirection);

            // Apply pagination
            var folders = await query
                .Skip((filter.PageNumber - 1) * filter.PageSize)
                .Take(filter.PageSize)
                .ToListAsync();

            return folders.ToPagedResult(
                filter.PageNumber,
                filter.PageSize,
                totalRecords,
                filter.Search,
                filter.SortBy,
                filter.SortDirection
            );
        }
        public async Task<Folder?> GetByIdWithDetailsAsync(int id)
        {
            return await _context.Folders
                .Include(f => f.ParentFolder)
                .Include(f => f.Department)
                .Include(f => f.CreatedBy)
                .Include(f => f.SubFolders)
                .Include(f => f.Documents)
                .FirstOrDefaultAsync(f => f.Id == id);
        }
        public async Task<PagedResult<Folder>> GetByFolderID(FolderFilterDto filter, int folderId)
        {

            var documents = await _context.Documents
             .Where(d => d.FolderId == folderId)
            .ToListAsync();

            var query = _context.Folders
                .Include(f => f.ParentFolder)
                .Include(f => f.Department)
                .Include(f => f.CreatedBy)
                .Include(f => f.SubFolders)
                .Include(f => f.Documents)
                //.Where(f => f.ParentFolderId == folderId)
                .AsQueryable();
            Console.WriteLine("****************************************************");
            Console.WriteLine($"Querying folders with ParentFolderId: {query}");

            query = ApplyFilters(query, filter);
            foreach (var folder in query.ToList())
            {
                Console.WriteLine($"doc Name: {folder.Documents}, ParentFolderId: {folder.ParentFolderId}");
                Console.WriteLine($"Folder ID: {folder.Id}, Name: {folder.Name}, ParentFolderId: {folder.ParentFolderId}");
            }

            // Get total count before pagination
            var totalRecords = await query.CountAsync();

            // Apply sorting
            query = ApplySorting(query, filter.SortBy, filter.SortDirection);

            // Apply pagination
            var folders = await query
                .Skip((filter.PageNumber - 1) * filter.PageSize)
                .Take(filter.PageSize)
                .ToListAsync();

            return folders.ToPagedResult(
                
                filter.PageNumber,
                filter.PageSize,
                totalRecords,
                filter.Search,
                filter.SortBy,
                filter.SortDirection

            );
        }

        public async Task<PagedResult<Folder>> GetByDepartmentPagedAsync(int departmentId, PaginationParams pagination)
        {
            var query = _context.Folders
                .Include(f => f.ParentFolder)
                .Include(f => f.Department)
                .Include(f => f.CreatedBy)
                .Include(f => f.SubFolders)
                .Include(f => f.Documents)
                .Where(f => f.DepartmentId == departmentId);

            // Apply search if provided
            if (!string.IsNullOrEmpty(pagination.Search))
            {
                query = query.Where(f =>
                    f.Name.Contains(pagination.Search)
                );
            }

            var totalRecords = await query.CountAsync();

            query = ApplySorting(query, pagination.SortBy, pagination.SortDirection);

            var folders = await query
                .Skip((pagination.PageNumber - 1) * pagination.PageSize)
                .Take(pagination.PageSize)
                .ToListAsync();

            return folders.ToPagedResult(
                pagination.PageNumber,
                pagination.PageSize,
                totalRecords,
                pagination.Search,
                pagination.SortBy,
                pagination.SortDirection
            );
        }

        public async Task<PagedResult<Folder>> GetByParentPagedAsync(int? parentFolderId, PaginationParams pagination)
        {
            var query = _context.Folders
                .Include(f => f.ParentFolder)
                .Include(f => f.Department)
                .Include(f => f.CreatedBy)
                .Include(f => f.SubFolders)
                .Include(f => f.Documents)
                .Where(f => f.ParentFolderId == parentFolderId);

            // Apply search if provided
            if (!string.IsNullOrEmpty(pagination.Search))
            {
                query = query.Where(f =>
                    f.Name.Contains(pagination.Search)
                );
            }

            var totalRecords = await query.CountAsync();

            query = ApplySorting(query, pagination.SortBy, pagination.SortDirection);

            var folders = await query
                .Skip((pagination.PageNumber - 1) * pagination.PageSize)
                .Take(pagination.PageSize)
                .ToListAsync();

            return folders.ToPagedResult(
                pagination.PageNumber,
                pagination.PageSize,
                totalRecords,
                pagination.Search,
                pagination.SortBy,
                pagination.SortDirection
            );
        }

        public async Task<PagedResult<Folder>> GetByUserPagedAsync(string userId, PaginationParams pagination)
        {
            var query = _context.Folders
                .Include(f => f.ParentFolder)
                .Include(f => f.Department)
                .Include(f => f.CreatedBy)
                .Include(f => f.SubFolders)
                .Include(f => f.Documents)
                .Where(f => f.CreatedById.ToString() == userId);

            // Apply search if provided
            if (!string.IsNullOrEmpty(pagination.Search))
            {
                query = query.Where(f =>
                    f.Name.Contains(pagination.Search) ||

                    f.Department.Name.Contains(pagination.Search)
                );
            }

            var totalRecords = await query.CountAsync();

            query = ApplySorting(query, pagination.SortBy, pagination.SortDirection);

            var folders = await query
                .Skip((pagination.PageNumber - 1) * pagination.PageSize)
                .Take(pagination.PageSize)
                .ToListAsync();

            return folders.ToPagedResult(
                pagination.PageNumber,
                pagination.PageSize,
                totalRecords,
                pagination.Search,
                pagination.SortBy,
                pagination.SortDirection
            );
        }



        public async Task<IReadOnlyList<Folder>> GetAllWithDetailsAsync()
        {
            return await _context.Folders
                .Include(f => f.ParentFolder)
                .Include(f => f.Department)
                .Include(f => f.CreatedBy)
                .Include(f => f.SubFolders)
                .Include(f => f.Documents)
                .OrderBy(f => f.Name)
                .ToListAsync();
        }

        public async Task<Folder> AddAsync(CreateFolderDTO folderDto)
        {
            try
            {
                var folder = new Folder
                {
                    Name = folderDto.Name,
                    ParentFolderId = folderDto.ParentFolderId,
                    DepartmentId = folderDto.DepartmentId,
                    //CreatedById = folderDto.CreatedById,
                    CreatedAt = DateTime.UtcNow,
                    UpdatedAt = DateTime.UtcNow
                };

                _context.Folders.Add(folder);
                await _context.SaveChangesAsync();
                return folder;
            }
            catch (System.Exception)
            {

                throw new Exception("An error occurred while adding the folder.");
            }
        }

        public async Task<IReadOnlyList<FolderTreeDto>> GetFolderTreeAsync(int? parentFolderId = null)
        {
            var folders = await _context.Folders
                .Include(f => f.Department)
                .Include(f => f.SubFolders)
                .Include(f => f.Documents)
                .Where(f => f.ParentFolderId == parentFolderId)
                .OrderBy(f => f.Name)
                .ToListAsync();

            var result = new List<FolderTreeDto>();

            foreach (var folder in folders)
            {
                var folderDto = new FolderTreeDto
                {
                    Id = folder.Id,
                    Name = folder.Name,

                    ParentFolderId = folder.ParentFolderId,
                    DepartmentId = folder.DepartmentId,
                    DepartmentName = folder.Department.Name,

                    SubFolderCount = folder.SubFolders?.Count() ?? 0,
                    DocumentCount = folder.Documents?.Count() ?? 0,
                    CreatedAt = folder.CreatedAt,
                    SubFolders = (IEnumerable<FolderTreeDto>)await GetFolderTreeAsync(folder.Id)
                };

                result.Add(folderDto);
            }

            return result;
        }



        public async Task<IReadOnlyList<Folder>> GetSubFoldersAsync(int parentFolderId)
        {
            return await _context.Folders
                .Include(f => f.Department)
                .Include(f => f.CreatedBy)
                .Where(f => f.ParentFolderId == parentFolderId)
                .OrderBy(f => f.Name)
                .ToListAsync();
        }

        public async Task<bool> IsNameTakenInParentAsync(string name, int? parentFolderId, int departmentId, int? excludeId = null)
        {
            var query = _context.Folders
                .Where(f => f.Name.ToLower() == name.ToLower() &&
                           f.ParentFolderId == parentFolderId &&
                           f.DepartmentId == departmentId);

            if (excludeId.HasValue)
            {
                query = query.Where(f => f.Id != excludeId.Value);
            }

            return await query.AnyAsync();
        }

        public async Task<bool> HasSubFoldersAsync(int folderId)
        {
            return await _context.Folders.AnyAsync(f => f.ParentFolderId == folderId);
        }

        public async Task<bool> HasDocumentsAsync(int folderId)
        {
            return await _context.Documents.AnyAsync(d => d.FolderId == folderId);
        }

        public async Task<int> GetTotalCountAsync()
        {
            return await _context.Folders.CountAsync();
        }

        public async Task<int> GetTotalDepartmentsCountAsync()
        {
            return await _context.Folders
                .Select(f => f.DepartmentId)
                .Distinct()
                .CountAsync();
        }

        public async Task<int> GetTotalDocumentsCountAsync()
        {
            return await _context.Documents

                .CountAsync();
        }

        public async Task BulkUpdateAsync(IEnumerable<int> folderIds, UpdateFolderDTO updateDto)
        {
            var folders = await _context.Folders
                .Where(f => folderIds.Contains(f.Id))
                .ToListAsync();

            foreach (var folder in folders)
            {
                if (!string.IsNullOrEmpty(updateDto.Name))
                    folder.Name = updateDto.Name;


                if (updateDto.ParentFolderId.HasValue)
                    folder.ParentFolderId = updateDto.ParentFolderId;



                folder.UpdatedAt = DateTime.UtcNow;
            }

            _context.Folders.UpdateRange(folders);
        }










        private IQueryable<Folder> ApplyFilters(IQueryable<Folder> query, FolderFilterDto filter)
        {
            if (!string.IsNullOrEmpty(filter.Name))
                query = query.Where(f => f.Name.Contains(filter.Name));

            // if (filter.ParentFolderId.HasValue)
            //     query = query.Where(f => f.ParentFolderId == filter.ParentFolderId);


            if (filter.DepartmentId.HasValue)
                query = query.Where(f => f.DepartmentId == filter.DepartmentId);

            if (!string.IsNullOrEmpty(filter.DepartmentName))
                query = query.Where(f => f.Department.Name.Contains(filter.DepartmentName));

            if (!string.IsNullOrEmpty(filter.CreatedById))
                query = query.Where(f => f.CreatedById.ToString() == filter.CreatedById);

            if (!string.IsNullOrEmpty(filter.CreatedByName))
                query = query.Where(f =>
                    f.CreatedBy.UserName.Contains(filter.CreatedByName) ||
                    f.CreatedBy.UserName!.Contains(filter.CreatedByName)
                );

            // if (filter.CreatedFrom.HasValue)
            //     query = query.Where(f => f.CreatedAt >= filter.CreatedFrom);

            // if (filter.CreatedTo.HasValue)
            //     query = query.Where(f => f.CreatedAt <= filter.CreatedTo);

            // if (filter.UpdatedFrom.HasValue)
            //     query = query.Where(f => f.UpdatedAt >= filter.UpdatedFrom);

            // if (filter.UpdatedTo.HasValue)
            //     query = query.Where(f => f.UpdatedAt <= filter.UpdatedTo);




            // if (filter.IsRootFolder.HasValue)
            // {
            //     if (filter.IsRootFolder.Value)
            //         query = query.Where(f => f.ParentFolderId == null);
            //     else
            //         query = query.Where(f => f.ParentFolderId != null);
            // }

            if (!string.IsNullOrEmpty(filter.Search))
            {
                query = query.Where(f =>
                    f.Name.Contains(filter.Search) ||

                    f.Department.Name.Contains(filter.Search) ||
                    f.CreatedBy.UserName.Contains(filter.Search)
                );
            }

            return query;
        }

        private IQueryable<Folder> ApplySorting(IQueryable<Folder> query, string? sortBy, string? sortDirection)
        {
            if (string.IsNullOrEmpty(sortBy))
                return query.OrderBy(f => f.Name);

            var isDescending = sortDirection?.ToLower() == "desc";

            return sortBy.ToLower() switch
            {
                "name" => isDescending ? query.OrderByDescending(f => f.Name)
                                       : query.OrderBy(f => f.Name),

                "departmentname" => isDescending ? query.OrderByDescending(f => f.Department.Name)
                                                 : query.OrderBy(f => f.Department.Name),
                "parentfoldername" => isDescending ? query.OrderByDescending(f => f.ParentFolder!.Name)
                                                   : query.OrderBy(f => f.ParentFolder!.Name),
                "createdbyname" => isDescending ? query.OrderByDescending(f => f.CreatedBy.UserName)
                                                : query.OrderBy(f => f.CreatedBy.UserName),
                "createdat" => isDescending ? query.OrderByDescending(f => f.CreatedAt)
                                            : query.OrderBy(f => f.CreatedAt),
                "updatedat" => isDescending ? query.OrderByDescending(f => f.UpdatedAt)
                                            : query.OrderBy(f => f.UpdatedAt),

                _ => query.OrderBy(f => f.Name)
            };
        }



        public Task<Folder?> GetByNameAsync(string name, int departmentId)
        {
            throw new NotImplementedException();
        }

        public Task<bool> ExistsAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IReadOnlyList<Folder>> GetByDepartmentAsync(int departmentId)
        {
            throw new NotImplementedException();
        }

        public Task<IReadOnlyList<Folder>> GetRootFoldersAsync(int departmentId)
        {
            throw new NotImplementedException();
        }

        public Task<IReadOnlyList<Folder>> GetFolderTreeAsync(int departmentId)
        {
            throw new NotImplementedException();
        }

        public Task<IReadOnlyList<Folder>> GetByUserAsync(string userId)
        {
            throw new NotImplementedException();
        }

        
    }
}