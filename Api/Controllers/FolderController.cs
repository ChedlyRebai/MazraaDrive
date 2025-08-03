using Api.Helper;
using AutoMapper;
using Core.DTO;
using Core.DTOs;
using Core.Entities;
using Core.Interfaces;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class FolderController : BaseController
    {
        public FolderController(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork, mapper)
        {
        }

        [HttpGet("test")]
        public string TestApi()
        {
            return "Folder API is working!";
        }

        [HttpGet]
        public async Task<ActionResult<FolderPagedResult>> GetFolders([FromQuery] FolderFilterDto filter)
        {
            try
            {
                var pagedFolders = await _unitOfWork.FolderRepository.GetPagedAsync(filter);
                var folderDtos = _mapper.Map<IEnumerable<FolderDTO>>(pagedFolders.Data);

                var result = new FolderPagedResult
                {
                    Data = folderDtos,
                    PageNumber = pagedFolders.PageNumber,
                    PageSize = pagedFolders.PageSize,
                    TotalRecords = pagedFolders.TotalRecords,
                    TotalPages = pagedFolders.TotalPages,
                    HasPreviousPage = pagedFolders.HasPreviousPage,
                    HasNextPage = pagedFolders.HasNextPage,
                    Search = pagedFolders.Search,
                    SortBy = pagedFolders.SortBy,
                    SortDirection = pagedFolders.SortDirection,
                    TotalFolders = folderDtos.Count(),
                    TotalDepartments = 10,
                    TotalDocuments = 100
                };

                return Ok(new { success = true, data = result });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("id/{id}")]
        public async Task<ActionResult<FolderPagedResult>> GetFolderById([FromQuery] FolderFilterDto filter, int id)
        {
            try
            {
                var pagedFolders = await _unitOfWork.FolderRepository.GetByFolderID(filter, id);
                var folderDtos = _mapper.Map<IEnumerable<FolderDTO>>(pagedFolders.Data);

                var result = new FolderPagedResult
                {
                    Data = folderDtos,
                    
                    PageNumber = pagedFolders.PageNumber,
                    PageSize = pagedFolders.PageSize,
                    TotalRecords = pagedFolders.TotalRecords,
                    TotalPages = pagedFolders.TotalPages,
                    
                    HasPreviousPage = pagedFolders.HasPreviousPage,
                    HasNextPage = pagedFolders.HasNextPage,
                    Search = pagedFolders.Search,
                    SortBy = pagedFolders.SortBy,
                    SortDirection = pagedFolders.SortDirection,
                    TotalFolders = folderDtos.Count(),
                    TotalDepartments = 10,
                    TotalDocuments = pagedFolders.Data.Sum(f => f.Documents.Count)
                };
               
                return Ok(new { success = true, data = result });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<FolderPagedResult>> GetFolder(int id)
        {
            try
            {
                var folder = await _unitOfWork.FolderRepository.GetByIdWithDetailsAsync(id);
                if (folder == null)
                    return NotFound(new { success = false, message = "Folder not found" });

                var folderDto = _mapper.Map<FolderDTO>(folder);
                Console.WriteLine($"SubfolderDTO:**********");
                
                if (folderDto?.SubFolders != null)
                {
                    foreach (var item in folderDto?.SubFolders)
                    {
                        Console.WriteLine($"SubfolderDTO: {item.Name}");
                    }
                }
                return Ok(new { success = true, data = folderDto });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("department/{departmentId}")]
        public async Task<ActionResult<PagedResult<FolderDTO>>> GetFoldersByDepartment(
            int departmentId, 
            [FromQuery] PaginationParams pagination)
        {
            try
            {
                var pagedFolders = await _unitOfWork.FolderRepository.GetByDepartmentPagedAsync(departmentId, pagination);
                var folderDtos = _mapper.Map<IEnumerable<FolderDTO>>(pagedFolders.Data);

                var result = folderDtos.ToPagedResult(
                    pagedFolders.PageNumber,
                    pagedFolders.PageSize,
                    pagedFolders.TotalRecords,
                    pagedFolders.Search,
                    pagedFolders.SortBy,
                    pagedFolders.SortDirection
                );

                return Ok(new { success = true, data = result });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("parent/{parentFolderId?}")]
        public async Task<ActionResult<PagedResult<FolderDTO>>> GetFoldersByParent(
            int? parentFolderId, 
            [FromQuery] PaginationParams pagination)
        {
            try
            {
                var pagedFolders = await _unitOfWork.FolderRepository.GetByParentPagedAsync(parentFolderId, pagination);
                var folderDtos = _mapper.Map<IEnumerable<FolderDTO>>(pagedFolders.Data);

                var result = folderDtos.ToPagedResult(
                    pagedFolders.PageNumber,
                    pagedFolders.PageSize,
                    pagedFolders.TotalRecords,
                    pagedFolders.Search,
                    pagedFolders.SortBy,
                    pagedFolders.SortDirection
                );

                return Ok(new { success = true, data = result });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("user/{userId}")]
        public async Task<ActionResult<PagedResult<FolderDTO>>> GetFoldersByUser(
            string userId, 
            [FromQuery] PaginationParams pagination)
        {
            try
            {
                // Authorization: Users can only view their own folders unless they're Admin/Manager
                var currentUserId = GetCurrentUserId();
                if (userId != currentUserId && !User.IsInRole("Admin") && !User.IsInRole("Manager"))
                {
                    return Forbid();
                }

                var pagedFolders = await _unitOfWork.FolderRepository.GetByUserPagedAsync(userId, pagination);
                var folderDtos = _mapper.Map<IEnumerable<FolderDTO>>(pagedFolders.Data);

                var result = folderDtos.ToPagedResult(
                    pagedFolders.PageNumber,
                    pagedFolders.PageSize,
                    pagedFolders.TotalRecords,
                    pagedFolders.Search,
                    pagedFolders.SortBy,
                    pagedFolders.SortDirection
                );

                return Ok(new { success = true, data = result });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("tree")]
        public async Task<ActionResult<IEnumerable<FolderTreeDto>>> GetFolderTree([FromQuery] int? parentFolderId = null)
        {
            try
            {
                var folderTree = await _unitOfWork.FolderRepository.GetFolderTreeAsync(parentFolderId ?? 0);
                return Ok(new { success = true, data = folderTree });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }


        [HttpPost]
        public async Task<ActionResult<FolderDTO>> CreateFolder([FromBody] CreateFolderDTO createDto)
        {
            try
            {
                if (!ModelState.IsValid)
                    return BadRequest(new { success = false, message = "Invalid data", errors = ModelState });

                // Check if name is already taken in the same parent and department
                // if (await _unitOfWork.FolderRepository.IsNameTakenInParentAsync(createDto.Name, createDto.ParentFolderId, createDto.DepartmentId))
                //     return BadRequest(new { success = false, message = "Folder name already exists in this location" });

                var folder = _mapper.Map<Folder>(createDto);
                folder.CreatedById = "10";
                folder.DepartmentId= 10;

                await _unitOfWork.FolderRepository.AddAsync(folder);
                await _unitOfWork.SaveChangesAsync();

                var folderDto = _mapper.Map<FolderDTO>(folder);
                return CreatedAtAction(nameof(GetFolder), new { id = folderDto.Id }, 
                    new { success = true, data = folderDto });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = ex.Message });
            }
        }
        // [HttpGet]
        // public async Task<ActionResult<IEnumerable<FolderDTO>>> GetFolders()
        // {
        //     try
        //     {
        //         var folders = await _unitOfWork.FolderRepository.GetAllAsync();
        //         var folderDtos = _mapper.Map<IEnumerable<FolderDTO>>(folders);
        //         return Ok(new { success = true, data = folderDtos });
        //     }
        //     catch (Exception ex)
        //     {
        //         return BadRequest(new ResponseAPI(500, ex.Message));
        //     }
        // }

        // [HttpGet("{id}")]
        // public async Task<ActionResult<FolderDTO>> GetFolder(int id)
        // {
        //     try
        //     {
        //         var folder = await _unitOfWork.FolderRepository.GetByIdAsync(id);
        //         if (folder == null)
        //             return NotFound(new { success = false, message = "Folder not found" });

        //         var folderDto = _mapper.Map<FolderDTO>(folder);
        //         return Ok(new { success = true, data = folderDto });
        //     }
        //     catch (Exception ex)
        //     {
        //         return BadRequest(new ResponseAPI(500, ex.Message));
        //     }
        // }

        // [HttpGet("department/{departmentId}")]
        // public async Task<ActionResult<IEnumerable<FolderDTO>>> GetFoldersByDepartment(int departmentId)
        // {
        //     try
        //     {
        //         var folders = await _unitOfWork.FolderRepository.GetByDepartmentAsync(departmentId);
        //         var folderDtos = _mapper.Map<IEnumerable<FolderDTO>>(folders);
        //         return Ok(new { success = true, data = folderDtos });
        //     }
        //     catch (Exception ex)
        //     {
        //         return BadRequest(new ResponseAPI(500, ex.Message));
        //     }
        // }

        [HttpGet("department/{departmentId}/root")]
        public async Task<ActionResult<IEnumerable<FolderDTO>>> GetRootFolders(int departmentId)
        {
            try
            {
                var folders = await _unitOfWork.FolderRepository.GetRootFoldersAsync(departmentId);
                var folderDtos = _mapper.Map<IEnumerable<FolderDTO>>(folders);
                return Ok(new { success = true, data = folderDtos });
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500, ex.Message));
            }
        }

        [HttpGet("{id}/subfolders")]
        public async Task<ActionResult<IEnumerable<FolderDTO>>> GetSubFolders(int id)
        {
            try
            {
                var folders = await _unitOfWork.FolderRepository.GetSubFoldersAsync(id);
                var folderDtos = _mapper.Map<IEnumerable<FolderDTO>>(folders);
                return Ok(new { success = true, data = folderDtos });
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500, ex.Message));
            }
        }

        [HttpGet("department/{departmentId}/tree")]
        public async Task<ActionResult<IEnumerable<FolderWithSubFoldersDTO>>> GetFolderTree(int departmentId)
        {
            try
            {
                var folders = await _unitOfWork.FolderRepository.GetFolderTreeAsync(departmentId);
                var treeDtos = BuildFolderTree(folders.ToList());
                return Ok(new { success = true, data = treeDtos });
            }
            catch (Exception ex)
            {
                return BadRequest(new ResponseAPI(500, ex.Message));
            }
        }

        // [HttpPost]
        // public async Task<ActionResult<FolderDTO>> CreateFolder([FromBody] CreateFolderDTO createFolderDto)
        // {
        //     try
        //     {
        //         if (createFolderDto == null)
        //             return BadRequest(new { success = false, message = "Folder data is required" });

        //         if (!ModelState.IsValid)
        //             return BadRequest(new { success = false, message = "Invalid data", errors = ModelState });

        //         // Check if folder with same name exists in same department/parent
        //         var existingFolder = await _unitOfWork.FolderRepository.GetByNameAsync(
        //             createFolderDto.Name, createFolderDto.DepartmentId);
        //         if (existingFolder != null)
        //             return BadRequest(new { success = false, message = "Folder with this name already exists in this location" });

        //         // Verify department exists
        //         var department = await _unitOfWork.DepartmentRepository.GetByIdAsync(createFolderDto.DepartmentId);
        //         if (department == null)
        //             return BadRequest(new { success = false, message = "Department not found" });

        //         // Verify parent folder exists (if specified)
        //         if (createFolderDto.ParentFolderId.HasValue)
        //         {
        //             var parentFolder = await _unitOfWork.FolderRepository.GetByIdAsync(createFolderDto.ParentFolderId.Value);
        //             if (parentFolder == null)
        //                 return BadRequest(new { success = false, message = "Parent folder not found" });
        //         }

        //         var folder = _mapper.Map<Folder>(createFolderDto);
        //         //folder.CreatedById = GenerateUserId(); // Get from JWT token

        //         var createdFolder = await _unitOfWork.FolderRepository.AddAsync(folder);
        //         await _unitOfWork.SaveChangesAsync();

        //         var folderDto = _mapper.Map<FolderDTO>(createdFolder);
        //         return CreatedAtAction(nameof(GetFolder), new { id = folderDto.Id }, 
        //             new { success = true, data = folderDto });
        //     }
        //     catch (Exception ex)
        //     {
        //         return StatusCode(500, new { success = false, message = ex.Message });
        //     }
        // }

        [HttpPut("{id}")]
        public async Task<ActionResult<FolderDTO>> UpdateFolder(int id, [FromBody] UpdateFolderDTO updateFolderDto)
        {
            try
            {
                if (updateFolderDto == null)
                    return BadRequest(new { success = false, message = "Update data is required" });

                var existingFolder = await _unitOfWork.FolderRepository.GetByIdAsync(id);
                if (existingFolder == null)
                    return NotFound(new { success = false, message = "Folder not found" });

                _mapper.Map(updateFolderDto, existingFolder);
                await _unitOfWork.FolderRepository.UpdateAsync(existingFolder);
                await _unitOfWork.SaveChangesAsync();

                var folderDto = _mapper.Map<FolderDTO>(existingFolder);
                return Ok(new { success = true, data = folderDto });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = ex.Message });
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteFolder(int id)
        {
            try
            {
                var folder = await _unitOfWork.FolderRepository.GetByIdAsync(id);
                if (folder == null)
                    return NotFound(new { success = false, message = "Folder not found" });

                // Check if folder has subfolders
                var hasSubFolders = await _unitOfWork.FolderRepository.HasSubFoldersAsync(id);
                if (hasSubFolders)
                    return BadRequest(new { success = false, message = "Cannot delete folder that contains subfolders" });

                // Check if folder has documents
                var hasDocuments = await _unitOfWork.FolderRepository.HasDocumentsAsync(id);
                if (hasDocuments)
                    return BadRequest(new { success = false, message = "Cannot delete folder that contains documents" });

                await _unitOfWork.FolderRepository.DeleteAsync(id);
                await _unitOfWork.SaveChangesAsync();

                return Ok(new { success = true, message = "Folder deleted successfully" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = ex.Message });
            }
        }

        private string GetCurrentUserId()
        {
            return User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "system";
        }

        private List<FolderWithSubFoldersDTO> BuildFolderTree(List<Folder> folders)
        {
            var folderDict = folders.ToDictionary(f => f.Id, f => _mapper.Map<FolderWithSubFoldersDTO>(f));
            var rootFolders = new List<FolderWithSubFoldersDTO>();

            /*foreach (var folder in folders)
            {
                var folderDto = folderDict[folder.Id];
                
                if (folder.ParentFolderId == null)
                {
                    rootFolders.Add(folderDto);
                }
                else if (folderDict.ContainsKey(folder.ParentFolderId.Value))
                {
                    folderDict[folder.ParentFolderId.Value].SubFolders.Add(folderDto);
                }
            }*/

            return rootFolders;
        }
    }
}