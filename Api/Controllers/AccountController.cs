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
            var result = await _unitOfWork.Auth.LoginAsync(loginDTO);
            if (result.StartsWith("please"))
            {
                return BadRequest(new ResponseAPI(400, result));
            }
            // Set cookie to be accessible on client-side (remove HttpOnly)
            Response.Cookies.Append("token", result, new CookieOptions
            {
                Secure = true,
                HttpOnly = false, // Allow client-side access
                Domain = "localhost",
                Expires = DateTimeOffset.UtcNow.AddDays(7),
                IsEssential = true,
                SameSite = SameSiteMode.Strict,
            });

            return Ok(new ResponseAPI(200, "Login successful"));
        }







    }
}