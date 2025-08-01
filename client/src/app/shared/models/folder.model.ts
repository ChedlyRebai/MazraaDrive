import { DocumentDto } from "./document.model";
import { PagedResult, PaginationParams } from "./pageresult.model";
import { UserDto } from "./user.model";

export interface FolderDTO {
    id: number;
    name: string;
    description: string;
    parentFolderId: number | null;
    parentFolderName: string | null;
    departmentId: number;
    departmentName: string;
    createdById: string;
    createdByName: string;
    createdAt: string;
    updatedAt: string | null;
    isActive: boolean;
    subFolderCount: number;
    parentFolder: FolderDTO;
    subFolders: SubFolderDTO[];
    documents: DocumentDto[];
    documentCount: number;
}

export interface SubFolderDTO {
    createdById: string;
    id: number;
    name: string;
    createdBy: UserDto;
    parentFolderId: number;
    createdAt: string;
    isActive: boolean;
}

export interface CreateFolderDTO {
    name: string;
    description: string;
    parentFolderId: number | null;
    departmentId: number;
    isActive: boolean;
}

export interface UpdateFolderDTO {
    name: string | null;
    description: string | null;
    parentFolderId: number | null;
    isActive: boolean | null;
}

export interface FolderWithDocumentsDTO extends FolderDTO {
    documentCount: number;
    subFolderCount: number;
}

export interface FolderTreeDto {
    id: number;
    name: string;
    description: string;
    parentFolderId: number | null;
    departmentId: number;
    departmentName: string;
    isActive: boolean;
    subFolderCount: number;
    documentCount: number;
    createdAt: string;
    subFolders: FolderTreeDto[];
}

export interface FolderFilterDto extends PaginationParams {
    name: string | null;
    parentFolderName: string | null;
    departmentId: number | null;
    departmentName: string | null;
    createdById: string | null;
    createdByName: string | null;
    isActive: boolean | null;
}

export interface FolderPagedResult extends PagedResult<FolderDTO> {
    totalFolders: number;
    totalDepartments: number;
    totalDocuments: number;
}

export interface FolderWithSubFoldersDTO extends FolderDTO {
    subFolderCount: number;
    documentCount: number;
}

