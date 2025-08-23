import { PagedResult, PaginationParams } from "./pageresult";


export interface DocumentRequestDTO {
       id: number;
       requesterId: string;
       requesterName: string;
       departmentId: number;
       departmentName: string;
       documentType: string;
       description: string;
       priority: string;
       status: string;
       responseDocumentId: number | null;
       responseMessage?: string | null;
       responseDocumentName: string | null;
       requestedAt: string;
       respondedAt: string | null;
       processedById: string | null;
       processedByName: string | null;
       createdAt: string;
       updatedAt: string | null;
       isActive: boolean;
}

export interface CreateDocumentRequestDTO {
       requesterId: string;
       departmentId: number;
       documentType: string;
       description: string;
       priority: string;
}

export interface UpdateDocumentRequestDTO {
       documentType: string | null;
       description: string | null;
       responseMessage?: string | null;
       priority: string | null;
       status: string | null;
       responseDocumentId: number | null;
       processedById: string | null;
}

export interface DocumentRequestFilterDTO extends PaginationParams {
       requesterId: string | null;
       departmentId: number | null;
       documentType: string | null;
       priority: string | null;
       status: string | null;
       requestedFrom: string | null;
       requestedTo: string | null;
       processedById: string | null;
       search: string | null;
}

export interface DocumentRequestPagedResult extends PagedResult<DocumentRequestDTO> {
       totalPendingRequests: number;
       totalProcessedRequests: number;
       totalRejectedRequests: number;
}