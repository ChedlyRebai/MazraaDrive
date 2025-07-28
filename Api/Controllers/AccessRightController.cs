using Api.Helper;
using AutoMapper;
using Core.DTOs;
using Core.Entities;
using Core.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AccessRightController : BaseController
    {
        public AccessRightController(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork, mapper)
        {
        }

        [HttpGet("test")]
        public string TestApi()
        {
            return "AccessRight API is working!";
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<AccessRightDto>>> GetAccessRights()
        {
            try
            {
                var accessRights = await _unitOfWork.PermissionsRepository.GetAllAsync();
                var accessRightDtos = _mapper.Map<IEnumerable<AccessRightDto>>(accessRights);
                return Ok(new { success = true, data = accessRightDtos });
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(400, ex.Message));
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<AccessRightDto>> GetAccessRight(int id)
        {
            try
            {
                var accessRight = await _unitOfWork.PermissionsRepository.GetByIdAsync(id);
                if (accessRight == null)
                    return NotFound(new ResponseAPI(404, "Access right not found"));

                var accessRightDto = _mapper.Map<AccessRightDto>(accessRight);
                return Ok(new { success = true, data = accessRightDto });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("user/{userId}")]
        public async Task<ActionResult<IEnumerable<AccessRightDto>>> GetUserAccessRights(string userId)
        {
            try
            {
                var accessRights = await _unitOfWork.PermissionsRepository.GetByUserAsync(userId);
                var accessRightDtos = _mapper.Map<IEnumerable<AccessRightDto>>(accessRights);
                return Ok(new ResponseAPI(200, "Access rights retrieved successfully"));
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(400, ex.Message));
            }
        }

        [HttpGet("document/{documentId}")]
        public async Task<ActionResult<IEnumerable<AccessRightDto>>> GetDocumentAccessRights(int documentId)
        {
            try
            {
                var accessRights = await _unitOfWork.PermissionsRepository.GetByDocumentAsync(documentId);
                var accessRightDtos = _mapper.Map<IEnumerable<AccessRightDto>>(accessRights);
                return Ok(new ResponseAPI(200, "Access rights retrieved successfully"));
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(400, ex.Message));
            }
        }

        [HttpGet("folder/{folderId}")]
        public async Task<ActionResult<IEnumerable<AccessRightDto>>> GetFolderAccessRights(int folderId)
        {
            try
            {
                var accessRights = await _unitOfWork.PermissionsRepository.GetByFolderAsync(folderId);
                var accessRightDtos = _mapper.Map<IEnumerable<AccessRightDto>>(accessRights);
                return Ok(new { success = true, data = accessRightDtos });
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(400, ex.Message));
            }
        }

        [HttpPost]
        // public async Task<ActionResult<AccessRightDto>> CreateAccessRight([FromBody] CreateAccessRightDto createAccessRightDto)
        // {
        //     try
        //     {
        //         if (createAccessRightDto == null)
        //             return BadRequest(new { success = false, message = "Access right data is required" });

        //         if (!ModelState.IsValid)
        //             return BadRequest(new { success = false, message = "Invalid data", errors = ModelState });

        //         if (!createAccessRightDto.IsValid)
        //             return BadRequest(new { success = false, message = "Either DocumentId or FolderId must be provided, but not both" });

        //         // Check if user exists
        //         var user = await _unitOfWork.UserRepository.;
        //         if (user == null)
        //             return BadRequest(new { success = false, message = "User not found" });

        //         // Check if document/folder exists
        //         if (createAccessRightDto.DocumentId.HasValue)
        //         {
        //             var document = await _unitOfWork.DocumentRepository.GetByIdAsync(createAccessRightDto.DocumentId.Value);
        //             if (document == null)
        //                 return BadRequest(new { success = false, message = "Document not found" });
        //         }

        //         if (createAccessRightDto.FolderId.HasValue)
        //         {
        //             var folder = await _unitOfWork.FolderRepository.GetByIdAsync(createAccessRightDto.FolderId.Value);
        //             if (folder == null)
        //                 return BadRequest(new { success = false, message = "Folder not found" });
        //         }

        //         // Check if access right already exists
        //         AccessRight? existingAccess = null;
        //         if (createAccessRightDto.DocumentId.HasValue)
        //         {
        //             existingAccess = await _unitOfWork.PermissionsRepository.GetUserDocumentAccessAsync(
        //                 createAccessRightDto.UserId, createAccessRightDto.DocumentId.Value);
        //         }
        //         else if (createAccessRightDto.FolderId.HasValue)
        //         {
        //             existingAccess = await _unitOfWork.PermissionsRepository.GetUserFolderAccessAsync(
        //                 createAccessRightDto.UserId, createAccessRightDto.FolderId.Value);
        //         }

        //         if (existingAccess != null)
        //             return BadRequest(new { success = false, message = "Access right already exists for this user and resource" });

        //         var accessRight = _mapper.Map<AccessRight>(createAccessRightDto);
        //         var createdAccessRight = await _unitOfWork.PermissionsRepository.AddAsync(accessRight);
        //         await _unitOfWork.SaveChangesAsync();

        //         var accessRightDto = _mapper.Map<AccessRightDto>(createdAccessRight);
        //         return CreatedAtAction(nameof(GetAccessRight), new { id = accessRightDto.Id }, 
        //             new { success = true, data = accessRightDto });
        //     }
        //     catch (Exception ex)
        //     {
        //         return StatusCode(500, new { success = false, message = ex.Message });
        //     }
        // }

        [HttpPost("bulk")]
        public async Task<ActionResult> CreateBulkAccessRights([FromBody] BulkAccessRightDto bulkDto)
        {
            try
            {
                if (bulkDto == null || !bulkDto.UserIds.Any())
                    return BadRequest(new { success = false, message = "User IDs are required" });

                var accessRights = new List<AccessRight>();

                foreach (var userId in bulkDto.UserIds)
                {
                    var accessRight = new AccessRight
                    {
                        UserId = userId,
                        DocumentId = bulkDto.DocumentId,
                        FolderId = bulkDto.FolderId,
                        CanCreate = bulkDto.CanCreate,
                        CanRead = bulkDto.CanRead,
                        CanUpdate = bulkDto.CanUpdate,
                        CanDelete = bulkDto.CanDelete,
                      
                    };

                    accessRights.Add(accessRight);
                }

                await _unitOfWork.PermissionsRepository.BulkCreateAsync(accessRights);
                await _unitOfWork.SaveChangesAsync();

                return Ok(new ResponseAPI(200, $"Created {accessRights.Count} access rights successfully"));
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<AccessRightDto>> UpdateAccessRight(int id, [FromBody] UpdateAccessRightDto updateAccessRightDto)
        {
            try
            {
                if (updateAccessRightDto == null)
                    return BadRequest(new { success = false, message = "Update data is required" });

                var existingAccessRight = await _unitOfWork.PermissionsRepository.GetByIdAsync(id);
                if (existingAccessRight == null)
                    return NotFound(new { success = false, message = "Access right not found" });

                _mapper.Map(updateAccessRightDto, existingAccessRight);
                await _unitOfWork.PermissionsRepository.UpdateAsync(existingAccessRight);
                await _unitOfWork.SaveChangesAsync();

                var accessRightDto = _mapper.Map<AccessRightDto>(existingAccessRight);
                return Ok(new { success = true, data = accessRightDto });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteAccessRight(int id)
        {
            try
            {
                var accessRight = await _unitOfWork.PermissionsRepository.GetByIdAsync(id);
                if (accessRight == null)
                    return NotFound(new { success = false, message = "Access right not found" });

                await _unitOfWork.PermissionsRepository.DeleteAsync(id);
                await _unitOfWork.SaveChangesAsync();

                return Ok(new ResponseAPI(200, "Access right deleted successfully"));
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        [HttpGet("check/{userId}")]
        public async Task<ActionResult> CheckUserPermissions(string userId, [FromQuery] int? documentId, [FromQuery] int? folderId, [FromQuery] string permission = "read")
        {
            try
            {
                var hasPermission = await _unitOfWork.PermissionsRepository.HasPermissionAsync(userId, documentId, folderId, permission);
                return Ok(new { success = true, hasPermission });
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(400, ex.Message));
            }
        }

        [HttpDelete("user/{userId}")]
        public async Task<ActionResult> RemoveUserAccess(string userId, [FromQuery] int? documentId, [FromQuery] int? folderId)
        {
            try
            {
                await _unitOfWork.PermissionsRepository.RemoveUserAccessAsync(userId, documentId, folderId);
                await _unitOfWork.SaveChangesAsync();

                return Ok(new ResponseAPI(200, "User access removed successfully"));
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ResponseAPI(500, ex.Message));
            }
        }

        private string GetCurrentUserId()
        {
            return User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "system";
        }
    }
}