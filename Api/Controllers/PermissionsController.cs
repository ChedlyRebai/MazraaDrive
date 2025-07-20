using AutoMapper;
using Core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{

    public class PermissionsController : BaseController
    {
        public PermissionsController(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        public PermissionsController(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork, mapper)
        {
        }
    }
}
