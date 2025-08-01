// import { FormFile } from "./formFile";
import { PaginationParams } from "./pageresult.model";
import { PagedResult } from "./pageresult.model";

export interface DocumentDto {
       id: number;
       name: string;
       description: string;
       fileType: string;
       fileSize: number;
       fileSizeFormatted: string;
       storagePath: string;
       folderId: number;
       folderName: string;
       uploadedById: string;
       uploadedByName: string;
       version: number;
       isValidated: boolean;
       isActive: boolean;
       createdAt: string;
       updatedAt: string | null;
       requestCount: number;
}

export interface CreateDocumentDto {
       name: string;
       description: string;
       fileType: string;
       folderId: number;
    //    file: FormFile;
}

export interface UpdateDocumentDto {
       name: string | null;
       description: string | null;
       folderId: number | null;
       isValidated: boolean | null;
       isActive: boolean | null;
}

export interface DocumentUploadDto {
    //    file: FormFile;
       folderId: number;
       description: string;
}

export interface DocumentSummaryDto {
       id: number;
       name: string;
       fileType: string;
       fileSizeFormatted: string;
       createdAt: string;
       isValidated: boolean;
}

export interface DocumentFilterDto extends PaginationParams {
       name: string | null;
       fileType: string | null;
       folderId: number | null;
       folderName: string | null;
       uploadedById: string | null;
       uploadedByName: string | null;
       isValidated: boolean | null;
       isActive: boolean | null;
       fileTypes: string[] | null;
}

export interface DocumentPagedResult extends PagedResult<DocumentDto> {
       totalDocuments: number;
       totalUsers: number;
}