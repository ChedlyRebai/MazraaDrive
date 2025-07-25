using System;
using AutoMapper;
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
    }
}
