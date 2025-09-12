
import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';

import { NotificationPagedResult } from '../../shared/models/Notification';
import { HttpClient, HttpParams } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class NotificationService {
  
   baseUrl = environment.apiUrl + '/Notification';
  constructor(private http: HttpClient) {}
  getMyNotifications(
    PageSize?: number,
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
   
    return this.http.get<NotificationPagedResult>(`${this.baseUrl}/my-notification`,{withCredentials:true, params});
  }
}
