using System;
using AutoMapper;
using Core.DTO;
using Core.DTOs;
using Core.Entities;

namespace Api.Controllers.Mapping;

public class MappingProfile : Profile
{
    public MappingProfile()
    {
        CreateMap<Role, RoleDto>().ReverseMap();
        CreateMap<Role, CreateRoleDto>().ReverseMap();
        CreateMap<Role, UpdateRoleDto>().ReverseMap();


        CreateMap<Department, DepartmentDto>().ReverseMap();
        CreateMap<Department, DepartmentCreateDTO>().ReverseMap();
        CreateMap<Department, DepartmentUpdateDTO>().ReverseMap();
        CreateMap<Department, DepartmentDeleteDTO>().ReverseMap();
        CreateMap<Department, DepartmentUserCountDTO>().ReverseMap();

        CreateMap<AppUser, UserDto>().ReverseMap();
         

        CreateMap<CreateUserDto, AppUser>()
            .ForMember(dest => dest.Id, opt => opt.Ignore())
            .ForMember(dest => dest.IsActive, opt => opt.MapFrom(src => true))
            .ForMember(dest => dest.CreatedAt, opt => opt.Ignore())
            .ForMember(dest => dest.UpdatedAt, opt => opt.Ignore())
            .ForMember(dest => dest.Role, opt => opt.Ignore())
            .ForMember(dest => dest.Department, opt => opt.Ignore())
            .ForMember(dest => dest.AccessRights, opt => opt.Ignore())
            .ForMember(dest => dest.CreatedFolders, opt => opt.Ignore())
            .ForMember(dest => dest.UploadedDocuments, opt => opt.Ignore())
            .ForMember(dest => dest.DocumentRequests, opt => opt.Ignore())
            .ForMember(dest => dest.AuditLogs, opt => opt.Ignore())
           
            // Identity properties
            .ForMember(dest => dest.SecurityStamp, opt => opt.Ignore())
            .ForMember(dest => dest.ConcurrencyStamp, opt => opt.Ignore())
            .ForMember(dest => dest.PasswordHash, opt => opt.Ignore())
            .ForMember(dest => dest.NormalizedEmail, opt => opt.Ignore())
            .ForMember(dest => dest.NormalizedUserName, opt => opt.Ignore())
            .ForMember(dest => dest.EmailConfirmed, opt => opt.Ignore())
            .ForMember(dest => dest.PhoneNumberConfirmed, opt => opt.Ignore())
            .ForMember(dest => dest.TwoFactorEnabled, opt => opt.Ignore())
            .ForMember(dest => dest.LockoutEnd, opt => opt.Ignore())
            .ForMember(dest => dest.LockoutEnabled, opt => opt.Ignore())
            .ForMember(dest => dest.AccessFailedCount, opt => opt.Ignore());

        CreateMap<UpdateUserDto, AppUser>()
            .ForMember(dest => dest.Id, opt => opt.Ignore())
            .ForMember(dest => dest.CreatedAt, opt => opt.Ignore())
            .ForMember(dest => dest.UpdatedAt, opt => opt.Ignore())
            .ForMember(dest => dest.Role, opt => opt.Ignore())
            .ForMember(dest => dest.Department, opt => opt.Ignore())
            .ForMember(dest => dest.AccessRights, opt => opt.Ignore())
            .ForMember(dest => dest.CreatedFolders, opt => opt.Ignore())
            .ForMember(dest => dest.UploadedDocuments, opt => opt.Ignore())
            .ForMember(dest => dest.DocumentRequests, opt => opt.Ignore())
            .ForMember(dest => dest.AuditLogs, opt => opt.Ignore())
            // Identity properties
            .ForMember(dest => dest.SecurityStamp, opt => opt.Ignore())
            .ForMember(dest => dest.ConcurrencyStamp, opt => opt.Ignore())
            .ForMember(dest => dest.PasswordHash, opt => opt.Ignore())
            .ForMember(dest => dest.NormalizedEmail, opt => opt.Ignore())
            .ForMember(dest => dest.NormalizedUserName, opt => opt.Ignore())
            .ForMember(dest => dest.EmailConfirmed, opt => opt.Ignore())
            .ForMember(dest => dest.PhoneNumberConfirmed, opt => opt.Ignore())
            .ForMember(dest => dest.TwoFactorEnabled, opt => opt.Ignore())
            .ForMember(dest => dest.LockoutEnd, opt => opt.Ignore())
            .ForMember(dest => dest.LockoutEnabled, opt => opt.Ignore())
            .ForMember(dest => dest.AccessFailedCount, opt => opt.Ignore())
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        CreateMap<AppUser, RegisterDTO>()
            .ForMember(dest => dest.Password, opt => opt.Ignore())
            .ForMember(dest => dest.Username, opt => opt.MapFrom(src => src.UserName))
            .ReverseMap()
            .ForMember(dest => dest.UserName, opt => opt.MapFrom(src => src.Username));

        CreateMap<AppUser, LoginDTO>()
            .ForMember(dest => dest.Password, opt => opt.Ignore())
            .ReverseMap();

        CreateMap<Document, DocumentDto>().ReverseMap();
        CreateMap<Document, DocumentUploadDto>().ReverseMap();
        CreateMap<Document, DocumentSummaryDto>().ReverseMap();

        CreateMap<AccessRight, AccessRightDto>().ReverseMap();
        CreateMap<AccessRight, CreateAccessRightDto>()
            .ReverseMap();
        CreateMap<AccessRight, UpdateAccessRightDto>().ReverseMap();
        CreateMap<AccessRight, BulkAccessRightDto>().ReverseMap();
        CreateMap<AccessRight, AccessRightSummaryDto>().ReverseMap();

        
    }

    private static string FormatFileSize(long bytes)
    {
        if (bytes >= 1073741824)
            return $"{bytes / 1073741824.0:F2} GB";
        else if (bytes >= 1048576)
            return $"{bytes / 1048576.0:F2} MB";
        else if (bytes >= 1024)
            return $"{bytes / 1024.0:F2} KB";
        else
            return $"{bytes} bytes";

    }
}
