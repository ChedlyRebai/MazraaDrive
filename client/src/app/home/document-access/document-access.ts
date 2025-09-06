import { Component } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@microsoft/signalr';


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
  imports: [],
  templateUrl: './document-access.html',
  styleUrl: './document-access.css'
})

export class DocumentAccess {

  private baseUrl = environment.apiUrl+'/documentaccess'; // Replace with your API URL

  constructor(private http: HttpClient) {

  }

  // requestAccess(approval: AccessApproval): Observable<AccessLinkResponse> {
  //   return this.http.post<AccessLinkResponse>(`${this.baseUrl}/access`, approval);
  // }

}
