export interface AuditLogDto {
       id: number;
       userId: string;
       userName: string;
       actionType: string;
       action: string;
       targetEntity: string;
       description: string;
       iPAddress: string;
       userAgent: string;
       createdAt: string;
}

export interface CreateAuditLogDto {
       userId: string;
       actionType: string;
       action: string;
       targetEntity: string;
       description: string;
       iPAddress: string;
       userAgent: string;
}

export interface UpdateAuditLogDto {
       actionType: string;
       description: string;
}

export interface DeleteAuditLogsDto {
       ids: number[];
}

export interface AuditLogStatisticsDto {
       totalLogs: number;
       actionTypes: string[];
       targetEntities: string[];
       generatedAt: string;
}