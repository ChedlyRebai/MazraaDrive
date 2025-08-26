using AutoMapper;
using Core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{

    public class MessageController : BaseController
    {
        

        public MessageController(ICurrentUserService icurrentUser, IUnitOfWork unitOfWork, IMapper mapper) 
            : base(icurrentUser, unitOfWork, mapper)
        {
        }
    }
}
