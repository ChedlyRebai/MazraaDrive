import { PaginationParams } from "./pageresult.model";
import { PagedResult } from "./pageresult.model";

export interface DepartmentDto {
       id: number;
       name: string;
       description: string;
       createdAt: string;
       updatedAt: string;
       userCount: number;
       folderCount: number;
       documentRequestCount: number;
}

export interface DepartmentCreateDTO {
       name: string;
       description: string;
}

export interface DepartmentUpdateDTO {
       id: number;
       name: string;
       description: string;
}

export interface DepartmentDeleteDTO {
       id: number;
}

export interface DepartmentFilterDto extends PaginationParams {
       name: string | null;
       createdFrom: string | null;
       createdTo: string | null;
       minUserCount: number | null;
       maxUserCount: number | null;
}

export interface DepartmentPagedResult extends PagedResult<DepartmentDto> {
       totalDepartments: number;
       totalUsers: number;
}

export interface DepartmentUserCountDTO {
       departmentId: number;
       userCount: number;
}