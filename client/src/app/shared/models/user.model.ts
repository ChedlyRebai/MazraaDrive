import { PaginationParams } from "./pageresult.model";
import { PagedResult } from "./pageresult.model";

export interface UserDto {
       id: string;
       userName: string;
       email: string;
       phoneNumber: string;
       isActive: boolean;
       createdAt: string;
       updatedAt: string;
       roleId: number | null;
       roleName: string;
       departmentId: number;
       departmentName: string;
       emailConfirmed: boolean;
       phoneNumberConfirmed: boolean;
       lockoutEnabled: boolean;
       lockoutEnd: string | null;
       accessFailedCount: number;
}

export interface CreateUserDto {
       userName: string;
       email: string;
       password: string;
       confirmPassword: string;
       phoneNumber: string;
       roleId: number | null;
       departmentId: number;
}

export interface UpdateUserDto {
       userName: string | null;
       email: string | null;
       fullName: string | null;
       phoneNumber: string | null;
       isActive: boolean | null;
       roleId: number | null;
       departmentId: number | null;
}

export interface ChangePasswordDto {
       currentPassword: string;
       newPassword: string;
       confirmNewPassword: string;
}

export interface ResetPasswordDto {
       email: string;
       token: string;
       newPassword: string;
       confirmNewPassword: string;
}

export interface UserRoleDto {
       userId: number;
       userName: string;
       email: string;
       roles: string[];
}

export interface UserFilterDto extends PaginationParams {
       userName: string | null;
       phoneNumber: string | null;
       isActive: boolean | null;
       roleId: number | null;
       roleName: string | null;
       departmentId: number | null;
       departmentName: string | null;
}

export interface UserPagedResult extends PagedResult<UserDto> {
       totalUsers: number;
       activeUsers: number;
       inactiveUsers: number;
       totalDocuments: number;
       totalFolders: number;
}

export interface UserWithDetailsDto extends UserDto {
       recentDocuments: UserDocumentDto[];
       recentFolders: UserFolderDto[];
       permissions: string[];
       lastLoginAt: string | null;
       lastLoginIP: string | null;
}

export interface UserDepartmentFoldersDocumentsDTO {
       departmentId: number;
       departmentName: string;
       folders: UserFolderDto[];
       documents: UserDocumentDto[];
}

export interface UserDocumentDto {
       id: number;
       fileSize: number;
       name: string;
       fileType: string;
       createdAt: string;
       updatedAt: string | null;
}

export interface UserFolderDto {
       id: number;
       departmentId: number;
       name: string;
       createdAt: string;
       subFoldersCount: number;
       documentsCount: number;
}