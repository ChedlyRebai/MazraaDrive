using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Repositories
{
    public class UserRepository : GenericRepository<AppUser>, IUserRepository
    {
        private readonly AppDbContext _context;

        public UserRepository(AppDbContext context) : base(context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task<AppUser> AddAsync(AppUser user)
        {
            if (user == null)
                throw new ArgumentNullException(nameof(user));

            user.CreatedAt = DateTime.UtcNow;
            user.UpdatedAt = DateTime.UtcNow;

            var result = await _context.Users.AddAsync(user);
            return result.Entity;
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
                .Where(u => u.RoleId == roleId)
                
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
    }
}