using Api.Helper;
using AutoMapper;
using Core.DTOs;
using Core.Entities;
using Core.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    //[Authorize]
    public class UserController : BaseController
    {
        private readonly UserManager<AppUser> _userManager;

        public UserController(IUnitOfWork unitOfWork, IMapper mapper, UserManager<AppUser> userManager)
            : base(unitOfWork, mapper)
        {
            _userManager = userManager;
        }

        [HttpGet("test")]
        public string TestApi()
        {
            return "User API is working!";
        }

        

        [HttpGet]
        public async Task<ActionResult<UserPagedResult>> GetUsers([FromQuery] UserFilterDto filter)
        {
            try
            {
                var pagedUsers = await _unitOfWork.UserRepository.GetPagedAsync(filter);
                var userDtos = _mapper.Map<IEnumerable<UserDto>>(pagedUsers.Data);

                var result = new UserPagedResult
                {
                    Data = userDtos,
                    PageNumber = pagedUsers.PageNumber,
                    PageSize = pagedUsers.PageSize,
                    TotalRecords = pagedUsers.TotalRecords,
                    TotalPages = pagedUsers.TotalPages,
                    HasPreviousPage = pagedUsers.HasPreviousPage,
                    HasNextPage = pagedUsers.HasNextPage,
                    Search = pagedUsers.Search,
                    SortBy = pagedUsers.SortBy,
                    SortDirection = pagedUsers.SortDirection,
                    TotalUsers = await _unitOfWork.UserRepository.GetTotalCountAsync(),
                    ActiveUsers = await _unitOfWork.UserRepository.GetActiveCountAsync(),
                    InactiveUsers = await _unitOfWork.UserRepository.GetInactiveCountAsync(),
                    ConfirmedEmails = await _unitOfWork.UserRepository.GetConfirmedEmailsCountAsync(),


                };

                return Ok(new { success = true, data = result });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<UserDto>> GetUser(string id)
        {
            try
            {
                // var currentUserId = GetCurrentUserId();
                //var currentUserRoles = await _userManager.GetRolesAsync(await _userManager.FindByIdAsync(currentUserId));

                // Users can only view their own profile unless they're Admin/Manager
                /*if (id.ToString() != currentUserId && !currentUserRoles.Any(r => r == "Admin" || r == "Manager"))
                {
                    return Forbid();
                }*/

                var user = await _unitOfWork.UserRepository.GetByIdWithDetailsAsync(id);
                if (user == null)
                    return NotFound(new ResponseAPI(404, "User not found"));

                var userDto = _mapper.Map<UserDto>(user);
                return Ok(userDto);
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500, ex.Message));
            }
        }

        [HttpGet("profile")]
        public async Task<ActionResult<UserDto>> GetCurrentUserProfile()
        {
            try
            {
                var currentUserId = "10";
                var user = await _unitOfWork.UserRepository.GetByIdAsync(currentUserId);

                if (user == null)
                    return NotFound(new { success = false, message = "User not found" });

                var userDto = _mapper.Map<UserDto>(user);
                return Ok(new { success = true, data = userDto });
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500, ex.Message));
            }
        }

        [HttpPost]
        // [Authorize(Roles = "Admin")]
        public async Task<ActionResult<UserDto>> CreateUser([FromBody] CreateUserDto createUserDto)
        {
            try
            {
                if (createUserDto == null)
                    return BadRequest(new { success = false, message = "User data is required" });

                if (!ModelState.IsValid)
                    return BadRequest(new { success = false, message = "Invalid data", errors = ModelState });

                // Check if email is already taken

                // Check if username is already taken
                if (await _unitOfWork.UserRepository.IsUserNameTakenAsync(createUserDto.UserName))
                    return BadRequest(new { success = false, message = "Username is already taken" });

                // Check if department exists
                var department = await _unitOfWork.DepartmentRepository.GetByIdAsync(createUserDto.DepartmentId);
                if (department == null)
                    return BadRequest(new { success = false, message = "Department not found" });

                var user = _mapper.Map<AppUser>(createUserDto);

                var result = await _userManager.CreateAsync(user, createUserDto.Password);
                if (!result.Succeeded)
                {
                    return BadRequest(new { success = false, message = "Failed to create user", errors = result.Errors });
                }

                await _unitOfWork.SaveChangesAsync();

                var userDto = _mapper.Map<UserDto>(user);
                return CreatedAtAction(nameof(GetUser), new { id = userDto.Id },
                    new { success = true, data = userDto });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<UserDto>> UpdateUser(string id, [FromBody] UpdateUserDto updateUserDto)
        {
            try
            {
                var currentUserId = GetCurrentUserId();
                var currentUserRoles = await _userManager.GetRolesAsync(await _userManager.FindByIdAsync(currentUserId));

                // Users can only update their own profile unless they're Admin
                if (id.ToString() != currentUserId && !currentUserRoles.Contains("Admin"))
                {
                    return Forbid();
                }

                if (updateUserDto == null)
                    return BadRequest(new { success = false, message = "Update data is required" });

                var existingUser = await _unitOfWork.UserRepository.GetByIdAsync(id);
                if (existingUser == null)
                    return NotFound(new { success = false, message = "User not found" });

                _mapper.Map(updateUserDto, existingUser);
                await _unitOfWork.UserRepository.UpdateAsync(existingUser);
                await _unitOfWork.SaveChangesAsync();

                var userDto = _mapper.Map<UserDto>(existingUser);
                return Ok(userDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpDelete("{id}")]
        // [Authorize(Roles = "Admin")]
        public async Task<ActionResult> DeleteUser(string id)
        {
            try
            {
                var user = await _unitOfWork.UserRepository.GetByIdAsync(id);
                if (user == null)
                    return NotFound(new { success = false, message = "User not found" });

                await _unitOfWork.UserRepository.DeleteAsync(id);
                await _unitOfWork.SaveChangesAsync();

                return Ok(new { success = true, message = "User deleted successfully" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpPost("{id}/deactivate")]
        // [Authorize(Roles = "Admin")]
        public async Task<ActionResult> DeactivateUser(string id)
        {
            try
            {
                await _unitOfWork.UserRepository.DeactivateUserAsync(id);
                await _unitOfWork.SaveChangesAsync();

                return Ok(new { success = true, message = "User deactivated successfully" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpPost("{id}/activate")]
        // [Authorize(Roles = "Admin")]
        public async Task<ActionResult> ActivateUser(string id)
        {
            try
            {
                await _unitOfWork.UserRepository.ActivateUserAsync(id);
                await _unitOfWork.SaveChangesAsync();

                return Ok(new { success = true, message = "User activated successfully" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpPost("change-password")]
        public async Task<ActionResult> ChangePassword([FromBody] ChangePasswordDto changePasswordDto)
        {
            try
            {
                if (!ModelState.IsValid)
                    return BadRequest(new { success = false, message = "Invalid data", errors = ModelState });

                var currentUserId = GetCurrentUserId();
                var user = await _userManager.FindByIdAsync(currentUserId);

                if (user == null)
                    return NotFound(new { success = false, message = "User not found" });

                var result = await _userManager.ChangePasswordAsync(user,
                    changePasswordDto.CurrentPassword, changePasswordDto.NewPassword);

                if (!result.Succeeded)
                {
                    return BadRequest(new { success = false, message = "Failed to change password", errors = result.Errors });
                }

                return Ok(new { success = true, message = "Password changed successfully" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpGet("department/{departmentId}")]
        // [Authorize(Roles = "Admin,Manager")]
        public async Task<ActionResult<IEnumerable<UserDto>>> GetUsersByDepartment(int departmentId)
        {
            try
            {
                var users = await _unitOfWork.UserRepository.GetByDepartmentAsync(departmentId);
                var userDtos = _mapper.Map<IEnumerable<UserDto>>(users);
                return Ok(new { success = true, data = userDtos });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("search")]
        // [Authorize(Roles = "Admin,Manager")]
        public async Task<ActionResult<IEnumerable<UserDto>>> SearchUsers([FromQuery] string searchTerm)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(searchTerm))
                    return BadRequest(new { success = false, message = "Search term is required" });

                var users = await _unitOfWork.UserRepository.SearchUsersAsync(searchTerm);
                var userDtos = _mapper.Map<IEnumerable<UserDto>>(users);
                return Ok(new { success = true, data = userDtos });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("stats")]
        // [Authorize(Roles = "Admin")]
        public async Task<ActionResult> GetUserStats()
        {
            try
            {
                var totalUsers = await _unitOfWork.UserRepository.GetUserCountAsync();
                var activeUsers = await _unitOfWork.UserRepository.GetActiveUserCountAsync();
                var inactiveUsers = totalUsers - activeUsers;

                return Ok(new
                {
                    success = true,
                    data = new
                    {
                        totalUsers,
                        activeUsers,
                        inactiveUsers
                    }
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        private string GetCurrentUserId()
        {
            return User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "0";
        }
        [HttpGet("{id}/details")]
        public async Task<ActionResult<UserWithDetailsDto>> GetUserWithDetails(string id)
        {
            try
            {
                // Authorization check
                var currentUserId = "10";
                /* if (id != currentUserId && !User.IsInRole("Admin") && !User.IsInRole("Manager"))
                 {
                     return Forbid();
                 }*/

                var user = await _unitOfWork.UserRepository.GetByIdWithDetailsAsync(id);
                Console.WriteLine("***********************************************");
                Console.WriteLine($"User ID: {id}, User: {user?.UserName}");
                Console.WriteLine(user?.CreatedFolders?.Count);
                
                foreach (var item in user?.CreatedFolders)
                {
                    Console.WriteLine(item.Name);
                }

                if (user == null)
                    return NotFound(new { success = false, message = "User not found" });

                var userWithDetailsDto = _mapper.Map<UserWithDetailsDto>(user);

                // userWithDetailsDto.RecentDocuments = user?.UploadedDocuments;

                return Ok(new { success = true, data = userWithDetailsDto });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        /*[HttpPost("{id}/lock")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult> LockUser(string id, [FromBody] LockUserDto lockDto)
        {
            try
            {
                if (!ModelState.IsValid)
                    return BadRequest(new { success = false, message = "Invalid data", errors = ModelState });

                var success = await _unitOfWork.UserRepository.LockUserAsync(id, lockDto.LockoutEnd);
                if (!success)
                    return NotFound(new { success = false, message = "User not found" });

                await _unitOfWork.SaveChangesAsync();
                return Ok(new { success = true, message = "User locked successfully" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = ex.Message });
            }
        }

        [HttpPost("{id}/unlock")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult> UnlockUser(string id)
        {
            try
            {
                var success = await _unitOfWork.UserRepository.UnlockUserAsync(id);
                if (!success)
                    return NotFound(new { success = false, message = "User not found" });

                await _unitOfWork.SaveChangesAsync();
                return Ok(new { success = true, message = "User unlocked successfully" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = ex.Message });
            }
        }*/
    }
}