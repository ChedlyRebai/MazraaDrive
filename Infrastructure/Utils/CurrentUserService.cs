using System;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Core.Entities;
using Core.Interfaces;
using Core.Interfaces;
using Infrastructure.Utils;

namespace Infrastructure.Services
{
    public class CurrentUserService : ICurrentUserService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly TokenValidationParameters _tokenValidationParameters;
        private string? _userId;
        private string? _userName;
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
                ClockSkew = TimeSpan.FromMinutes(2)
            };
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

                Console.WriteLine($"User ID: ",principal);
                Console.WriteLine($"User ID: {principal.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value}");
                _userId = principal.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value
                          ?? principal.FindFirst("id")?.Value
                          ?? principal.FindFirst("sub")?.Value;
                _userName = principal.Identity?.Name ?? principal.FindFirst("name")?.Value;
            }
            catch
            {
                // invalid token => no current user
                _userId = null;
                _userName = null;
            }
        }

        public string? UserId { get { EnsureInitialized(); return _userId; } }
        public string? UserName { get { EnsureInitialized(); return _userName; } }
        public bool IsAuthenticated { get { EnsureInitialized(); return !string.IsNullOrEmpty(_userId); } }
    }


}