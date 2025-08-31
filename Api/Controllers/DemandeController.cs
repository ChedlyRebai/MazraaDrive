using AutoMapper;
using Core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    //------------------------------------------------------------------------------
    public class DemandeController : BaseController
    {




        // [HttpPost("create")]
        // public async Task<IActionResult> createDemandeConrolle()
        // {
        //     try
        //     {
        //         //var demande =
        //         await _unitOfWork. 
        //     }
        //     catch (System.Exception)
        //     {

        //         throw;
        //     }
        // }
        public DemandeController(ICurrentUserService currentUser, IUnitOfWork unitOfWork, IMapper mapper, ILogger<BaseController> logger, IAuditLogRepository auditLogger = null) : base(currentUser, unitOfWork, mapper, logger, auditLogger)
        {
        }
    }
}
