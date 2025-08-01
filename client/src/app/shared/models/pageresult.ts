export interface PaginationParams {
       pageNumber: number;
       pageSize: number;
       search: string | null;
       sortBy: string | null;
       sortDirection: string | null;
}

export interface PagedResult<T> {
       data: T[];
       pageNumber: number;
       pageSize: number;
       totalRecords: number;
       totalPages: number;
       hasPreviousPage: boolean;
       hasNextPage: boolean;
       search: string | null;
       sortBy: string | null;
       sortDirection: string | null;
}