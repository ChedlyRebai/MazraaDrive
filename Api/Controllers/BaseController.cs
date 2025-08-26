using AutoMapper;
using Core.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{   [ApiVersion("1")]
    [Route("api/v{version:apiVersion}/[controller]")]
    [ApiController]
    public class BaseController : ControllerBase
    {
        protected readonly IUnitOfWork _unitOfWork;
        protected readonly IMapper _mapper;
         public readonly IAuditLogRepository _auditLogger;
        // protected readonly IAuditLogger _auditLogger;

        protected readonly ICurrentUserService _currentUser;
        public BaseController(ICurrentUserService currentUser, IUnitOfWork unitOfWork, IMapper mapper, IAuditLogRepository auditLogger = null)
        {
            _unitOfWork = unitOfWork ?? throw new ArgumentNullException(nameof(unitOfWork));
            _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
            _auditLogger = auditLogger;
             _currentUser = currentUser;
            //_auditLogger = auditLogger ?? throw new ArgumentNullException(nameof(auditLogger));
        }
    }
}