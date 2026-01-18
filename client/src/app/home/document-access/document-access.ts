import { Component, OnInit } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient, HttpClientModule, HttpParams } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { AccessRequest } from '../../admin/access-request/access-request';
import { AccessRequestCreateDto } from '../../shared/models/access-req';
import { DocumentDto } from '../../shared/models/document';
import { NgxDocViewerModule } from 'ngx-doc-viewer';
import { PdfViewerModule } from 'ng2-pdf-viewer';
import { DocumentService } from '../../core/services/document-service';

export interface AccessApproval {
  requestId: number;
  validityDuration: string; // ISO duration format, e.g., "PT24H"
}

export interface AccessLinkResponse {
  message: string;
  accessLink: string;
  expiresAt: Date;
}

@Component({
  selector: 'app-document-access',
  imports: [
    CommonModule,
    NgxDocViewerModule,
    FormsModule,
    HttpClientModule,
    NgxDocViewerModule,
    PdfViewerModule,
  ],
  templateUrl: './document-access.html',
  styleUrl: './document-access.css',
})
export class DocumentAccess implements OnInit {
  private baseUrl = environment.apiUrl + '/DocumentAccess'; // Replace with your API URL

  token: string = '';
  accessLinkResponse: AccessLinkResponse | null = null;

  errorMessage: string | null = null;
  isLoading: boolean = false;
  approval: AccessApproval = { requestId: 0, validityDuration: 'PT24H' };

  generateAccessLink() {
    this.isLoading = true;
    this.errorMessage = null;
    this.accessLinkResponse = null;
    const params = new HttpParams()
      .set('requestId', this.approval.requestId.toString())
      .set('validityDuration', this.approval.validityDuration);

    this.http
      .post<AccessLinkResponse>(`${this.baseUrl}/generate`, null, { params })
      .subscribe({
        next: (response) => {
          this.accessLinkResponse = response;
          this.isLoading = false;
        },
        error: (error) => {
          this.errorMessage =
            error.error?.message ||
            'An error occurred while generating the access link.';
          this.isLoading = false;
        },
      });
  }

  constructor(
    private http: HttpClient,
    private route: ActivatedRoute,
    private documentService: DocumentService
  ) {
    //console.log('DocumentAccess component initialized',this.documentInfo.);
    
  }

  requestAccess(
    requestData: AccessRequestCreateDto
  ): Observable<AccessRequestCreateDto> {
    return this.http.post<AccessRequestCreateDto>(
      `${this.baseUrl}/request/${requestData.documentId}`,
      requestData
    );
  }

  // Approve access request (admin/manager only)
  approveAccess(
    requestId: number,
    validityDuration: string
  ): Observable<AccessLinkResponse> {
    const approveData: AccessApproval = {
      requestId,
      validityDuration,
    };

    return this.http.post<AccessLinkResponse>(
      `${this.baseUrl}/approve/${requestId}`,
      approveData
    );
  }

  ngOnInit(): void {
    this.token = this.route.snapshot.paramMap.get('token') || '';
    this.getTokenAccessDDoc();
    console.log('Token from route:', this.token);

    const currentUrl = window.location.href;
    this.token = this.parseAccessToken(currentUrl) || '';
    this.action = this.parseAction(currentUrl);

    if (!this.token) {
      this.errorMessage = 'Invalid access link. Please check the URL.';
      this.isLoading = false;
      return;
    }

    this.validateAccess();

    this.fileurl =
      `${environment.apiUrl}/uploads/8f61d9bf-1865-4998-8239-3d5644d23e5b.pdf`;
  
  this.loadFile();
    
    
  }

  getTokenAccessDDoc() {
    this.http
      .get<AccessLinkResponse>(`${this.baseUrl}/access/${this.token}`)
      .subscribe({
        next: (response) => {
          console.log('Fetched access link:', response);
          this.accessLinkResponse = response;
        },
        error: (error) => {
          this.errorMessage =
            error.error?.message ||
            'An error occurred while fetching the access link.';
        },
      });
  }

  action!: string;

  hasAccess = false;

  documentInfo: any;

  validateAccess(): void {
    this.accessDocument(this.token, this.action).subscribe({
      next: (response: any) => {
        this.isLoading = false;
        this.hasAccess = true;
        this.documentInfo = response;
        this.getFileUrl(this.documentInfo.documentId);
      },
      error: (error: any) => {
        this.isLoading = false;
        this.hasAccess = false;
        this.errorMessage =
          error.error?.message || 'Access denied or link expired';
        console.error('Access error:', error);
      },
    });
  }

  performAction(): void {
    // Implement the actual document action based on permissions
    switch (this.action) {
      case 'read':
        this.viewDocument();
        break;
      case 'update':
        this.editDocument();
        break;
      case 'delete':
        this.deleteDocument();
        break;
    }
  }

  private viewDocument(): void {
    // Implement document viewing logic
    console.log('Viewing document with token:', this.token);
  }

  private editDocument(): void {
    // Implement document editing logic
    console.log('Editing document with token:', this.token);
  }

  private deleteDocument(): void {
    // Implement document deletion logic
    console.log('Deleting document with token:', this.token);
  }

  getPendingRequests(): Observable<AccessRequest[]> {
    return this.http.get<AccessRequest[]>(`${this.baseUrl}/pending`);
  }

  // Get user's own access requests
  getUserRequests(): Observable<AccessRequest[]> {
    return this.http.get<AccessRequest[]>(`${this.baseUrl}/my-requests`);
  }

  // Access document using token
  accessDocument(token: string, action: string): Observable<any> {
    return this.http.get(`${this.baseUrl}/access/${token}`, {
      params: { action },
    });
  }

  // Helper to convert hours to ISO duration format
  hoursToDuration(hours: number): string {
    return `PT${hours}H`;
  }

  // Helper to parse access token from URL
  parseAccessToken(url: string): string | null {
    const match = url.match(/access\/([^\/?]+)/);
    return match ? match[1] : null;
  }

  // Helper to get action from URL
  parseAction(url: string): string {
    const urlObj = new URL(url);
    return urlObj.searchParams.get('action') || 'read';
  }

  file: DocumentDto = {} as DocumentDto;
  fileurl = '';
  getGoogleViewerUrl(fileUrl: string): string {
    return `https://docs.google.com/gview?url=${fileUrl}&embedded=true`;
  }

  loadFile() {
    this.http
      .get<any>(
        `${environment.apiUrl}/Document/${this.documentInfo.documentId}`
      )
      .subscribe({
        next: (response: any) => {
          
          this.file = response.data as DocumentDto;
          console.log('File fetched successfully:', this.file);
          // this.folders = response as DocumentDto;
          this.fileurl = `${this.baseUrl}/uploads/${response.data.storagePath}`;
          console.log('File URL:', this.fileurl);
          this.fileurl =
            `${environment.apiUrl}/uploads/8f61d9bf-1865-4998-8239-3d5644d23e5b.pdf`;
          console.log('File fetched successfully:', response);
        },
        error: (error) => {
          console.error('Error fetching file:', error);
        },
      });
    this.fileurl = `${this.baseUrl}/uploads/${this.documentInfo.documentId}`;
  }

  getFileUrl(id:any) {
    console.log('Document ID:', id);
    this.documentService
      .getDocumentById(id)
      .subscribe({
        next: (response: any) => {
          console.log('Response from getDocumentById:', response);
          this.file = response.data as DocumentDto;
          console.log('File fetched successfully:', this.file);
          // this.folders = response as DocumentDto;
          this.fileurl = `${environment.apiUrl}/uploads/${response.data.storagePath}`;
          console.log('File URL:', this.fileurl);
          
          console.log('File fetched successfully:', response);
        },
        error: (error: any) => {
          console.error('Error fetching file:', error);
        },
      });
    this.fileurl = `${environment.apiUrl}/uploads/${this.documentInfo.documentId}`;
  }
}
