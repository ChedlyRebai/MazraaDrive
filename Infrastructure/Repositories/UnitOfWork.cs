using System;
using Core.Entities;
using Core.Interfaces;
using Core.Services;
using Infrastructure.Data;
using Infrastructure.Repositories.Service;
using Microsoft.AspNetCore.Identity;

namespace Infrastructure.Repositories;

public class UnitOfWork : IUnitOfWork
{
    private readonly AppDbContext _context;
    //private readonly IConnectionMultiplexer _redis;
    private readonly UserManager<AppUser> _userManager;
    // private readonly IEmailService? _emailService;

    // private readonly IRoleRepository _roleRepository;
    // private readonly IUserRepository _userRepository;
    // private readonly IAuditLogRepository _auditLogRepository;
    // private readonly IMessageRepository _messageRepository;
    // private readonly IGenericRepository<AuditLog> _auditLogGenericRepository;
    // private readonly IDocument _documentRepository;
    // private readonly IFolderRepository _folderRepository;
    // private readonly SignInManager<AppUser> _signInManager;
    // private readonly IGenerateToken? _token;

    public IAuth Auth { get; }

    public IAccessRequestRepository AccessRequestRepository { get; }
    public IDocRequestRepository DocRequestRepository { get; }

    public IDocument DocumentRepository { get; }

    public IFolderRepository FolderRepository { get; }

    public IHomeRepository HomeRepository { get; }

    public IMessageRepository MessageRepository { get; }

    public ICurrentUserService CurrentUserService { get; }
    public IUserRepository UserRepository { get; }


    private readonly IGenerateToken token;
    public IDepartmentRepository DepartmentRepository { get; }

    public IPermissionsRepository PermissionsRepository { get; }

    public IRoleRepository RoleRepository { get; }
    private readonly RoleManager<Role> _roleManager;
    public IAuditLogRepository AuditLogRepository { get; }

    public UnitOfWork(
        RoleManager<Role> roleManager,
        IAuth auth,
        AppDbContext context,
        IDepartmentRepository departmentRepository,
        // IDocRequestRepository docRequestRepository,
        IFolderRepository folderRepository,
   
        IPermissionsRepository permissionsRepository,
        IRoleRepository roleRepository,
        IHomeRepository homeRepository,
        IAccessRequestRepository accessRequestRepository,
        IDocument documentRepository,
        IUserRepository userRepository,
        IDocRequestRepository docRequestRepository,
        IAuditLogRepository auditLogRepository,
        ICurrentUserService currentUserService,
        IGenerateToken token

        )
    {
        _roleManager = roleManager;
        _context = context;
        DocumentRepository = documentRepository ?? throw new ArgumentNullException(nameof(documentRepository));
        DepartmentRepository = departmentRepository ?? throw new ArgumentNullException(nameof(departmentRepository));
        FolderRepository = folderRepository ?? throw new ArgumentNullException(nameof(folderRepository));
        RoleRepository = roleRepository ?? throw new ArgumentNullException(nameof(roleRepository));
        UserRepository = userRepository ?? throw new ArgumentNullException(nameof(userRepository));
        PermissionsRepository = permissionsRepository ?? throw new ArgumentNullException(nameof(permissionsRepository));
        Auth = auth ?? throw new ArgumentNullException(nameof(auth));
        HomeRepository = homeRepository ?? throw new ArgumentNullException(nameof(homeRepository));
        DocRequestRepository = docRequestRepository ?? throw new ArgumentNullException(nameof(docRequestRepository));
        AccessRequestRepository = accessRequestRepository ?? throw new ArgumentNullException(nameof(accessRequestRepository));
        AuditLogRepository = auditLogRepository ?? throw new ArgumentNullException(nameof(auditLogRepository));
        this.token = token;
        CurrentUserService = currentUserService ?? throw new ArgumentNullException(nameof(currentUserService));
    }

    public async Task<int> SaveChangesAsync()
    {
        try
        {
            return await _context.SaveChangesAsync();
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error saving changes: {ex.Message}");
            throw;
        }
    }
}