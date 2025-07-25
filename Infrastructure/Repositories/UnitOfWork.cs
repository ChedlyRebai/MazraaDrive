using System;
using Core.Entities;
using Core.Interfaces;
using Core.Services;
using Infrastructure.Data;
using Infrastructure.Repositories.Service;
using Microsoft.AspNetCore.Identity;
using StackExchange.Redis;

namespace Infrastructure.Repositories;

public class UnitOfWork : IUnitOfWork
{
    private readonly AppDbContext _context;
    //private readonly IConnectionMultiplexer _redis;
    private readonly UserManager<AppUser> _userManager;
    private readonly IEmailService? _emailService;

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

    public IDocRequestRepository DocRequestRepository { get; }

    public IDocument DocumentRepository { get; }

    public IFolderRepository FolderRepository { get; }

    public IMessageRepository MessageRepository { get; }

    public IUserRepository UserRepository { get; }

    public IDepartmentRepository DepartmentRepository { get; }

    public IPermissionsRepository PermissionsRepository { get; }

    public IRoleRepository RoleRepository { get; }

    public IAuditLogRepository AuditLogRepository { get; }

    public UnitOfWork(
        AppDbContext context, 
        //IConnectionMultiplexer redis, 
        UserManager<AppUser> userManager, 
        SignInManager<AppUser> signInManager, 
        IEmailService? emailService = null, 
        IGenerateToken? token = null)
    {
        _context = context;
        //_redis = redis;
        _userManager = userManager;
       // _signInManager = signInManager;
        _emailService = emailService;
        // _token = token;
        
        // Initialize Auth with proper null checks
       // Auth = new AuthRepository(_userManager, _emailService, _signInManager, _token);
    }
}