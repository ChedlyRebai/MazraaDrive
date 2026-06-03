using System;
using Core.Entities;
using Microsoft.AspNetCore.Identity;


namespace Core.Interfaces;

public interface IUnitOfWork
{
    public IDocRequestRepository DocRequestRepository { get; }
    public IDocument DocumentRepository { get; }
    public IHomeRepository HomeRepository { get; }
    public IAuth Auth { get; }
    public IAccessRequestRepository AccessRequestRepository { get; }
    public IFolderRepository FolderRepository { get; }
    public IMessageRepository MessageRepository { get; }
    public IUserRepository UserRepository { get; }
    public INotificationRepository NotificationRepository { get; }
    public IDepartmentRepository DepartmentRepository { get; }
    public IPermissionsRepository PermissionsRepository { get; }
    public IDocumentAccessService DocumentAccessService { get; }
    public UserManager<AppUser> UserManager { get; }
    public RoleManager<Role> RoleManager { get; }
    public IRoleRepository RoleRepository { get; }

    

    Task<int> SaveChangesAsync();

}
