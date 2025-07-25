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
        
        
    }
}
