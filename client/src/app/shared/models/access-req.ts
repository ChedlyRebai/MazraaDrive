import { PagedResult } from "./pageresult";

export interface AccessRequestDto {
       id: number;
       documentId: number;
       documentName: string;
       message: string;
       requesterId: string;
       requesterName: string;
       requestRead: boolean;
       requestWrite: boolean;
       requestDelete: boolean;
       status: string;
       createdAt: string;
       decisionAt: string | null;
       decidedById: string | null;
       decidedByName: string | null;
}


export interface AccessRequestPagedResult extends PagedResult<AccessRequestDto> {
       
}

export interface AccessRequestCreateDto {
       documentId: number;
       requestRead: boolean;
       requestWrite: boolean;
       requestDelete: boolean;
       message: string;
}

export interface AccessRequestDecisionDto {
       approve: boolean;
}