import { PagedResult, PaginationParams } from './pageresult';

export interface AccessRightFilterDto extends PaginationParams {
  userId: string | null;
  userName: string | null;
  documentId: number | null;
  folderId: number | null;
  type: string | null;
  isActive: boolean | null;
  canCreate: boolean | null;
  canRead: boolean | null;
  canUpdate: boolean | null;
  canDelete: boolean | null;
  createdFrom: string | null;
  createdTo: string | null;
}

export interface AccessRightPagedResult extends PagedResult<AccessRightDto> {
  summary: AccessRightSummaryDto | null;
}

export interface AccessRightDto {
  id: number;
  userId: string;
  userName: string;
  userFullName: string;
  documentId: number | null;
  documentName: string | null;
  folderId: number | null;
  folderName: string | null;
  type: string;
  canCreate: boolean;
  canRead: boolean;
  canUpdate: boolean;
  canDelete: boolean;
  isActive: boolean;
  createdAt: string;
  updatedAt: string | null;
}

export interface CreateAccessRightDto {
  userId: string;
  documentId: number | null;
  folderId: number | null;
  canCreate: boolean;
  canRead: boolean;
  canUpdate: boolean;
  canDelete: boolean;
  isValid: boolean;
}

export interface UpdateAccessRightDto {
  canCreate: boolean | null;
  canRead: boolean | null;
  canUpdate: boolean | null;
  canDelete: boolean | null;
  isActive: boolean | null;
}

export interface BulkAccessRightDto {
  userIds: string[];
  documentId: number | null;
  folderId: number | null;
  canCreate: boolean;
  canRead: boolean;
  canUpdate: boolean;
  canDelete: boolean;
}

export interface AccessRightSummaryDto {
  userId: string;
  userName: string;
  totalRights: number;
  documentRights: number;
  folderRights: number;
  createRights: number;
  updateRights: number;
  deleteRights: number;
}
