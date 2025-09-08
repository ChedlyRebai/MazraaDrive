using System;
using Core.Entities;

namespace Core.Interfaces;
public interface IGenerateToken
{
    Task<string> GetAndCreateToken(AppUser user,string role,string departmentId = null);
}