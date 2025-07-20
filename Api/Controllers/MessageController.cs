using AutoMapper;
using Core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{

    public class MessageController : BaseController
    {
        public MessageController(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        public MessageController(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork, mapper)
        {
        }
    }
}
