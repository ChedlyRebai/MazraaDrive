using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;

namespace Infrastructure.Utils
{
    public static class JwtUtils
    {
        // Validate token and return ClaimsPrincipal (throws if invalid)
        public static ClaimsPrincipal ValidateToken(string token, TokenValidationParameters validationParameters)
        {
            var handler = new JwtSecurityTokenHandler();
            return handler.ValidateToken(token, validationParameters, out _);
        }

        // Try parse token without full validation to read claims (safe when already validated by middleware)
        public static JwtSecurityToken? ReadToken(string token)
        {
            var handler = new JwtSecurityTokenHandler();
            if (string.IsNullOrWhiteSpace(token)) return null;
            return handler.ReadJwtToken(token);
        }

        // Get a specific claim value (e.g. "sub" or custom "id") from a token without validation
        public static string? GetClaimFromToken(string token, string claimType = ClaimTypes.NameIdentifier)
        {
            var jwt = ReadToken(token);
            if (jwt == null) return null;
            var claim = jwt.Claims.FirstOrDefault(c => c.Type == claimType || c.Type == "id" || c.Type == "sub");
            return claim?.Value;
        }
    }
}