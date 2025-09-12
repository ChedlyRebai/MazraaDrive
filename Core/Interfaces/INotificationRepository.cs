using System;
using Core.DTO;
using Core.Entities;

namespace Core.Interfaces;

public interface INotificationRepository
{
    Task<Notification> GetByIdAsync(int id);
   Task<PagedResult<Notification>>  GetAllAsync();
    Task<PagedResult<Notification>> GetByUserIdAsync(string userId);
    Task<PagedResult<Notification>> GetUnreadByUserIdAsync(string userId);
    Task<int> GetUnreadCountAsync(string userId);
    Task<Notification> AddAsync(Notification notification);
    Task UpdateAsync(Notification notification);
    Task DeleteAsync(Notification notification);
    Task MarkAsReadAsync(int id);
    Task MarkAllAsReadAsync(string userId);
    Task<bool> ExistsAsync(int id);
}
