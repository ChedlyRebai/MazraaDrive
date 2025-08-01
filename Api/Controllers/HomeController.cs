using Api.Helper;
using AutoMapper;
using Core.DTO;
using Core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{

    public class HomeController : BaseController
    {
        public HomeController(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork, mapper)
        {
        }

        [HttpGet("GetHomeDocumentFolders")]
        public async Task<IActionResult> GetHomeDocumentFolders([FromQuery] FolderFilterDto filter)
        {
            try
            {
                var homeDto = await _unitOfWork.FolderRepository.GetHomeFolders(filter, 10);
                var folderDtos = _mapper.Map<IEnumerable<FolderDTO>>(homeDto.Data);

                var result = new FolderPagedResult
                {
                    Data = folderDtos,
                    PageNumber = homeDto.PageNumber,
                    PageSize = homeDto.PageSize,
                    TotalRecords = homeDto.TotalRecords,
                    TotalPages = homeDto.TotalPages,
                    HasPreviousPage = homeDto.HasPreviousPage,
                    HasNextPage = homeDto.HasNextPage,
                    Search = homeDto.Search,
                    SortBy = homeDto.SortBy,
                    SortDirection = homeDto.SortDirection,
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
    }
}
