using System;
using Core.DTO;

namespace Core.Interfaces;

public interface IHomeRepository
{

    //Task<PagedResult<HomeDto>> GetHomeDocumentFolders(HomeFilterDto filter);
    Task<HomeDto> GetHomeDocumentFolders(HomeFilterDto filter);
}
