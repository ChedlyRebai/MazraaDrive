using AutoMapper;
using Core.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
   // [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)] 
    public class BaseController : ControllerBase
    {
        protected readonly IUnitOfWork _unitOfWork;
        protected readonly IMapper _mapper;


        // protected readonly IAuditLogger _auditLogger;

        protected readonly ILogger<BaseController> _logger;
        protected readonly ICurrentUserService _currentUser;
        public BaseController(ICurrentUserService currentUser, IUnitOfWork unitOfWork, IMapper mapper, ILogger<BaseController> logger)
        {
            _unitOfWork = unitOfWork ?? throw new ArgumentNullException(nameof(unitOfWork));
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));

            _currentUser = currentUser;
            _logger = logger;
            //_auditLogger = auditLogger ?? throw new ArgumentNullException(nameof(auditLogger));
        }
    }
}