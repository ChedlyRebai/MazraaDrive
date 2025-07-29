using Api.Helper;
using AutoMapper;
using Core.DTO;
using Core.DTOs;
using Core.Entities;
using Core.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DepartmentController : BaseController
    {
        public DepartmentController(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork, mapper)
        {
        }

        [HttpGet("test")]
        public async Task<string> TestApi()
        {
            return "Department API is working!";
        }

        
        [HttpGet]
        public async Task<ActionResult<DepartmentPagedResult>> GetDepartments([FromQuery] DepartmentFilterDto filter)
        {
            try
            {
                var pagedDepartments = await _unitOfWork.DepartmentRepository.GetPageAsync(filter);
                var departmentDtos = _mapper.Map<IEnumerable<DepartmentDto>>(pagedDepartments.Data);

                // Apply user count filtering if specified (post-query filtering)
                if (filter.MinUserCount.HasValue || filter.MaxUserCount.HasValue)
                {
                    departmentDtos = departmentDtos.Where(d => 
                        (!filter.MinUserCount.HasValue || d.UserCount >= filter.MinUserCount) &&
                        (!filter.MaxUserCount.HasValue || d.UserCount <= filter.MaxUserCount)
                    );
                }

                var result = new DepartmentPagedResult
                {
                    Data = departmentDtos,
                    PageNumber = pagedDepartments.PageNumber,
                    PageSize = pagedDepartments.PageSize,
                    TotalRecords = pagedDepartments.TotalRecords,
                    TotalPages = pagedDepartments.TotalPages,
                    HasPreviousPage = pagedDepartments.HasPreviousPage,
                    HasNextPage = pagedDepartments.HasNextPage,
                    Search = pagedDepartments.Search,
                    SortBy = pagedDepartments.SortBy,
                    SortDirection = pagedDepartments.SortDirection,
                    TotalDepartments = departmentDtos.Count(),
                   
                };

                return Ok(new { success = true, data = result });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<DepartmentDto>> GetDepartment(int id)
        {
            try
            {
                var department = await _unitOfWork.DepartmentRepository.GetByIdAsync(id);
                if (department == null)
                    return NotFound(new { success = false, message = "Department not found" });

                var departmentDto = _mapper.Map<DepartmentDto>(department);
                return Ok(departmentDto);
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500 , ex.Message));
            }
        }

        [HttpGet("summary")]
        public async Task<ActionResult<IEnumerable<DepartmentUserCountDTO>>> GetDepartmentsSummary()
        {
            try
            {
                var departments = await _unitOfWork.DepartmentRepository.GetWithUserCountAsync();
                var summaryDtos = _mapper.Map<IEnumerable<DepartmentUserCountDTO>>(departments);
                return Ok(summaryDtos );
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500 , ex.Message));
            }
        }

        [HttpPost]
        public async Task<ActionResult<DepartmentDto>> CreateDepartment([FromBody] DepartmentCreateDTO createDepartmentDto)
        {
            try
            {
                if (createDepartmentDto == null)
                    return BadRequest(new { success = false, message = "Department data is required" });

                if (!ModelState.IsValid)
                    return BadRequest(new { success = false, message = "Invalid data", errors = ModelState });

                // Check if department with same name exists
                var existingDepartment = await _unitOfWork.DepartmentRepository.GetByNameAsync(createDepartmentDto.Name);
                if (existingDepartment != null)
                    return BadRequest(new { success = false, message = "Department with this name already exists" });

                var department = _mapper.Map<Department>(createDepartmentDto);
                var createdDepartment = await _unitOfWork.DepartmentRepository.AddAsync(department);
                await _unitOfWork.SaveChangesAsync();

                var departmentDto = _mapper.Map<DepartmentDto>(createdDepartment);
                return CreatedAtAction(nameof(GetDepartment), new { id = departmentDto.Id }, 
                    new { success = true, data = departmentDto });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<DepartmentDto>> UpdateDepartment(int id, [FromBody] DepartmentUpdateDTO updateDepartmentDto)
        {
            try
            {
                if (updateDepartmentDto == null)
                    return BadRequest(new { success = false, message = "Update data is required" });

                var existingDepartment = await _unitOfWork.DepartmentRepository.GetByIdAsync(id);
                if (existingDepartment == null)
                    return NotFound(new { success = false, message = "Department not found" });

                // Check if name is being changed and if new name already exists
                if (!string.IsNullOrEmpty(updateDepartmentDto.Name) && 
                    updateDepartmentDto.Name != existingDepartment.Name)
                {
                    var departmentWithSameName = await _unitOfWork.DepartmentRepository.GetByNameAsync(updateDepartmentDto.Name);
                    if (departmentWithSameName != null)
                        return BadRequest(new { success = false, message = "Department with this name already exists" });
                }

                _mapper.Map(updateDepartmentDto, existingDepartment);
                await _unitOfWork.DepartmentRepository.UpdateAsync(existingDepartment);
                await _unitOfWork.SaveChangesAsync();

                var departmentDto = _mapper.Map<DepartmentDto>(existingDepartment);
                return Ok(departmentDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = ex.Message });
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteDepartment(int id)
        {
            try
            {
                var department = await _unitOfWork.DepartmentRepository.GetByIdAsync(id);
                if (department == null)
                    return NotFound(new { success = false, message = "Department not found" });

                // Check if department has users
                if (department.Users?.Any() == true)
                    return BadRequest(new { success = false, message = "Cannot delete department that has users assigned" });

                await _unitOfWork.DepartmentRepository.DeleteAsync(id);
                await _unitOfWork.SaveChangesAsync();

                return Ok(new ResponseAPI(200, "Department deleted successfully"));
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpGet("{id}/users")]
        public async Task<ActionResult> GetDepartmentUsers(int id)
        {
            try
            {
                var department = await _unitOfWork.DepartmentRepository.GetByIdAsync(id);
                if (department == null)
                    return NotFound(new { success = false, message = "Department not found" });

                var users = department.Users?.Select(u => new {
                    u.Id,
                    u.UserName,
                    u.Email,
                    
                    u.IsActive
                }).ToList();

                return Ok(users);
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500 , ex.Message));
            }
        }

        [HttpGet("{id}/stats")]
        public async Task<ActionResult> GetDepartmentStats(int id)
        {
            try
            {
                var department = await _unitOfWork.DepartmentRepository.GetByIdAsync(id);
                if (department == null)
                    return NotFound(new { success = false, message = "Department not found" });

                var stats = new
                {
                    UserCount = department.Users?.Count ?? 0,
                    FolderCount = department.Folders?.Count ?? 0,
                    DocumentRequestCount = department.DocumentRequests?.Count ?? 0,
                    ActiveUsers = department.Users?.Count(u => u.IsActive) ?? 0
                };

                return Ok(stats);
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500 , ex.Message));
            }
        }
    }
}