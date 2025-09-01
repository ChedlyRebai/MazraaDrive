using Core.DTO;
using Core.DTOs;
using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class UserRepository : GenericRepository<AppUser>, IUserRepository
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;
        public UserRepository(AppDbContext context, UserManager<AppUser> userManager) : base(context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
            _userManager = userManager ?? throw new ArgumentNullException(nameof(userManager));
        }

        public async Task<AppUser> AddAsync(AppUser user)
        {
            if (user == null)
                throw new ArgumentNullException(nameof(user));

            user.CreatedAt = DateTime.UtcNow;
            user.UpdatedAt = DateTime.UtcNow;

           
            var result = await _userManager.CreateAsync(user);
            return result.Succeeded ? user : null;
        }

        public async Task DeleteAsync(string id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
                throw new ArgumentException($"User with id {id} not found");

            _context.Users.Remove(user);
        }

        public async Task<IReadOnlyList<AppUser>> GetAllAsync()
        {
            return await _context.Users
                .Include(u => u.Department)
                .Include(u => u.Role)
                .ToListAsync();
        }


        public async Task<AppUser?> GetByIdAsync(string id)
        {
            return await _context.Users.Include(u => u.Department)
                .Include(u => u.Role)
                .FirstOrDefaultAsync(u => u.Id == id);
        }

        public async Task UpdateAsync(AppUser user)
        {
            if (user == null)
                throw new ArgumentNullException(nameof(user));

            user.UpdatedAt = DateTime.UtcNow;
            _context.Users.Update(user);
        }


        public async Task<AppUser?> GetByUserNameAsync(string userName)
        {
            return await _context.Users
                .Include(u => u.Department)
                .Include(u => u.Role)
                .FirstOrDefaultAsync(u => u.UserName == userName);
        }

        public async Task<IReadOnlyList<AppUser>> GetByDepartmentAsync(int departmentId)
        {
            return await _context.Users
                .Include(u => u.Department)
                .Include(u => u.Role)
                .Where(u => u.DepartmentId == departmentId)

                .ToListAsync();
        }

        public async Task<IReadOnlyList<AppUser>> GetByRoleAsync(int roleId)
        {
            return await _context.Users
                .Include(u => u.Department)
                .Include(u => u.Role)
                .Where(u => u.RoleId == roleId.ToString())

                .ToListAsync();
        }

        public async Task<IReadOnlyList<AppUser>> GetActiveUsersAsync()
        {
            return await _context.Users
                .Include(u => u.Department)
                .Include(u => u.Role)
                .Where(u => u.IsActive)

                .ToListAsync();
        }

        public async Task<IReadOnlyList<AppUser>> GetInactiveUsersAsync()
        {
            return await _context.Users
                .Include(u => u.Department)
                .Include(u => u.Role)
                .Where(u => !u.IsActive)

                .ToListAsync();
        }



        public async Task<bool> IsUserNameTakenAsync(string userName, string? excludeUserId = null)
        {
            var query = _context.Users.Where(u => u.UserName == userName);

            if (excludeUserId != null)
            {
                query = query.Where(u => u.Id != excludeUserId);
            }


            return await query.AnyAsync();
        }

        public async Task<int> GetUserCountAsync()
        {
            return await _context.Users.CountAsync();
        }

        public async Task<int> GetActiveUserCountAsync()
        {
            return await _context.Users.CountAsync(u => u.IsActive);
        }

        public async Task<IReadOnlyList<AppUser>> SearchUsersAsync(string searchTerm)
        {
            return await _context.Users
                .Include(u => u.Department)
                .Include(u => u.Role)
                .Where(u =>
                           u.Email.Contains(searchTerm) ||
                           u.UserName!.Contains(searchTerm))

                .ToListAsync();
        }

        public async Task DeactivateUserAsync(string userId)
        {
            var user = await _context.Users.FindAsync(userId);
            if (user != null)
            {
                user.IsActive = false;
                user.UpdatedAt = DateTime.UtcNow;
                _context.Users.Update(user);
            }
        }

        public async Task ActivateUserAsync(string userId)
        {
            var user = await _context.Users.FindAsync(userId);
            if (user != null)
            {
                user.IsActive = true;
                user.UpdatedAt = DateTime.UtcNow;
                _context.Users.Update(user);
            }
        }

        public async Task<IReadOnlyList<AppUser>> GetUsersWithRolesAsync()
        {
            return await _context.Users
                .Include(u => u.Department)
                .Include(u => u.Role)
                .Where(u => u.RoleId != null)

                .ToListAsync();
        }

        public async Task<IReadOnlyList<AppUser>> GetRecentUsersAsync(int count = 10)
        {
            return await _context.Users
                .Include(u => u.Department)
                .Include(u => u.Role)
                .OrderByDescending(u => u.CreatedAt)
                .Take(count)
                .ToListAsync();
        }

        public async Task<PagedResult<AppUser>> GetPagedAsync(UserFilterDto filter)
        {
            var query = _context.Users
                .Include(u => u.Role)
                .Include(u => u.Department)
                .Include(u => u.UploadedDocuments)
            //    .Include(u => u.Folders)
                .AsQueryable();

            // Apply filters
            query = ApplyFilters(query, filter);

            // Get total count before pagination
            var totalRecords = await query.CountAsync();

            // Apply sorting
            query = ApplySorting(query, filter.SortBy, filter.SortDirection);

            // Apply pagination
            var users = await query
                .Skip((filter.PageNumber - 1) * filter.PageSize)
                .Take(filter.PageSize)
                .ToListAsync();

            return users.ToPagedResult(
                filter.PageNumber,
                filter.PageSize,
                totalRecords,
                filter.Search,
                filter.SortBy,
                filter.SortDirection
            );
        }

        public async Task<AppUser?> GetByIdWithDetailsAsync(string id)
        {
            return await _context.Users
                .Include(u => u.Role)
                .Include(u => u.Department)
                .Include(u => u.UploadedDocuments)
                .Include(u=> u.CreatedFolders)
                //.Include(u => u.CreatedFolders.OrderByDescending(f => f.CreatedAt).Take(5))
                .FirstOrDefaultAsync(u => u.Id == id);
        }

        public async Task<AppUser?> GetByEmailAsync(string email)
        {
            return await _context.Users
                .Include(u => u.Role)
                .Include(u => u.Department)
                .FirstOrDefaultAsync(u => u.Email.ToLower() == email.ToLower());
        }

        public async Task<IReadOnlyList<AppUser>> GetUsersByDepartmentAsync(int departmentId)
        {
            return await _context.Users
                .Include(u => u.Role)
                .Where(u => u.DepartmentId == departmentId)
                .OrderBy(u => u.UserName)
                .ToListAsync();
                
        }

        public async Task<IReadOnlyList<AppUser>> GetUsersByRoleAsync(int roleId)
        {
            return await _context.Users
                .Include(u => u.Department)
                .Include(u => u.Role)
                .Where(u => u.RoleId == roleId.ToString())
                .ToListAsync();
        }

        public Task<bool> IsEmailTakenAsync(string email, string? excludeId = null)
        {
            throw new NotImplementedException();
        }

        public async Task<int> GetTotalCountAsync()
        {
            return await _context.Users.CountAsync();
        }

        public async Task<int> GetActiveCountAsync()
        {
            return await _context.Users.CountAsync(u => u.IsActive);
        }

        public async Task<int> GetInactiveCountAsync()
        {
            return await _context.Users.CountAsync(u => !u.IsActive);
        }

        public async Task<int> GetConfirmedEmailsCountAsync()
        {
            return await _context.Users.CountAsync(u => u.EmailConfirmed);
        }

        


        private IQueryable<AppUser> ApplyFilters(IQueryable<AppUser> query, UserFilterDto filter)
        {
            if (!string.IsNullOrEmpty(filter.UserName))
                query = query.Where(u => u.UserName.Contains(filter.UserName));

            // if (!string.IsNullOrEmpty(filter.Email))
            //     query = query.Where(u => u.Email.Contains(filter.Email));

          
            if (!string.IsNullOrEmpty(filter.PhoneNumber))
                query = query.Where(u => u.PhoneNumber.Contains(filter.PhoneNumber));

            if (filter.IsActive.HasValue)
                query = query.Where(u => u.IsActive == filter.IsActive);

            // if (filter.EmailConfirmed.HasValue)
            //     query = query.Where(u => u.EmailConfirmed == filter.EmailConfirmed);

            // if (filter.PhoneNumberConfirmed.HasValue)
            //     query = query.Where(u => u.PhoneNumberConfirmed == filter.PhoneNumberConfirmed);

            // if (filter.LockoutEnabled.HasValue)
            //     query = query.Where(u => u.LockoutEnabled == filter.LockoutEnabled);

            // if (filter.IsLockedOut.HasValue)
            // {
            //     if (filter.IsLockedOut.Value)
            //         query = query.Where(u => u.LockoutEnd.HasValue && u.LockoutEnd > DateTimeOffset.UtcNow);
            //     else
            //         query = query.Where(u => !u.LockoutEnd.HasValue || u.LockoutEnd <= DateTimeOffset.UtcNow);
            // }

            if (filter.RoleId.HasValue)
                query = query.Where(u => u.RoleId == filter.RoleId.ToString());

            if (!string.IsNullOrEmpty(filter.RoleName))
                query = query.Where(u => u.Role != null && u.Role.Name.Contains(filter.RoleName));

            if (filter.DepartmentId.HasValue)
                query = query.Where(u => u.DepartmentId == filter.DepartmentId);

            if (!string.IsNullOrEmpty(filter.DepartmentName))
                query = query.Where(u => u.Department.Name.Contains(filter.DepartmentName));

            // if (filter.CreatedFrom.HasValue)
            //     query = query.Where(u => u.CreatedAt >= filter.CreatedFrom);

            // if (filter.CreatedTo.HasValue)
            //     query = query.Where(u => u.CreatedAt <= filter.CreatedTo);

            // if (filter.UpdatedFrom.HasValue)
            //     query = query.Where(u => u.UpdatedAt >= filter.UpdatedFrom);

            // if (filter.UpdatedTo.HasValue)
            //     query = query.Where(u => u.UpdatedAt <= filter.UpdatedTo);

            // if (filter.MinDocumentsCount.HasValue)
            //     query = query.Where(u => u.UploadedDocuments.Count() >= filter.MinDocumentsCount);

            // if (filter.MaxDocumentsCount.HasValue)
            //     query = query.Where(u => u.UploadedDocuments.Count() <= filter.MaxDocumentsCount);

            // if (filter.MinFoldersCount.HasValue)
            //     query = query.Where(u => u.Folders.Count(f => f.IsActive) >= filter.MinFoldersCount);

            // if (filter.MaxFoldersCount.HasValue)
            //     query = query.Where(u => u.Folders.Count(f => f.IsActive) <= filter.MaxFoldersCount);

            // if (filter.MinAccessFailedCount.HasValue)
            //     query = query.Where(u => u.AccessFailedCount >= filter.MinAccessFailedCount);

            // if (filter.MaxAccessFailedCount.HasValue)
            //     query = query.Where(u => u.AccessFailedCount <= filter.MaxAccessFailedCount);

            // if (filter.HasDocuments.HasValue)
            // {
            //     if (filter.HasDocuments.Value)
            //         query = query.Where(u => u.UploadedDocuments.Any());
            //     else
            //         query = query.Where(u => !u.UploadedDocuments.Any());
            // }

            /*if (filter.HasFolders.HasValue)
            {
                if (filter.HasFolders.Value)
                    query = query.Where(u => u.Folders.Any(f => f.IsActive));
                else
                    query = query.Where(u => !u.Folders.Any(f => f.IsActive));
            }*/

            if (!string.IsNullOrEmpty(filter.Search))
            {
                query = query.Where(u => 
                    u.UserName.Contains(filter.Search) ||
                    u.Email.Contains(filter.Search) ||

                    u.PhoneNumber.Contains(filter.Search)
                );
            }

            return query;
        }

        private IQueryable<AppUser> ApplySorting(IQueryable<AppUser> query, string? sortBy, string? sortDirection)
        {
            if (string.IsNullOrEmpty(sortBy))
                return query.OrderBy(u => u.CreatedAt);

            var isDescending = sortDirection?.ToLower() == "desc";

            return sortBy.ToLower() switch
            {
                "username" => isDescending ? query.OrderByDescending(u => u.UserName)
                                           : query.OrderBy(u => u.UserName),
                "email" => isDescending ? query.OrderByDescending(u => u.Email)
                                        : query.OrderBy(u => u.Email),
              
                "phonenumber" => isDescending ? query.OrderByDescending(u => u.PhoneNumber)
                                              : query.OrderBy(u => u.PhoneNumber),
                "createdat" => isDescending ? query.OrderByDescending(u => u.CreatedAt)
                                            : query.OrderBy(u => u.CreatedAt),
                "updatedat" => isDescending ? query.OrderByDescending(u => u.UpdatedAt)
                                            : query.OrderBy(u => u.UpdatedAt),
                "isactive" => isDescending ? query.OrderByDescending(u => u.IsActive)
                                           : query.OrderBy(u => u.IsActive),
                "rolename" => isDescending ? query.OrderByDescending(u => u.Role != null ? u.Role.Name : "")
                                           : query.OrderBy(u => u.Role != null ? u.Role.Name : ""),
                "departmentname" => isDescending ? query.OrderByDescending(u => u.Department.Name)
                                                 : query.OrderBy(u => u.Department.Name),
                "emailconfirmed" => isDescending ? query.OrderByDescending(u => u.EmailConfirmed)
                                                 : query.OrderBy(u => u.EmailConfirmed),
                "accessfailedcount" => isDescending ? query.OrderByDescending(u => u.AccessFailedCount)
                                                    : query.OrderBy(u => u.AccessFailedCount),
                _ => query.OrderBy(u => u.CreatedAt)
            };
        }

        public Task<UserStatisticsDto> GetUserStatisticsAsync()
        {
            var totalUsers = _context.Users.Count();
            var activeUsers = _context.Users.Count(u => u.IsActive);
            var inactiveUsers = totalUsers - activeUsers;
            var totalDocuments = _context.Documents.Count();
            var totalFolders = _context.Folders.Count();

            var stats = new UserStatisticsDto
            {
                TotalUsers = totalUsers,
                ActiveUsers = activeUsers,
                InactiveUsers = inactiveUsers,
                TotalDocuments = totalDocuments,
                TotalFolders = totalFolders
            };

            return Task.FromResult(stats);
        }
    }
}