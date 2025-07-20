using AutoMapper;
using Core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{

    public class FolderController : BaseController
    {
        public FolderController(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        public FolderController(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork, mapper)
        {
        }
    }
}
