import { PaginationParams } from './pageresult';
import { PagedResult } from './pageresult';

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
  file: File;
}

export interface DocFolderStats {
  totalFileSize: number;
  documentCount: number;
  folderCount: number;

  imageCount: number;
  wordCount: number;
  pdfCount: number;
  audioCount: number;
  videoCount: number;
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
  file: File;
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
  totalFileSize: number;
  totalFolders: number;
  totalUsers: number;
}
