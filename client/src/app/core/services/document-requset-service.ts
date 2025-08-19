import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import {
  DocumentRequestDTO,
  DocumentRequestPagedResult,
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

  getDocumentRequests() {
    return this.http
      .get<DocumentRequestPagedResult>(`${this.baseUrl}`)
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

  getDocumentRequestById(id: number) {
    return this.http
      .get<DocumentRequestDTO>(`${this.baseUrl}/${id}`)
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
    return this.http
      .post<DocumentRequestDTO>(
        `${this.baseUrl}`,
        documentRequest
      )
      .subscribe(
        (result) => {
          console.log('Document request created:', result);
        },
        (error) => {
          console.error('Error creating document request:', error);
        }
      );
  }

  updateDocumentRequest(documentRequest: DocumentRequestDTO) {
    return this.http
      .put<DocumentRequestDTO>(
        `${this.baseUrl}/${documentRequest.id}`,
        documentRequest
      )
      .subscribe(
        (result) => {
          console.log('Document request updated:', result);
        },
        (error) => {
          console.error('Error updating document request:', error);
        }
      );
  }

  deleteDocumentRequest(id: number) {
    return this.http
      .delete(`${this.baseUrl}/${id}`)
      .subscribe(
        () => {
          console.log('Document request deleted');
        },
        (error) => {
          console.error('Error deleting document request:', error);
        }
      );
  }
}
