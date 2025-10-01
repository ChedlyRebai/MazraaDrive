using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Linq;
using Core.Interfaces;

namespace Infrastructure.Filters
{
    public class AuthorizeRolesAttribute : Attribute, IAuthorizationFilter
    {
        private readonly string[] _allowedRoles;

        public AuthorizeRolesAttribute(params string[] allowedRoles)
        {
            _allowedRoles = allowedRoles;
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            // Skip authorization if action is decorated with [AllowAnonymous]
            var allowAnonymous = context.ActionDescriptor.EndpointMetadata
                .Any(em => em.GetType() == typeof(AllowAnonymousAttribute));
            if (allowAnonymous)
                return;

            var currentUserService = context.HttpContext.RequestServices.GetService<ICurrentUserService>();

            if (currentUserService == null || !currentUserService.IsAuthenticated)
            {
                context.Result = new UnauthorizedResult();
                return;
            }

            // Check if user has any of the required roles
            if (_allowedRoles.Length > 0 && !currentUserService.IsInAnyRole(_allowedRoles))
            {
                context.Result = new ForbidResult();
                return;
            }
        }
    }
}