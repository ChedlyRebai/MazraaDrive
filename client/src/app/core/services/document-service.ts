import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
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

  getDocument() {
    return this.http
      .get<DocumentPagedResult>(`${this.baseUrl}`)
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
