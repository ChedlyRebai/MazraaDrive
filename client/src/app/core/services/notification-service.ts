
import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';

import { NotificationPagedResult } from '../../shared/models/Notification';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class NotificationService {
  
   baseUrl = environment.apiUrl + '/Folder';
  constructor(private http: HttpClient) {}
  getMyNotifications() {
    return this.http.get<NotificationPagedResult>(`${this.baseUrl}/my-notification`);
  }
}
