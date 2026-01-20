using System;

using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Core.Entities;
using System.Linq.Expressions;
using Infrastructure.Data;

namespace Infrastructure.Seeding;

public static class UserSeeder
{
    public static async Task SeedUsersAsync(UserManager<AppUser> userManger,RoleManager<Core.Entities.Role> roleManager)
{
    if (userManger == null) throw new ArgumentNullException(nameof(userManger));

     //Ensure Admin role exists
        if (!await roleManager.RoleExistsAsync("Admin"))
        {
            await roleManager.CreateAsync(new Role{
                Name="Admin"
            });
        }
        
    
    
    var email = "chedly.rebai123@gmail.com";
    var user = await userManger.FindByEmailAsync(email);
    if (user != null) return; // already exists

    user = new AppUser
    {
        Id=Guid.NewGuid().ToString(),
        Email = email,
        UserName = email,
        Cin = 11111111,
        EmailConfirmed = true,
        DepartmentId= 1

    };

    var result = await userManger.CreateAsync(user, "Chedly123!");
    if (result.Succeeded)
    {
        await userManger.AddToRoleAsync(user, "Admin");
    }
}


}
