using System;
using Core.DTO;
using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure;

public class NotificationRepository:INotificationRepository
{
    private readonly AppDbContext _context;

    public NotificationRepository(AppDbContext context)
    {
        _context = context;
    }

  public async Task<Notification> GetByIdAsync(int id)
        {
            return await _context.Notifications
                .Include(n => n.User)
                .Include(n => n.Sender)
                .FirstOrDefaultAsync(n => n.Id == id);
        }

        public async Task<PagedResult<Notification>> GetAllAsync(PaginationParams paginationParams)
        {
            var query = _context.Notifications
                .Include(n => n.User)
                .Include(n => n.Sender)
                .AsQueryable();

            var totalRecords = await query.CountAsync();

            query = ApplySorting(query, paginationParams.SortBy, paginationParams.SortDirection);

            var notifications = await query
                .Skip((paginationParams.PageNumber - 1) * paginationParams.PageSize)
                .Take(paginationParams.PageSize)
                .ToListAsync();

            return notifications.ToPagedResult(
                paginationParams.PageNumber,
                paginationParams.PageSize,
                totalRecords,
                paginationParams.Search,
                paginationParams.SortBy,
                paginationParams.SortDirection
            );
        }

        private IQueryable<Notification> ApplySorting(IQueryable<Notification> query, string sortBy, string sortDirection)
        {
            if (string.IsNullOrEmpty(sortBy))
            {
                return query.OrderByDescending(n => n.CreatedAt);
            }

            // Example: sortBy could be "CreatedAt", "Title", etc.
            // You can expand this switch as needed.
            switch (sortBy)
            {
                case "CreatedAt":
                    query = sortDirection == "desc"
                        ? query.OrderByDescending(n => n.CreatedAt)
                        : query.OrderBy(n => n.CreatedAt);
                    break;
                case "Title":
                    query = sortDirection == "desc"
                        ? query.OrderByDescending(n => n.title)
                        : query.OrderBy(n => n.title);
                    break;
                default:
                    query = query.OrderByDescending(n => n.CreatedAt);
                    break;
            }

            return query;
        }

        

        public async Task<int> GetUnreadCountAsync(string userId)
        {
            return await _context.Notifications
                .CountAsync(n => n.UserId == userId && !n.IsRead);
        }

        public async Task<Notification> AddAsync(Notification notification)
        {
            notification.CreatedAt = DateTime.Now; // Ensure date is set
            await _context.Notifications.AddAsync(notification);
            await _context.SaveChangesAsync();
            return notification;
        }

        public async Task UpdateAsync(Notification notification)
        {
            _context.Notifications.Update(notification);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(Notification notification)
        {
            _context.Notifications.Remove(notification);
            await _context.SaveChangesAsync();
        }

        public async Task MarkAsReadAsync(int id)
        {
            var notification = await _context.Notifications.FindAsync(id);
            if (notification != null && !notification.IsRead)
            {
                notification.IsRead = true;
                await _context.SaveChangesAsync();
            }
        }

        public async Task MarkAllAsReadAsync(string userId)
        {
            var unreadNotifications = await _context.Notifications
                .Where(n => n.UserId == userId && !n.IsRead)
                .ToListAsync();

            foreach (var notification in unreadNotifications)
            {
                notification.IsRead = true;
            }

            await _context.SaveChangesAsync();
        }

        public async Task<bool> ExistsAsync(int id)
        {
            return await _context.Notifications.AnyAsync(n => n.Id == id);
        }

    public async Task<PagedResult<Notification>> GetAllAsync()
    {
        var notifications = await _context.Notifications
            .Include(n => n.User)
            .Include(n => n.Sender)
            .OrderByDescending(n => n.CreatedAt)
            .ToListAsync();

        return notifications.ToPagedResult(1, notifications.Count, notifications.Count, null, "CreatedAt", "desc");
    }

    public async Task<PagedResult<Notification>> GetByUserIdAsync(string userId)
    {
        var notifications = await _context.Notifications
            .Include(n => n.User)
            .Include(n => n.Sender)
            .Where(n => n.UserId == userId)
            .OrderByDescending(n => n.CreatedAt)
            .ToListAsync();

        return notifications.ToPagedResult(1, notifications.Count, notifications.Count, null, "CreatedAt", "desc");
    }

    public async Task<PagedResult<Notification>> GetUnreadByUserIdAsync(string userId)
    {
        var notifications = await _context.Notifications
            .Include(n => n.User)
            .Include(n => n.Sender)
            .Where(n => n.UserId == userId && !n.IsRead)
            .OrderByDescending(n => n.CreatedAt)
            .ToListAsync();

        return notifications.ToPagedResult(1, notifications.Count, notifications.Count, null, "CreatedAt", "desc");
    }
}
