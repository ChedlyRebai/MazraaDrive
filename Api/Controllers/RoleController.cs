// Update: Api/Controllers/RoleController.cs
using Api.Helper;
using AutoMapper;
using Core.DTOs;
using Core.Entities;
using Core.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace Api.Controllers
{
    public class RoleController : BaseController
    {

        private readonly RoleManager<Role> roleManager;
        public RoleController(ICurrentUserService currentUser, IUnitOfWork unitOfWork, IMapper mapper, ILogger<RoleController> logger, RoleManager<Role> roleManager)
            : base(currentUser, unitOfWork, mapper, logger)
        {
            this.roleManager = roleManager;
        }


        [HttpGet("test")]
        [Authorize(Policy = "requireManagerRole")]
        public async Task<string> TestApi()
        {
            _logger.LogInformation("Testing API endpoint");

            return "CHEDLY - API is working!";
        }

        [HttpGet]
        public async Task<ActionResult<RolePagedResult>> GetRoles([FromQuery] RoleFilterDto filter)
        {
            try
            {
                var pagedRoles = await _unitOfWork.RoleRepository.GetPagedAsync(filter, new Core.DTO.PaginationParams
                {
                    PageNumber = filter.PageNumber,
                    PageSize = filter.PageSize,
                    Search = filter.Search,
                    SortBy = filter.SortBy,
                    SortDirection = filter.SortDirection
                });
                var roleDtos = _mapper.Map<IEnumerable<RoleDto>>(pagedRoles.Data);

                var result = new RolePagedResult
                {
                    Data = roleDtos,
                    PageNumber = pagedRoles.PageNumber,
                    PageSize = pagedRoles.PageSize,
                    TotalRecords = pagedRoles.TotalRecords,
                    TotalPages = pagedRoles.TotalPages,
                    HasPreviousPage = pagedRoles.HasPreviousPage,
                    HasNextPage = pagedRoles.HasNextPage,
                    Search = pagedRoles.Search,
                    SortBy = pagedRoles.SortBy,
                    SortDirection = pagedRoles.SortDirection,
                    TotalRoles = roleDtos.Count(),
                    ActiveRoles = roleDtos.Count(r => r.IsActive),
                    InactiveRoles = roleDtos.Count(r => !r.IsActive)
                };
                _logger.LogInformation("Retrieved paged list of roles");
                //await _auditLogger.LogAsync("GetRoles", "Retrieved paged list of roles", "10", "Role");
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving paged list of roles");
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<RoleDto>> GetRole(string id)
        {
            try
            {
                var role = await _unitOfWork.RoleRepository.GetByIdAsync(id);
                if (role == null)
                    return NotFound(new ResponseAPI(404, "Role not found"));

                var roleDto = _mapper.Map<RoleDto>(role);

                //await _auditLogger.LogAsync("GetRole", "Retrieved role details", "10", "Role");
                _logger.LogInformation("Retrieved role details for role {RoleId}", id);
                return Ok(roleDto);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving role details for role {RoleId}", id);
                return BadRequest(new ResponseAPI(500, ex.Message));
            }
        }

        [HttpPost]
        public async Task<ActionResult<RoleDto>> CreateRole([FromBody] CreateRoleDto createRoleDto)
        {
            try
            {
                // Validation
                if (createRoleDto == null)
                    return BadRequest(new ResponseAPI(400, "Role data is required"));

                if (!ModelState.IsValid)
                    return BadRequest(new ResponseAPI(400, "Invalid data"));

                // Map DTO to entity
                var role = _mapper.Map<Role>(createRoleDto);

                // Add to repository and get the created entity with ID
                var createdRole = await _unitOfWork.RoleRepository.AddAsync(role);

                // IMPORTANT: Save changes to get the generated ID
                await _unitOfWork.SaveChangesAsync();

                // Map back to DTO
                var roleDto = _mapper.Map<RoleDto>(createdRole);

                //await _auditLogger.LogAsync("CreateRole", "Created new role", "10", "Role");
                _logger.LogInformation("Created new role with ID {RoleId}", roleDto.id);
                return CreatedAtAction(nameof(GetRole), new { id = roleDto.id },
                    new { success = true, data = roleDto });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error creating new role");
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<RoleDto>> UpdateRole(string id, [FromBody] UpdateRoleDto updateRoleDto)
        {
            try
            {
                // Validation
                if (updateRoleDto == null)
                    return BadRequest(new ResponseAPI(400, "Role data is required"));

                var existingRole = await _unitOfWork.RoleRepository.GetByIdAsync(id);
                if (existingRole == null)
                    return NotFound(new ResponseAPI(404, "Role not found"));

                // Map updates to existing entity
                _mapper.Map(updateRoleDto, existingRole);
                //    existingRole.UpdatedAt = DateTime.UtcNow;

                // Update in repository
                await _unitOfWork.RoleRepository.UpdateAsync(existingRole);

                // IMPORTANT: Save changes
                await _unitOfWork.SaveChangesAsync();

                var roleDto = _mapper.Map<RoleDto>(existingRole);
                _logger.LogInformation("Updated role with ID {RoleId}", id);
                //await _auditLogger.LogAsync("UpdateRole", "Updated role details", "10", "Role");
                return Ok(roleDto);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error updating role with ID {RoleId}", id);
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteRole(string id)
        {
            try
            {
                var role = await _unitOfWork.RoleRepository.GetByIdAsync(id);
                if (role == null)
                    return NotFound(new { success = false, message = "Role not found" });

                // Delete from repository
                await _unitOfWork.RoleRepository.DeleteAsync(id);

                // IMPORTANT: Save changes
                await _unitOfWork.SaveChangesAsync();

                //await _auditLogger.LogAsync("DeleteRole", "Deleted role", "10", "Role");
                _logger.LogInformation("Deleted role with ID {RoleId}", id);
                return Ok(new ResponseAPI(200, "Role deleted successfully"));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error deleting role with ID {RoleId}", id);
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpGet("search/{searchTerm}")]
        public async Task<IActionResult> SearchRoles(string searchTerm)
        {
            try
            {
                // if (string.IsNullOrWhiteSpace(searchTerm))
                //     return BadRequest(new ResponseAPI(400, "Search term is required"));

                var roles = await _unitOfWork.RoleRepository.SearchAsync(searchTerm);
                var roleDtos = _mapper.Map<IEnumerable<RoleDto>>(roles);
                _logger.LogInformation("Searched roles with term {SearchTerm}", searchTerm);
                //await _auditLogger.LogAsync("SearchRoles", "Searched roles", "10
                return Ok(roleDtos);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error searching roles with term {SearchTerm}", searchTerm);
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

    }
}