import { AccessRequest } from './../../admin/access-request/access-request';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { BehaviorSubject } from 'rxjs';
import { AccessRequestCreateDto, AccessRequestDto, AccessRequestPagedResult } from '../../shared/models/access-req';

@Injectable({
  providedIn: 'root'
})
export class AccessRequsetService {
  baseUrl= environment.apiUrl + '/AccessRequests'
  constructor(private http:HttpClient){

  }

  private accessRequest=new BehaviorSubject<AccessRequestPagedResult>({} as AccessRequestPagedResult);
  accessRequest$ = this.accessRequest.asObservable();

  getAccessRequests(PageSize?: number,
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
      console.log(Search,'lllllllllll');
      params = params.append('Search', Search.toString());
    }

    if(SortBy){
      params = params.append('SortBy', SortBy);
    }

    if(SortDirection){
      params = params.append('SortDirection', SortDirection);
    }

    return this.http.get<AccessRequestPagedResult>(this.baseUrl, { params,withCredentials: true })
  }


  createAccessRequest(dto: AccessRequestCreateDto) {
    return this.http.post(this.baseUrl, dto,{withCredentials: true});
  }

  getAccessMyRequests(PageSize?: number,
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
      console.log(Search,'lllllllllllfffffffffffffffffff');
      params = params.append('Search', Search.toString());
    }

    if(SortBy){
      params = params.append('SortBy', SortBy);
    }

    if(SortDirection){
      params = params.append('SortDirection', SortDirection);
    }
    
    return this.http.get<AccessRequestPagedResult>('http://localhost:5108/api/AccessRequests/my-requests', { params,withCredentials: true })
  }


  deleteAccessRequest(id: number) {
    return this.http.delete(`${this.baseUrl}/${id}`, { withCredentials: true });
  }


  decide(id: number, approve: boolean) {
    const decision: any = {
      "approve": approve
    };
    return this.http.post(`${this.baseUrl}/${id}/decision`, decision, { withCredentials: true });
  }

}
