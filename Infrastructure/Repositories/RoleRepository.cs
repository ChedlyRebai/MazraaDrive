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
    }
}