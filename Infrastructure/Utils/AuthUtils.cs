using System;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.AspNetCore.Http;

namespace Infrastructure.Utils;

// public static class AuthUtils
// {
//    public static string? GetCurrentUserId(HttpContext httpContext, string cookieName = "AuthToken")
//         {
//             if (httpContext.Request.Cookies.ContainsKey(cookieName))
//             {
//                 string token = httpContext.Request.Cookies[cookieName];

//                 var handler = new JwtSecurityTokenHandler();

//                 try
//                 {
//                     var jwtToken = handler.ReadJwtToken(token); // decode without validation
                    
//                     return userIdClaim?.Value;
//                 }
//                 catch
//                 {
//                     // invalid token
//                     return null;
//                 }
//             }

//             return null; // cookie not found
//         }

// }
// ...existing code...
// builder.Services.AddHttpContextAccessor();
// builder.Services.AddScoped<Core.Interfaces.ICurrentUserService, Infrastructure.Services.CurrentUserService>();
// // ...existing code...

// public class MyController : ControllerBase
// {
//     private readonly ICurrentUserService _currentUser;
//     public MyController(ICurrentUserService currentUser) => _currentUser = currentUser;

//     public IActionResult Get()
//     {
//         if (!_currentUser.IsAuthenticated) return Unauthorized();
//         var userId = _currentUser.UserId;
//         // use userId...
//         return Ok();
//     }
// }