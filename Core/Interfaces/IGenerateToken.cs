using System;
using Core.Entities;

namespace Core.Interfaces;
public interface IGenerateToken
{
    Task<string> GetAndCreateToken(AppUser user,IList<string> roles,string departmentId = null);
}