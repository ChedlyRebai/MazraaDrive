using AutoMapper;
using Core.DTO;
using Core.Entities;
using Core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{

    public class NotificationController : BaseController
    {


        public NotificationController(ICurrentUserService currentUser, IUnitOfWork unitOfWork, IMapper mapper, ILogger<BaseController> logger) : base(currentUser, unitOfWork, mapper, logger)
        {

        }

        [HttpGet]
        public async Task<ActionResult<NotificationPagedResult>> GetNotifications()
        {
            var notifications = await _unitOfWork.NotificationRepository.GetAllAsync();
            var notificationDtos = _mapper.Map<IReadOnlyList<NotificationDTO>>(notifications);
            return Ok(new NotificationPagedResult
            {
                Data = notificationDtos,
                TotalNotifications = notifications.Data.Count(n => true),

                UnreadNotifications = notifications.Data.Count(n => !n.IsRead)
            });
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<NotificationDTO>> GetNotification(int id)
        {
            var notification = await _unitOfWork.NotificationRepository.GetByIdAsync(id);
            if (notification == null)
                return NotFound();

            var notificationDto = _mapper.Map<NotificationDTO>(notification);
            return Ok(notificationDto);
        }



        // ...existing code...
        [HttpGet("my-notification")]
        public async Task<ActionResult<NotificationPagedResult>> GetUserNotifications(
            [FromQuery] int? PageSize,
            [FromQuery] int? PageNumber,
            [FromQuery] string? Search,
            [FromQuery] string? SortBy,
            [FromQuery] string? SortDirection
        )
        {
            var _currentUserId = _currentUser.UserId;
            var notifications = await _unitOfWork.NotificationRepository.GetByUserIdAsync(_currentUserId);

            // FIX: map notifications.Data, not notifications
            var notificationDtos = _mapper.Map<IEnumerable<NotificationDTO>>(notifications.Data);

            return Ok(new NotificationPagedResult
            {
                Data = notificationDtos,
                TotalNotifications = notifications.Data.Count(n => true),
                UnreadNotifications = notifications.Data.Count(n => !n.IsRead)
            });
        }
        // ...existing code...

        [HttpGet("user/{userId}/unread")]
        public async Task<ActionResult<IReadOnlyList<Notification>>> GetUserUnreadNotifications(string userId)
        {
            var notifications = await _unitOfWork.NotificationRepository.GetUnreadByUserIdAsync(userId);
            return Ok(notifications);
        }

        [HttpGet("user/{userId}/unread-count")]
        public async Task<ActionResult<int>> GetUserUnreadCount(string userId)
        {
            var count = await _unitOfWork.NotificationRepository.GetUnreadCountAsync(userId);
            return Ok(count);
        }

        [HttpPost]
        public async Task<ActionResult<Notification>> CreateNotification([FromBody] Notification notification)
        {
            if (notification == null)
                return BadRequest("Notification is required");

            if (string.IsNullOrEmpty(notification.UserId))
                return BadRequest("UserId is required");

            if (string.IsNullOrEmpty(notification.title))
                return BadRequest("Title is required");

            if (string.IsNullOrEmpty(notification.Message))
                return BadRequest("Message is required");

            var createdNotification = await _unitOfWork.NotificationRepository.AddAsync(notification);
            return CreatedAtAction(nameof(GetNotification), new { id = createdNotification.Id }, createdNotification);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<Notification>> UpdateNotification(int id, [FromBody] Notification notification)
        {
            if (id != notification.Id)
                return BadRequest("ID mismatch");

            var existingNotification = await _unitOfWork.NotificationRepository.GetByIdAsync(id);
            if (existingNotification == null)
                return NotFound();

            await _unitOfWork.NotificationRepository.UpdateAsync(notification);
            return Ok(notification);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteNotification(int id)
        {
            var notification = await _unitOfWork.NotificationRepository.GetByIdAsync(id);
            if (notification == null)
                return NotFound();

            await _unitOfWork.NotificationRepository.DeleteAsync(notification);
            return NoContent();
        }

        [HttpPatch("{id}/read")]
        public async Task<ActionResult> MarkAsRead(int id)
        {
            var notification = await _unitOfWork.NotificationRepository.GetByIdAsync(id);
            if (notification == null)
                return NotFound();

            await _unitOfWork.NotificationRepository.MarkAsReadAsync(id);
            return NoContent();
        }

        [HttpPatch("user/{userId}/read-all")]
        public async Task<ActionResult> MarkAllAsRead(string userId)
        {
            await _unitOfWork.NotificationRepository.MarkAllAsReadAsync(userId);
            return NoContent();
        }

        [HttpPost("info")]
        public async Task<ActionResult<Notification>> CreateInfoNotification([FromBody] CreateNotificationDto dto)
        {
            var notification = new Notification
            {
                UserId = dto.UserId,
                title = dto.Title,
                Message = dto.Message,
                Link = dto.Link,
                Type = Notification.NotificationType.Info,
                SenderId = dto.SenderId
            };

            var createdNotification = await _unitOfWork.NotificationRepository.AddAsync(notification);
            return CreatedAtAction(nameof(GetNotification), new { id = createdNotification.Id }, createdNotification);
        }

        [HttpPost("success")]
        public async Task<ActionResult<Notification>> CreateSuccessNotification([FromBody] CreateNotificationDto dto)
        {
            var notification = new Notification
            {
                UserId = dto.UserId,
                title = dto.Title,
                Message = dto.Message,
                Link = dto.Link,
                Type = Notification.NotificationType.Success,
                SenderId = dto.SenderId
            };

            var createdNotification = await _unitOfWork.NotificationRepository.AddAsync(notification);
            return CreatedAtAction(nameof(GetNotification), new { id = createdNotification.Id }, createdNotification);
        }

        [HttpPost("warning")]
        public async Task<ActionResult<Notification>> CreateWarningNotification([FromBody] CreateNotificationDto dto)
        {
            var notification = new Notification
            {
                UserId = dto.UserId,
                title = dto.Title,
                Message = dto.Message,
                Link = dto.Link,
                Type = Notification.NotificationType.Warning,
                SenderId = dto.SenderId
            };

            var createdNotification = await _unitOfWork.NotificationRepository.AddAsync(notification);
            return CreatedAtAction(nameof(GetNotification), new { id = createdNotification.Id }, createdNotification);
        }

        [HttpPost("error")]
        public async Task<ActionResult<Notification>> CreateErrorNotification([FromBody] CreateNotificationDto dto)
        {
            var notification = new Notification
            {
                UserId = dto.UserId,
                title = dto.Title,
                Message = dto.Message,
                Link = dto.Link,
                Type = Notification.NotificationType.Error,
                SenderId = dto.SenderId
            };

            var createdNotification = await _unitOfWork.NotificationRepository.AddAsync(notification);
            return CreatedAtAction(nameof(GetNotification), new { id = createdNotification.Id }, createdNotification);
        }
    }

    public class CreateNotificationDto
    {


        public string UserId { get; set; }
        public string Title { get; set; }
        public string Message { get; set; }
        public string? Link { get; set; }
        public string? SenderId { get; set; }
    }
}

