using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Core.Entities;
using Core.Interfaces;
using Core.Services;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
namespace Infrastructure.Repositories;

public class GenerateToken : IGenerateToken
{
    private readonly IConfiguration _configuration;

    public GenerateToken(IConfiguration configuration)
    {
        _configuration = configuration;
    }
    public Task<string> GetAndCreateToken(AppUser user)
    {
        List<Claim> claims = new List<Claim>
        {
            new Claim(ClaimTypes.Name, user.UserName ?? ""),
            //new Claim(ClaimTypes.Email, user.Email),
            new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
           // new Claim("RoleId", user.RoleId.ToString()),
            //new Claim("DepartmentId", user.DepartmentId.ToString()),
            
        };

        if (!user.DepartmentId.Equals(Guid.Empty))
        {
            claims.Add(new Claim("DepartmentId", user.DepartmentId.ToString()));
        }
        if (!string.IsNullOrEmpty(user.Cin.ToString()))
        {
            claims.Add(new Claim("Cin", user.Cin.ToString()));
        }

        if (!string.IsNullOrEmpty(user.Email))
        {
            claims.Add(new Claim(ClaimTypes.Email, user.Email));
        }
        Console.WriteLine("***********************************");
        foreach (var claim in claims)
        {
            Console.WriteLine($"Claim Type: {claim.Type}, Claim Value$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$: {claim.Value}");
        }

        var Security = _configuration["Token:Secret"];
        var key = Encoding.ASCII.GetBytes(Security);

        SigningCredentials credentials = new SigningCredentials(
            new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature
        );
        SecurityTokenDescriptor token = new SecurityTokenDescriptor
        {
            Subject = new ClaimsIdentity(claims),
            Expires = DateTime.Now.AddDays(7),
            Issuer = _configuration["Token:Issuer"],
            SigningCredentials = credentials,
            NotBefore = DateTime.Now
        };
        ///thabet lehne yothhorly fama mchkla arjaa lil video 119-115
        JwtSecurityTokenHandler tokenHandler = new JwtSecurityTokenHandler();
        SecurityToken securityToken = tokenHandler.CreateToken(token);
        string tokenString = tokenHandler.WriteToken(securityToken);
        return Task.FromResult(tokenString);
    }
}