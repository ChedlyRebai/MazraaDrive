using System;
using Core.Interfaces;
using Core.Services;
using Infrastructure.Data;

using Serilog;

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Core.Entities;
using Microsoft.AspNetCore.Identity;

using Microsoft.Extensions.FileProviders;
using Infrastructure.Services;
using Infrastructure.Repositories;
using Infrastructure.Repositories.Service; // Add this for ApiVersioning


namespace Infrastructure;

public static class InfrastructureRegistration
{
    public static IServiceCollection infrastructureRegistration(this IServiceCollection services, IConfiguration configuration)
    {
        
        // Database context
        services.AddDbContext<AppDbContext>(options =>
        {
            options.UseNpgsql(configuration.GetConnectionString("DefaultConnection"));
        });

        // Identity configuration - UNCOMMENTED AND FIXED
        // services.AddIdentity<AppUser, IdentityRole<int>>(options =>
        // {
        //     // Password settings
        //     options.Password.RequireDigit = true;
        //     options.Password.RequireLowercase = true;
        //     options.Password.RequireNonAlphanumeric = false;
        //     options.Password.RequireUppercase = true;
        //     options.Password.RequiredLength = 6;
        //     options.Password.RequiredUniqueChars = 1;

        //     // Lockout settings
        //     options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(5);
        //     options.Lockout.MaxFailedAccessAttempts = 5;
        //     options.Lockout.AllowedForNewUsers = true;

        //     // User settings
        //     options.User.AllowedUserNameCharacters =
        //         "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._@+";
        //     options.User.RequireUniqueEmail = true;
        // })
        // .AddEntityFrameworkStores<AppDbContext>()
        // .AddDefaultTokenProviders();

        // Register repositories and services
        // services.AddScoped<IAuditLogRepository, AuditLogRepository>();

        services.AddScoped<IRoleRepository, RoleRepository>();
        services.AddScoped<IDepartmentRepository, DepartmentRepository>();
        services.AddScoped<IDocRequestRepository, DocRequestRepository>();
        services.AddScoped<IDocument, DocumentRepository>();
        services.AddScoped<IFolderRepository, FolderRepository>();
        services.AddScoped<IMessageRepository, MessageRepository>();
        services.AddScoped<IUserRepository, UserRepository>();
        //services.AddScoped<ICurrentUserService, CurrentUserService>();
        //services.AddScoped<IAuditLogger, AuditLogger>();
        services.AddHttpContextAccessor();
        services.AddScoped<ICurrentUserService, CurrentUserService>();
        services.AddScoped<IAccessRequestRepository, AccessRequestRepository>();
        services.AddScoped<IPermissionsRepository, PermissionsRepository>();
        services.AddScoped<IAuditLogRepository, AuditLogRepository>();
        services.AddScoped<IGenerateToken, GenerateToken>();
        services.AddScoped<IAuth, AuthRepository>();
        services.AddScoped<IHomeRepository, HomeRepository>();
        services.AddMemoryCache();
        services.AddScoped<IDocumentAccessService, DocumentAccessService>();
        services.AddScoped<IAccessRightService, AccessRightService>();
        services.AddSingleton<IFileProvider>(provider =>
    new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory(), "uploads")));
        services.AddApiVersioning(options =>
        {
            options.AssumeDefaultVersionWhenUnspecified = true;
            options.DefaultApiVersion = new Microsoft.AspNetCore.Mvc.ApiVersion(1, 0);
            options.ReportApiVersions = true;
        });
        // services.AddScoped<IEmailService, EmailService>();

        // Register UnitOfWork
        services.AddScoped<IUnitOfWork, UnitOfWork>();

        // Configure Identity cookie
        /* services.ConfigureApplicationCookie(options =>
         {
             options.Cookie.Name = "token";
             options.LoginPath = "/api/auth/login";
             options.LogoutPath = "/api/auth/logout";
             options.AccessDeniedPath = "/api/auth/access-denied";
             options.ExpireTimeSpan = TimeSpan.FromDays(30);
             options.SlidingExpiration = true;
             options.Events.OnRedirectToLogin = context =>
             {
                 context.Response.StatusCode = 401;
                 return Task.CompletedTask;
             };
             options.Events.OnRedirectToAccessDenied = context =>
             {
                 context.Response.StatusCode = 403;
                 return Task.CompletedTask;
             };
         });*/

        // JWT Bearer authentication
        // var tokenSecret = configuration["Token:Secret"];
        // if (string.IsNullOrEmpty(tokenSecret))
        // {
        //     throw new InvalidOperationException("Token:Secret configuration is missing or empty");
        // }

        // services.AddAuthentication(options =>
        // {
        //     options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
        //     options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
        // })
        // .AddJwtBearer(options =>
        // {
        //     options.RequireHttpsMetadata = false;
        //     options.SaveToken = true;
        //     options.TokenValidationParameters = new TokenValidationParameters
        //     {
        //         ValidateIssuerSigningKey = true,
        //         IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(tokenSecret)),
        //         ValidateIssuer = false,
        //         ValidateAudience = false,
        //         ClockSkew = TimeSpan.Zero,
        //         ValidateLifetime = true
        //     };
        //     options.Events = new JwtBearerEvents
        //     {
        //         OnMessageReceived = context =>
        //         {
        //             // Check for token in cookie
        //             context.Token = context.Request.Cookies["token"];
        //             return Task.CompletedTask;
        //         },
        //         OnAuthenticationFailed = context =>
        //         {
        //             Console.WriteLine($"Authentication failed: {context.Exception.Message}");
        //             return Task.CompletedTask;
        //         }
        //     };
        // });

        // Authorization policies
        // services.AddAuthorization(options =>
        // {
        //     options.AddPolicy("RequireAdmin", policy =>
        //         policy.RequireRole("Admin"));

        //     options.AddPolicy("RequireManager", policy =>
        //         policy.RequireRole("Admin", "Manager"));

        //     options.AddPolicy("RequireUser", policy =>
        //         policy.RequireAuthenticatedUser());
        // });

        // services.AddIdentity<AppUser, IdentityRole>()
        //  .AddEntityFrameworkStores<AppDbContext>()
        //  .AddDefaultTokenProviders();

        // Configure Identity cookie
        services.ConfigureApplicationCookie(options =>
        {
            options.Cookie.Name = "token";
            options.Events.OnRedirectToLogin = context =>
            {
                context.Response.StatusCode = 401;
                return Task.CompletedTask;
            };
        });

        // JWT Bearer authentication
        services.AddAuthentication()
            .AddJwtBearer(options =>
            {
                options.RequireHttpsMetadata = false;
                options.SaveToken = true;
                options.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new Microsoft.IdentityModel.Tokens.SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(configuration["Token:Secret"])),
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    ClockSkew = TimeSpan.Zero
                };
                options.Events = new Microsoft.AspNetCore.Authentication.JwtBearer.JwtBearerEvents
                {
                    OnMessageReceived = context =>
                    {
                        context.Token = context.Request.Cookies["token"];
                        return Task.CompletedTask;
                    }
                };
            });

        return services;
    }
}