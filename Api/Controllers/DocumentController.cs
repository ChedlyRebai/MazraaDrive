using AutoMapper;
using Core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{

    public class DocumentController : BaseController
    {
        public DocumentController(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        public DocumentController(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork, mapper)
        {
        }
    }
}
