using AutoMapper;
using Core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{

    public class NotificationController : BaseController
    {
        public NotificationController(ICurrentUserService currentUser, IUnitOfWork unitOfWork, IMapper mapper, ILogger<BaseController> logger) : base(currentUser, unitOfWork, mapper, logger)
        {
        }

        
    }
}
