using System;
using Core.DTO;

namespace Core.Interfaces;

public interface ILoginUserCase
{

    //Task<PagedResult<HomeDto>> GetHomeDocumentFolders(HomeFilterDto filter);
    Task<HomeDto> GetHomeDocumentFolders(HomeFilterDto filter);
}
