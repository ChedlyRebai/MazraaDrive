import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import {
  DocumentRequestDTO,
  DocumentRequestPagedResult,
  DocumentRequestStatsDto,
  UpdateDocumentRequestDTO,
} from '../../shared/models/docrequest';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class DocumentRequsetService {
  baseUrl = environment.apiUrl + '/DocumentRequest';
  constructor(private http: HttpClient) {}

  private documentRequest = new BehaviorSubject<DocumentRequestPagedResult>(
    {} as DocumentRequestPagedResult
  );
  documentRequests$ = this.documentRequest.asObservable();

  getDocumentRequests(
    PageSize?: number,
    Search?: string,
    PageNumber?: number,
    SortBy?: string,
    SortDirection?: string
  ) {
    let params = new HttpParams();

    if (PageSize) {
      params = params.append('PageSize', PageSize.toString());
      console.log('PageSize:', PageSize);
    }

    if (PageNumber) {
      params = params.append('PageNumber', PageNumber.toString());
      console.log('PageNumber:', PageNumber);
    }

    if (Search) {
      params = params.append('Search', Search.toString());
    }

    if (SortBy) {
      params = params.append('SortBy', SortBy);
    }

    if (SortDirection) {
      params = params.append('SortDirection', SortDirection);
    }
    return this.http
      .get<DocumentRequestPagedResult>(`${this.baseUrl}`, {
        params,
        withCredentials: true,
      })
      .subscribe(
        (result) => {
          console.log('Document requests fetched:', result);
          this.documentRequest.next(result);
        },
        (error) => {
          console.error('Error fetching document requests:', error);
        }
      );
  }

  getMyDepartmentDocumentRequests(
    PageSize?: number,
    Search?: string,
    PageNumber?: number,
    SortBy?: string,
    SortDirection?: string
  ) {
    let params = new HttpParams();

    if (PageSize) {
      params = params.append('PageSize', PageSize.toString());
      console.log('PageSize:', PageSize);
    }
    if (PageNumber) {
      params = params.append('PageNumber', PageNumber.toString());
      console.log('PageNumber:', PageNumber);
    }
    if (Search) {
      params = params.append('Search', Search.toString());
    }
    if (SortBy) {
      params = params.append('SortBy', SortBy);
    }
    if (SortDirection) {
      params = params.append('SortDirection', SortDirection);
    }
    return this.http.get<DocumentRequestPagedResult>(
      `${this.baseUrl}/GetMyDepartmentDocumentRequests`,
      { params, withCredentials: true }
    );
  }

  getDocumentRequestById(id: number) {
    return this.http
      .get<DocumentRequestDTO>(`${this.baseUrl}/${id}`, {
        withCredentials: true,
      })
      .subscribe(
        (result) => {
          console.log('Document request fetched:', result);
        },
        (error) => {
          console.error('Error fetching document request:', error);
        }
      );
  }

  createDocumentRequest(documentRequest: DocumentRequestDTO) {
    return this.http.post<DocumentRequestDTO>(
      `http://localhost:5108/api/DocumentRequest`,
      documentRequest,
      { withCredentials: true }
    );
  }

  updateDocumentRequest(documentRequest: DocumentRequestDTO, id: number) {
    return this.http.put<UpdateDocumentRequestDTO>(
      `${this.baseUrl}/${id}`,
      documentRequest,
      { withCredentials: true }
    );
  }

  deleteDocumentRequest(id: number) {
    return this.http.delete(`${this.baseUrl}/${id}`);
  }

  getMyDocumentRequestStats() {
    return this.http.get<DocumentRequestStatsDto>(
      `${this.baseUrl}/document-req-stats`,
      {
        withCredentials: true,
      }
    );
  }

  getMyDocumentRequests(
    PageSize?: number,
    Search?: string,
    PageNumber?: number,
    SortBy?: string,
    SortDirection?: string
  ) {
    let params = new HttpParams();

    if (PageSize) {
      params = params.append('PageSize', PageSize.toString());
      console.log('PageSize:', PageSize);
    }
    if (PageNumber) {
      params = params.append('PageNumber', PageNumber.toString());
      console.log('PageNumber:', PageNumber);
    }
    if (Search) {
      params = params.append('Search', Search.toString());
    }
    if (SortBy) {
      params = params.append('SortBy', SortBy);
    }
    if (SortDirection) {
      params = params.append('SortDirection', SortDirection);
    }
    return this.http.get<DocumentRequestPagedResult>(
      `${this.baseUrl}/my-requests`,
      { params, withCredentials: true }
    );
  }
}
