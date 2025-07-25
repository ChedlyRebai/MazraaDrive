using Api.Helper;
using AutoMapper;
using Core.DTOs;
using Core.Entities;
using Core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{

    public class RoleController : BaseController
    {
        public RoleController(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork, mapper)
        {
        }


         [HttpGet]
        public async Task<ActionResult<IEnumerable<RoleDto>>> GetRoles()
        {
            try
            {
                var roles = await _unitOfWork.RoleRepository.GetAllAsync();
                var roleDtos = _mapper.Map<IEnumerable<RoleDto>>(roles);
                return Ok(roleDtos);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<RoleDto>> GetRole(int id)
        {
            try
            {
                var role = await _unitOfWork.RoleRepository.GetByIdAsync(id);
                if (role == null)
                    return NotFound(new { message = "Role not found" });

                var roleDto = _mapper.Map<RoleDto>(role);
                return Ok(roleDto);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpPost]
        public async Task<ActionResult<RoleDto>> CreateRole([FromBody] CreateRoleDto createRoleDto)
        {
            try
            {
                if (!ModelState.IsValid)
                    return BadRequest(ModelState);

                var role = _mapper.Map<Role>(createRoleDto);
                // var createdRole = await _unitOfWork.RoleRepository.AddAsync(role);
                // await _unitOfWork.SaveChangesAsync();

                // var roleDto = _mapper.Map<RoleDto>(createdRole);
                // return CreatedAtAction(nameof(GetRole), new { id = roleDto.Id }, roleDto);
                 await _unitOfWork.RoleRepository.AddAsync(role);
                return CreatedAtAction(nameof(GetRole), new { id = role.Id }, _mapper.Map<RoleDto>(role));
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<RoleDto>> UpdateRole(int id, [FromBody] UpdateRoleDto updateRoleDto)
        {
            try
            {
                var existingRole = await _unitOfWork.RoleRepository.GetByIdAsync(id);
                if (existingRole == null)
                    return NotFound(new { message = "Role not found" });

                _mapper.Map(updateRoleDto, existingRole);
                await _unitOfWork.RoleRepository.UpdateAsync(existingRole);
                // await _unitOfWork.SaveChangesAsync();

                var roleDto = _mapper.Map<RoleDto>(existingRole);
                return Ok(roleDto);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteRole(int id)
        {
            try
            {
                var role = await _unitOfWork.RoleRepository.GetByIdAsync(id);
                if (role == null)
                    return NotFound(new { message = "Role not found" });

                // await _unitOfWork.RoleRepository.DeleteAsync(role);
                // await _unitOfWork.SaveChangesAsync();

                return NoContent();
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

    }
}
