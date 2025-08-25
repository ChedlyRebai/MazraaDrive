using Core.DTO;
using Core.DTOs;
using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class RoleRepository : IRoleRepository
    {
        private readonly AppDbContext _context;

        public RoleRepository(AppDbContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task<string> testapi()
        {
            return "Role Repository - Test successful!";
        }

        public async Task<IEnumerable<Role>> GetAllAsync()
        {
            return await _context.Role
                .Where(r => r.IsActive)
                .OrderBy(r => r.Name)
                .ToListAsync();
        }

        public async Task<Role?> GetByIdAsync(int id)
        {
            return await _context.Role.FindAsync(id);
        }

        public async Task<Role?> GetByNameAsync(string name)
        {
            if (string.IsNullOrEmpty(name))
                return null;

            return await _context.Role
                .FirstOrDefaultAsync(r => r.Name.ToLower() == name.ToLower());
        }

        public async Task<Role> AddAsync(Role role)
        {
            if (role == null)
                throw new ArgumentNullException(nameof(role));

            // role.CreatedAt = DateTime.UtcNow;
            // role.UpdatedAt = DateTime.UtcNow;

            var result = await _context.Role.AddAsync(role);
            return result.Entity;
        }

        public async Task UpdateAsync(Role role)
        {
            if (role == null)
                throw new ArgumentNullException(nameof(role));


            _context.Role.Update(role);
        }

        public async Task DeleteAsync(int id)
        {
            var role = await _context.Role.FindAsync(id);
            if (role != null)
            {
                _context.Role.Remove(role);
            }
        }

        public async Task<bool> ExistsAsync(int id)
        {
            return await _context.Role.AnyAsync(r => r.Id == id);
        }

        public async Task<bool> ExistsByNameAsync(string name)
        {
            if (string.IsNullOrEmpty(name))
                return false;

            return await _context.Role
                .AnyAsync(r => r.Name.ToLower() == name.ToLower());
        }

        Task<IReadOnlyList<Role>> IGenericRepository<Role>.GetAllAsync()
        {
            throw new NotImplementedException();
        }

        Task IGenericRepository<Role>.AddAsync(Role entity)
        {
            return AddAsync(entity);
        }

        public async Task<PagedResult<Role>> GetPagedAsync(RoleFilterDto filter, PaginationParams paginationParams)
        {
            var query = _context.Role.AsQueryable();

            query = ApplyFilters(query, filter);
            var totalRecords = await query.CountAsync();

            query = ApplySorting(query, paginationParams.SortBy, paginationParams.SortDirection);
            var roles = await query.Skip((filter.PageNumber - 1) * filter.PageSize)
                                   .Take(filter.PageSize)
                                   .ToListAsync();
            
            return roles.ToPagedResult(
                filter.PageNumber,
                filter.PageSize,
                totalRecords,
                filter.Search,
                filter.SortBy,
                filter.SortDirection
            );

        }


        private IQueryable<Role> ApplyFilters(IQueryable<Role> query, RoleFilterDto filter)
        {
            if (!string.IsNullOrEmpty(filter.Name))
                query = query.Where(r => r.Name.Contains(filter.Name));

            if (filter.IsActive.HasValue)
                query = query.Where(r => r.IsActive == filter.IsActive);

            if (filter.CreatedFrom.HasValue)
                query = query.Where(r => r.CreatedAt >= filter.CreatedFrom);

            if (filter.CreatedTo.HasValue)
                query = query.Where(r => r.CreatedAt <= filter.CreatedTo);

            if (!string.IsNullOrEmpty(filter.Search))
            {
                query = query.Where(r =>
                    r.Name.Contains(filter.Search) ||
                    r.Description.Contains(filter.Search)
                );
            }

            return query;
        }

        private IQueryable<Role> ApplySorting(IQueryable<Role> query, string? sortBy, string? sortDirection)
        {
            if (string.IsNullOrEmpty(sortBy))
                return query.OrderBy(r => r.Name);

            var isDescending = sortDirection?.ToLower() == "desc";

            return sortBy.ToLower() switch
            {
                "name" => isDescending ? query.OrderByDescending(r => r.Name)
                                       : query.OrderBy(r => r.Name),
                "description" => isDescending ? query.OrderByDescending(r => r.Description)
                                              : query.OrderBy(r => r.Description),
                "createdat" => isDescending ? query.OrderByDescending(r => r.CreatedAt)
                                            : query.OrderBy(r => r.CreatedAt),
                "isactive" => isDescending ? query.OrderByDescending(r => r.IsActive)
                                           : query.OrderBy(r => r.IsActive),
                _ => query.OrderBy(r => r.Name)
            };
        }

        public Task<Role[]> SearchAsync(string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm.ToLower()))
                return _context.Role
                .OrderBy(r => r.Name)
                .ToArrayAsync();

            var roles = _context.Role
                .Where(r => r.Name.ToLower().Contains(searchTerm.ToLower()) || r.Description.Contains(searchTerm.ToLower()))
                .OrderBy(r => r.Name)
                .ToArrayAsync();

            return roles;
        }
    }
}