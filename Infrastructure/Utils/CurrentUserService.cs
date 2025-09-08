using System;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Core.Entities;
using Core.Interfaces;

using Infrastructure.Utils;
using System.Security.Claims;

namespace Infrastructure.Services
{
    public class CurrentUserService : ICurrentUserService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly TokenValidationParameters _tokenValidationParameters;
        private string? _userId;
        private string? _userName;
        private string? _departmentId;
        private string? _roleName;
        private string? _roleId;
         private List<string> _userRoles;
        private bool _initialized;

        public CurrentUserService(IHttpContextAccessor httpContextAccessor, IConfiguration configuration)
        {
            _httpContextAccessor = httpContextAccessor;
            // Build basic TokenValidationParameters from configuration (adjust as needed)
            var key = configuration["Token:secret"] ?? throw new ArgumentNullException("Token:Key not configured");
            _tokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(key)),
                ValidateIssuer = !string.IsNullOrEmpty(configuration["Token:Issuer"]),
                ValidIssuer = configuration["Token:Issuer"],
                ValidateAudience = !string.IsNullOrEmpty(configuration["Token:Audience"]),
                ValidAudience = configuration["Token:Audience"],
                ValidateLifetime = true,
                ClockSkew = TimeSpan.FromMinutes(2),
                RoleClaimType = ClaimTypes.Role
            };

             _userRoles = new List<string>();
        }

        private void EnsureInitialized()
        {
            if (_initialized) return;
            _initialized = true;

            var ctx = _httpContextAccessor.HttpContext;
            if (ctx == null) return;

            // read token from cookie named "token"
            if (!ctx.Request.Cookies.TryGetValue("token", out var token) || string.IsNullOrEmpty(token))
                return;

            try
            {
                var principal = JwtUtils.ValidateToken(token, _tokenValidationParameters);

                Console.WriteLine($"User IDxxxxxxxxxxxxxxxxxx: ", principal);
                Console.WriteLine($"User ID: {principal.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value}");
                Console.WriteLine("roleid", principal.FindFirst("RoleId")?.Value);
                Console.WriteLine("departmenid****************************************************************************", principal.FindFirst("DepartmentId")?.Value);
                _departmentId = principal.FindFirst("DepartmentId")?.Value;
                Console.WriteLine("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr", principal.FindFirst("role"));
                Console.WriteLine("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr", principal.FindFirst(ClaimTypes.Role)?.Value);

                Console.WriteLine("All Claims:");
                
                _userRoles = principal.Claims
                    .Where(c => c.Type == ClaimTypes.Role)
                    .Select(c => c.Value)
                    .ToList();
                _roleName=  principal.FindFirst("Role")?.Value;
                // Extract RoleId (custom claim)
                _roleId = principal.FindFirst("RoleId")?.Value;

                _userId = principal.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value
                          ?? principal.FindFirst("id")?.Value
                          ?? principal.FindFirst("sub")?.Value;
                _userName = principal.Identity?.Name ?? principal.FindFirst("unique_name")?.Value;
                // _departmentId=principal.Identity?.
            }
            catch (Exception ex)
            {
                Console.WriteLine("Token validation failed: " + ex.Message);
                // invalid token => no current user
                _roleId = null;
                _departmentId = null;
                _userId = null;
                _userName = null;
                _userRoles = new List<string>();
                _roleName = null;
            }
        }



        public string? UserId { get { EnsureInitialized(); return _userId; } }
        public string? UserName { get { EnsureInitialized(); return _userName; } }
        public bool IsAuthenticated { get { EnsureInitialized(); return !string.IsNullOrEmpty(_userId); } }
        public List<string> UserRoles { get { EnsureInitialized(); return _userRoles; } }
        public string? DepartmentId { get { EnsureInitialized(); return _departmentId; } }

        public string? RoleName { get { EnsureInitialized(); return _roleName; } }
        public string? RoleId { get { EnsureInitialized(); return _roleId; } }
        

        public bool IsInRole(string role)
        {
            EnsureInitialized();
            return _userRoles.Contains(role);
        }

        public bool IsInAnyRole(params string[] roles)
        {
            EnsureInitialized();
            return roles.Any(role => _userRoles.Contains(role));
        }

        public bool IsInAllRoles(params string[] roles)
        {
            EnsureInitialized();
            return roles.All(role => _userRoles.Contains(role));
        }
    }


}