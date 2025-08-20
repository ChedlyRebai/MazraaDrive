import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient, HttpParams } from '@angular/common/http';
import { BehaviorSubject } from 'rxjs';
import { DocumentFilterDto, DocumentPagedResult } from '../../shared/models/document';

@Injectable({
  providedIn: 'root'
})
export class DocumentService {
    baseUrl = environment.apiUrl + '/Document';
  constructor(private http: HttpClient) {}

  private documentRequest = new BehaviorSubject<DocumentPagedResult>(
    {} as DocumentPagedResult
  );
  documentRequests$ = this.documentRequest.asObservable();

  getDocument(PageSize?: number,
    Search?: string,
    PageNumber?: number,
    SortBy?: string,
    SortDirection?: string) {
    let params = new HttpParams();

    if(PageSize){
      params = params.append('PageSize', PageSize.toString());
    }

    if(PageNumber){
      params = params.append('PageNumber', PageNumber.toString());
    }

    if(Search){
      params = params.append('Search', Search.toString());
    }

    if(SortBy){
      params = params.append('SortBy', SortBy);
    }

    if(SortDirection){
      params = params.append('SortDirection', SortDirection);
    }
    return this.http
      .get<DocumentPagedResult>(`${this.baseUrl}`,{params})
      .subscribe(
        (result) => {
          console.log('Document  fetched:', result);
          this.documentRequest.next(result);
        },
        (error) => {
          console.error('Error fetching document requests:', error);
        }
      );
  }

  
}
