using System.IdentityModel.Tokens.Jwt;
using System.Reflection.Metadata;
using Api.Helper;
using AutoMapper;
using Core.DTO;
using Core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AccountController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public AccountController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }
        [HttpPost("Register")]
        public async Task<IActionResult> Register(RegisterDTO registerDTO)
        {
            string result = await _unitOfWork.Auth.RegisterAsync(registerDTO);
            if (result != "done")
            {
                return BadRequest(new ResponseAPI(400, result));
            }
            else
            {
                return Ok(new ResponseAPI(200, "User registered successfully"));
            }

        }

        [HttpPost("login")]
        public async Task<IActionResult> Login(LoginDTO loginDTO)
        {

            if (loginDTO == null || string.IsNullOrEmpty(loginDTO.Email) || string.IsNullOrEmpty(loginDTO.Password))
            {
                return BadRequest(new ResponseAPI(400, "Email and Password are required"));
            }

            var result = await _unitOfWork.Auth.LoginAsync(loginDTO);
            if (result.StartsWith("please"))
            {
                return BadRequest(new ResponseAPI(400, result));
            }
            // Set cookie to be accessible on client-side (remove HttpOnly)
            Response.Cookies.Append("token", result, new CookieOptions
            {
                Secure = false,
                HttpOnly = false, // Allow client-side access
                Domain = "localhost",
                Expires = DateTimeOffset.UtcNow.AddDays(7),
                IsEssential = true,
                SameSite = SameSiteMode.Lax,
            });

            return Ok(new ResponseAPI(200, "Login successful"));
        }


        [HttpPost("logout")]
        public IActionResult Logout()
        {
            // Remove the cookie
            Response.Cookies.Delete("token");
            return Ok(new ResponseAPI(200, "Logout successful"));
        }

        [HttpPost("validate-token")]
        public IActionResult ValidateToken()
        {
            if (!Request.Cookies.TryGetValue("token", out var token))
            {
                return Unauthorized(new ResponseAPI(401, "Token is missing"));
            }

            var handler = new JwtSecurityTokenHandler();
            try
            {

                var jwtToken = handler.ReadJwtToken(token);
                if (jwtToken.ValidTo < DateTime.UtcNow)
                    return Unauthorized(new ResponseAPI(401, "Token is expired"));

                return Ok(new { valid = true });
            }
            catch (System.Exception)
            {

                return Unauthorized(new ResponseAPI(401, "Token is invalid"));
            }
        }

        // [HttpPost("validate-admin")]
        // public IActionResult ValidateAdmin()
        // {
        //     if (!Request.Cookies.TryGetValue("token", out var token))
        //     {
        //         return Unauthorized(new ResponseAPI(401, "Token is missing"));
        //     }

        //     var handler = new JwtSecurityTokenHandler();
        //     try
        //     {

        //         var jwtToken = handler.ReadJwtToken(token);
        //         if (jwtToken.ValidTo < DateTime.UtcNow)
        //             return Unauthorized(new ResponseAPI(401, "Token is expired"));

        //          // var roleClaim = jwtToken.Claims.FirstOrDefault(c => c.Type == "role" );
        //         var roleClaim = jwtToken.cl
        //         if (roleClaim == null || roleClaim.Value != "Admin")
        //         {
        //             return Unauthorized(new ResponseAPI(401, "User is not an admin"));
        //         }

        //         return Ok(new { valid = true });
        //     }
        //     catch (System.Exception)
        //     {

        //         return Unauthorized(new ResponseAPI(401, "Token is invalid"));
        //     }
        // }
        
    }
}