using Core.DTO;
using Core.DTOs;
using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class RoleRepository : IRoleRepository
    {
        private readonly AppDbContext _context;
        private readonly RoleManager<Role> _roleManager;
        public RoleRepository(AppDbContext context, RoleManager<Role> roleManager)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
            _roleManager = roleManager ?? throw new ArgumentNullException(nameof(roleManager));
        }

        public async Task<string> testapi()
        {
            return "Role Repository - Test successful!";
        }

        public async Task<IEnumerable<IdentityRole<string>>> GetAllAsync()
        {
            return await _roleManager.Roles
                .Select(r => new IdentityRole<string>
                {
                    Id = r.Id.ToString(),
                    Name = r.Name,
                    NormalizedName = r.NormalizedName,
                    ConcurrencyStamp = r.ConcurrencyStamp
                })
                .ToListAsync();
        }

        public async Task<Role?> GetByIdAsync(string id)
        {
            return await _roleManager.FindByIdAsync(id);
        }

        public async Task<Role?> GetByNameAsync(string name)
        {
            if (string.IsNullOrEmpty(name))
                return null;

            return await _roleManager.FindByNameAsync(name);
        }

        public async Task<Role?> AddAsync(Role role)
        {
            if (role == null)
                throw new ArgumentNullException(nameof(role));

            var result = await _roleManager.CreateAsync(role);
            if (result.Succeeded)
            {
                return role;
            }
            return null;
        }

        public async Task<bool> UpdateAsync(Role role)
        {
            if (role == null)
                throw new ArgumentNullException(nameof(role));

            var result = await _roleManager.UpdateAsync(role);
            return result.Succeeded;
        }

        public async Task<bool> DeleteAsync(string id)
        {
            var role = await _roleManager.FindByIdAsync(id);
            if (role != null)
            {
                var result = await _roleManager.DeleteAsync(role);
                return result.Succeeded;
            }
            return false;
        }

        public async Task<bool> ExistsAsync(string id)
        {
            var role = await _roleManager.FindByIdAsync(id);
            return role != null;
        }

        public async Task<bool> ExistsByNameAsync(string name)
        {
            if (string.IsNullOrEmpty(name))
                return false;

            var role = await _roleManager.FindByNameAsync(name);
            return role != null;
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
            var query = _roleManager.Roles.AsQueryable();

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

            if (!string.IsNullOrEmpty(filter.Search))
            {
                query = query.Where(r =>
                    r.Name.Contains(filter.Search)
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
                _ => query.OrderBy(r => r.Name)
            };
        }

        public async Task<Role[]> SearchAsync(string searchTerm)
        {
            if (string.IsNullOrEmpty(searchTerm))
                return await _roleManager.Roles
                    .OrderBy(r => r.Name)
                    .ToArrayAsync();

            return await _roleManager.Roles
                .Where(r => r.Name.ToLower().Contains(searchTerm.ToLower()))
                .OrderBy(r => r.Name)
                .ToArrayAsync();
        }

        public Task<Role> GetByIdAsync(int id)
        {
            throw new NotImplementedException();
        }

        Task IGenericRepository<Role>.UpdateAsync(Role entity)
        {
            return UpdateAsync(entity);
        }

        public Task DeleteAsync(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<List<Role>> GetAllRoles()
        {
            return await _roleManager.Roles.Select(r => r).ToListAsync();
        }
    }
}
