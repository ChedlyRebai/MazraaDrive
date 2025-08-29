import { PaginationParams } from './pageresult';
import { PagedResult } from './pageresult';

export interface RoleDto {
  id: number;
  name: string;
  description: string;
  isActive: boolean;
}

export interface CreateRoleDto {
  name: string;
  description: string;
  isActive: boolean;
}

export interface UpdateRoleDto {
  name: string | null;
  description: string | null;
  isActive: boolean | null;
}

export interface RoleFilterDto extends PaginationParams {
  name: string | null;
  isActive: boolean | null;
  createdFrom: string | null;
  createdTo: string | null;
}

export interface RolePagedResult extends PagedResult<RoleDto> {
  totalRoles: number;
  activeRoles: number;
  inactiveRoles: number;
}
