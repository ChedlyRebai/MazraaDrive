using Microsoft.AspNetCore.Http;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;

namespace Infrastructure.Utils
{
    public static class HttpContextExtensions
    {
        public static string? GetTokenFromCookies(this HttpContext ctx, string cookieName = "token")
            => ctx.Request.Cookies.TryGetValue(cookieName, out var t) ? t : null;

        public static string? GetUserIdFromCookieToken(this HttpContext ctx, string cookieName = "token")
        {
            var token = ctx.GetTokenFromCookies(cookieName);
            if (string.IsNullOrEmpty(token)) return null;
            var jwt = new JwtSecurityTokenHandler().ReadJwtToken(token);
            var claim = jwt.Claims.FirstOrDefault(c => c.Type == System.Security.Claims.ClaimTypes.NameIdentifier || c.Type == "id" || c.Type == "sub");
            return claim?.Value;
        }
    }
}