using AutoMapper;
using Core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{

    public class MessageController : BaseController
    {
        public MessageController(ICurrentUserService currentUser, IUnitOfWork unitOfWork, IMapper mapper, ILogger<MessageController> logger)
            : base(currentUser, unitOfWork, mapper, logger )
        {
        }   
    }
}
