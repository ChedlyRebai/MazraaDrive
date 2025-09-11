using System;
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

        public async Task<IReadOnlyList<Notification>> GetAllAsync()
        {
            return await _context.Notifications
                .Include(n => n.User)
                .Include(n => n.Sender)
                .OrderByDescending(n => n.Date)
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Notification>> GetByUserIdAsync(string userId)
        {
            return await _context.Notifications
                .Include(n => n.User)
                .Include(n => n.Sender)
                .Where(n => n.UserId == userId)
                .OrderByDescending(n => n.Date)
                .ToListAsync();
        }

        public async Task<IReadOnlyList<Notification>> GetUnreadByUserIdAsync(string userId)
        {
            return await _context.Notifications
                .Include(n => n.User)
                .Include(n => n.Sender)
                .Where(n => n.UserId == userId && !n.IsRead)
                .OrderByDescending(n => n.Date)
                .ToListAsync();
        }

        public async Task<int> GetUnreadCountAsync(string userId)
        {
            return await _context.Notifications
                .CountAsync(n => n.UserId == userId && !n.IsRead);
        }

        public async Task<Notification> AddAsync(Notification notification)
        {
            notification.Date = DateTime.Now; // Ensure date is set
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
    
}
