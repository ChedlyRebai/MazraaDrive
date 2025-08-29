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
            .ForMember(dest => dest.Cin, opt => opt.Ignore())
            .ForMember(dest => dest.AccessRights, opt => opt.Ignore())
            .ForMember(dest => dest.CreatedFolders, opt => opt.Ignore())
            .ForMember(dest => dest.UploadedDocuments, opt => opt.Ignore())
            //.ForMember(dest => dest.DocumentRequests, opt => opt.Ignore())
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
            .ForMember(dest => dest.Cin, opt => opt.Ignore())
            .ForMember(dest => dest.Id, opt => opt.Ignore())
            .ForMember(dest => dest.CreatedAt, opt => opt.Ignore())
            .ForMember(dest => dest.UpdatedAt, opt => opt.Ignore())
            .ForMember(dest => dest.Role, opt => opt.Ignore())
            .ForMember(dest => dest.Department, opt => opt.Ignore())
            .ForMember(dest => dest.AccessRights, opt => opt.Ignore())
            .ForMember(dest => dest.CreatedFolders, opt => opt.Ignore())
            .ForMember(dest => dest.UploadedDocuments, opt => opt.Ignore())
            //.ForMember(dest => dest.DocumentRequests, opt => opt.Ignore())
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

        CreateMap<Folder, FolderDTO>()
            .ForMember(dest => dest.ParentFolderName, opt => opt.MapFrom(src => src.ParentFolder != null ? src.ParentFolder.Name : null))
            .ForMember(dest => dest.DepartmentName, opt => opt.MapFrom(src => src.Department != null ? src.Department.Name : string.Empty))
            .ForMember(dest => dest.CreatedById, opt => opt.MapFrom(src => src.CreatedById ?? string.Empty))
            .ForMember(dest => dest.CreatedByName, opt => opt.MapFrom(src => src.CreatedBy != null ? src.CreatedBy.UserName : string.Empty))
            .ForMember(dest => dest.SubFolderCount, opt => opt.MapFrom(src => src.SubFolders != null ? src.SubFolders.Count() : 0))
            .ForMember(dest => dest.DocumentCount, opt => opt.MapFrom(src => src.Documents != null ? src.Documents.Count() : 0));

        CreateMap<CreateFolderDTO, Folder>()
            .ForMember(dest => dest.Id, opt => opt.Ignore())
            .ForMember(dest => dest.CreatedById, opt => opt.Ignore())
            .ForMember(dest => dest.CreatedAt, opt => opt.Ignore())
            .ForMember(dest => dest.UpdatedAt, opt => opt.Ignore())
            .ForMember(dest => dest.ParentFolder, opt => opt.Ignore())
            .ForMember(dest => dest.Department, opt => opt.Ignore())
            .ForMember(dest => dest.CreatedBy, opt => opt.Ignore())
            .ForMember(dest => dest.SubFolders, opt => opt.Ignore())
            .ForMember(dest => dest.Documents, opt => opt.Ignore());

        CreateMap<UpdateFolderDTO, Folder>()
            .ForMember(dest => dest.Id, opt => opt.Ignore())
            .ForMember(dest => dest.DepartmentId, opt => opt.Ignore())
            .ForMember(dest => dest.CreatedById, opt => opt.Ignore())
            .ForMember(dest => dest.CreatedAt, opt => opt.Ignore())
            .ForMember(dest => dest.UpdatedAt, opt => opt.Ignore())
            .ForMember(dest => dest.ParentFolder, opt => opt.Ignore())
            .ForMember(dest => dest.Department, opt => opt.Ignore())
            .ForMember(dest => dest.CreatedBy, opt => opt.Ignore())
            .ForMember(dest => dest.SubFolders, opt => opt.Ignore())
            .ForMember(dest => dest.Documents, opt => opt.Ignore())
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

        CreateMap<Folder, FolderWithSubFoldersDTO>()
            .ForMember(dest => dest.ParentFolderName, opt => opt.MapFrom(src => src.ParentFolder != null ? src.ParentFolder.Name : null))
            .ForMember(dest => dest.DepartmentName, opt => opt.MapFrom(src => src.Department != null ? src.Department.Name : string.Empty))
            .ForMember(dest => dest.CreatedById, opt => opt.MapFrom(src => src.CreatedById ?? string.Empty))
            .ForMember(dest => dest.CreatedByName, opt => opt.MapFrom(src => src.CreatedBy != null ? src.CreatedBy.UserName : string.Empty))
            .ForMember(dest => dest.SubFolderCount, opt => opt.MapFrom(src => src.SubFolders != null ? src.SubFolders.Count() : 0))
            .ForMember(dest => dest.DocumentCount, opt => opt.MapFrom(src => src.Documents != null ? src.Documents.Count() : 0));

        CreateMap<Folder, FolderTreeDto>()
            .ForMember(dest => dest.DepartmentName, opt => opt.MapFrom(src => src.Department != null ? src.Department.Name : string.Empty))
            .ForMember(dest => dest.SubFolderCount, opt => opt.MapFrom(src => src.SubFolders != null ? src.SubFolders.Count() : 0))
            .ForMember(dest => dest.DocumentCount, opt => opt.MapFrom(src => src.Documents != null ? src.Documents.Count() : 0))
            .ForMember(dest => dest.SubFolders, opt => opt.Ignore()); // Handle recursively in repository

        CreateMap<UserController, UserDto>();

        CreateMap<AppUser, UserWithDetailsDto>();
        CreateMap<UserDto, UserWithDetailsDto>();
        CreateMap<AppUser, UserWithDetailsDto>()
            .ForMember(dest => dest.RecentDocuments, opt => opt.MapFrom(src => src.UploadedDocuments.OrderByDescending(d => d.CreatedAt).Take(5)))
            .ForMember(dest => dest.RecentDocuments, opt => opt.MapFrom(src => src.UploadedDocuments));

        CreateMap<Document, UserDocumentDto>().ReverseMap();
        CreateMap<Folder, UserFolderDto>().ReverseMap();

        CreateMap<AppUser, UserWithDetailsDto>()
            .ForMember(dest => dest.RecentDocuments, opt => opt.MapFrom(src => src.UploadedDocuments
                    .OrderByDescending(d => d.CreatedAt)
                    .Take(5)))
            .ForMember(dest => dest.RecentFolders, opt => opt.MapFrom(src => src.CreatedFolders));

        CreateMap<HomeDto, Folder>();
        CreateMap<Folder, SubFolderDTO>()

        .ForMember(dest => dest.CreatedBy, opt => opt.MapFrom(src => src.CreatedBy))
        .ReverseMap();

        CreateMap<Document, DocumentDto>()
            .ForMember(dest => dest.UploadedByName, opt => opt.MapFrom(src => src.UploadedBy != null ? src.UploadedBy.UserName : string.Empty));

        CreateMap<Folder, FolderDTO>()
         .ForMember(dest => dest.SubFolders, opt => opt.MapFrom(src => src.SubFolders))
        .ForMember(dest => dest.ParentFolderName, opt => opt.MapFrom(src => src.ParentFolder != null ? src.ParentFolder.Name : null))
        .ForMember(dest => dest.DepartmentName, opt => opt.MapFrom(src => src.Department != null ? src.Department.Name : string.Empty))
        .ForMember(dest => dest.CreatedById, opt => opt.MapFrom(src => src.CreatedById ?? string.Empty))
        .ForMember(dest => dest.CreatedByName, opt => opt.MapFrom(src => src.CreatedBy != null ? src.CreatedBy.UserName : string.Empty))
        .ForMember(dest => dest.SubFolderCount, opt => opt.MapFrom(src => src.SubFolders != null ? src.SubFolders.Count() : 0))
        .ForMember(dest => dest.DocumentCount, opt => opt.MapFrom(src => src.Documents != null ? src.Documents.Count() : 0));


        // Add to MappingProfile.cs constructor
        CreateMap<DocumentRequest, DocumentRequestDTO>()
            .ForMember(dest => dest.RequesterName, opt => opt.MapFrom(src => src.Requester != null ? src.Requester.UserName : string.Empty))
            .ForMember(dest => dest.DepartmentName, opt => opt.MapFrom(src => src.Department != null ? src.Department.Name : string.Empty))
            // .ForMember(dest => dest.ResponseDocumentName, opt => opt.MapFrom(src => src.ResponseDocument != null ? src.ResponseDocument. : null))
            .ForMember(dest => dest.ProcessedByName, opt => opt.MapFrom(src => src.ProcessedBy != null ? src.ProcessedBy.UserName : null));

        CreateMap<CreateDocumentRequestDTO, DocumentRequest>()
            .ForMember(dest => dest.Id, opt => opt.Ignore())
            .ForMember(dest => dest.Status, opt => opt.MapFrom(src => "Pending"))
            .ForMember(dest => dest.RequestedAt, opt => opt.MapFrom(src => DateTime.UtcNow))
            .ForMember(dest => dest.CreatedAt, opt => opt.Ignore())
            .ForMember(dest => dest.UpdatedAt, opt => opt.Ignore());


        CreateMap<UpdateDocumentRequestDTO, DocumentRequest>()
            .ForMember(dest => dest.Id, opt => opt.Ignore())
            .ForMember(dest => dest.RequesterId, opt => opt.Ignore())
            .ForMember(dest => dest.RequestedAt, opt => opt.Ignore())
            .ForMember(dest => dest.CreatedAt, opt => opt.Ignore())
            .ForMember(dest => dest.UpdatedAt, opt => opt.Ignore())
            .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

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
