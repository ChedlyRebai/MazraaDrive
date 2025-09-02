using System;
using Core.DTO;
using Core.Entities;
using Core.Interfaces;
using Core.Services;
using Core.Shared;
using Infrastructure.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore; // Ensure this using is present for SignInManager

namespace Infrastructure.Repositories;

public class AuthRepository : IAuth
{
    private readonly UserManager<AppUser> _userManager;
    // private readonly IEmailService _emailService;
    private readonly SignInManager<AppUser> _signInManager;
    private readonly AppDbContext _context;
    private readonly IGenerateToken generateToken;
    public AuthRepository(AppDbContext context, UserManager<AppUser> userManager, SignInManager<AppUser> signInManager, IGenerateToken token)
    {
        _context = context;
        _userManager = userManager;
        //  _emailService = emailService;
        _signInManager = signInManager;
        generateToken = token;
    }

    public async Task<string> RegisterAsync(RegisterDTO registerDTO)
    {
        if (registerDTO == null)
        {
            return null;
        }
        if (await _userManager.FindByNameAsync(registerDTO.Username) is not null)
        {
            return "this username is already exist";
        }

        // if (await _userManager.FindByEmailAsync(registerDTO.Email) is not null)
        // {
        //     return "This Email is already exist";
        // }

        AppUser user = new AppUser()
        {
            DepartmentId = registerDTO.DepartmentId,
            IsActive = true,
            CreatedAt = DateTime.UtcNow,
            UpdatedAt = DateTime.UtcNow,

            EmailConfirmed = true,
            UserName = registerDTO.Username,
            //Email = registerDTO.Email,
            //  DisplayName = registerDTO.Username // Assuming DisplayName is the same as Username
        };

        var result = await _userManager.CreateAsync(user, registerDTO.Password);


        if (result.Errors.Any())
        {
            return string.Join(", ", result.Errors.Select(e => e.Description));
        }
        string code = _userManager.GenerateEmailConfirmationTokenAsync(user).Result;

        // await SendEMail(user.Email, code, "ACTIVE", "Active Email", "active your email");
        return "done";
    }
    // Implement methods for authentication, registration, etc. using _userManager
    // Example:
    // public async Task<IdentityResult> RegisterAsync(AppUser user, string password)
    // {
    //     return await _userManager.CreateAsync(user, password);
    // }

    /* public async Task SendEMail(string email, string code, string component, string subject, string message)
     {
         var result = new EmailDTO(email, "chedly.rebai123@gmail.com",
         subject, EmailBody.send(email, code, component));
         await _emailService.SendEmail(result);

     }*/

    public async Task<string> LoginAsync(LoginDTO loginDTO)
    {
        if (loginDTO == null)
        {
            Console.WriteLine("LoginDTO is null");
            return null;
        }
        Console.WriteLine($"Login attempt - CIN: {loginDTO.Cin}, Password: {loginDTO.Password}");
        // Use FirstOrDefaultAsync instead of FirstAsync to handle the case where no user is found
        var cin = loginDTO.Cin;
        var user = await _context.Users.Where(u => u.Cin == cin).FirstOrDefaultAsync();

        // Check if user exists
        if (user == null)
        {
            Console.WriteLine($"No user found with CIN: {cin}");

            return "Invalid CIN or password";
        }

        var result = await _signInManager.CheckPasswordSignInAsync(user, loginDTO.Password, false);

        if (!result.Succeeded)
        {
            return "Invalid CIN or password";
        }
        else
        {
            return await generateToken.GetAndCreateToken(user);
        }
    }

    public async Task<bool> SendEailForgetPassword(string email)
    {
        var user = await _userManager.FindByEmailAsync(email);
        if (user is null)
        {
            return false;
        }
        var token = await _userManager.GeneratePasswordResetTokenAsync(user);
        // await SendEMail(user.Email, token, "FORGET_PASSWORD", "Reset Password", "Click here to reset your password");
        return true;
    }

    public async Task<string> ConfirmEmailAsync(string email, string code)
    {
        var user = await _userManager.FindByEmailAsync(email);
        if (user == null)
        {
            return "User not found";
        }

        var result = await _userManager.ConfirmEmailAsync(user, code);
        if (result.Succeeded)
        {
            return "Email confirmed successfully";
        }
        else
        {
            return "Error confirming email: " + string.Join(", ", result.Errors.Select(e => e.Description));
        }
    }

    public async Task<string> ResetPassword(ResetPasswordDTO resetPasswordDTO)
    {
        var findUser = await _context.Users.Where(u => u.Cin == resetPasswordDTO.Cin).FirstAsync();
        if (findUser == null)
        {
            return "User not found";
        }

        var result = await _userManager.ResetPasswordAsync(findUser, resetPasswordDTO.token, resetPasswordDTO.Password);

        if (result.Succeeded)
        {
            return "Password reset successfully";
        }
        else
        {
            return "error resetting password: " + string.Join(", ", result.Errors.Select(e => e.Description));
        }
    }

    public async Task<bool> ActiveAccount(ActiveAccountDTO activeAccountDTO)
    {
        // var user = await _userManager.FindByEmailAsync(activeAccountDTO.Email);
        var findUser = await _context.Users.Where(u => u.Cin == activeAccountDTO.Cin).FirstAsync();

        Console.WriteLine("user: " + activeAccountDTO);
        if (findUser is null)
        {
            return false;
        }

        // var result = await _userManager.ConfirmEmailAsync(user, activeAccountDTO.Token);
        // if (result.Succeeded)
        // {
        //     return true;
        // }
        var token = await _userManager.GenerateEmailConfirmationTokenAsync(findUser);
        Console.WriteLine("Is confirmed: " + findUser.EmailConfirmed);
        Console.WriteLine("Token: " + token);
        // if (!string.IsNullOrEmpty(findUser.Email))
        // {
        //     Console.WriteLine("Sending email to: " + user.Email);
        //  //   await SendEMail(user.Email, token, "ACTIVE", "Active Email", "active your email");
        // }
        return false;
    }
}