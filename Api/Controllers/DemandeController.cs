using AutoMapper;
using Core.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    //------------------------------------------------------------------------------
    public class DemandeController : BaseController
    {
        public DemandeController(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork, mapper)
        {
        }

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
    }
}
