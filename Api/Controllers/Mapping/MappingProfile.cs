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




        CreateMap<Document, DocumentDto>().ReverseMap();
        CreateMap<Document, DocumentUploadDto>().ReverseMap();
        CreateMap<Document, DocumentSummaryDto>().ReverseMap();
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
