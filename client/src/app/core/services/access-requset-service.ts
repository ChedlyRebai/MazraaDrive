import { AccessRequest } from './../../admin/access-request/access-request';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { BehaviorSubject } from 'rxjs';
import { AccessRequestDto, AccessRequestPagedResult } from '../../shared/models/access-req';

@Injectable({
  providedIn: 'root'
})
export class AccessRequsetService {
  baseUrl= environment.apiUrl + '/AccessRequests'
  constructor(private http:HttpClient){

  }

  private accessRequest=new BehaviorSubject<AccessRequestPagedResult>({} as AccessRequestPagedResult);
  accessRequest$ = this.accessRequest.asObservable();

  getAccessRequests(PageNumber?:number, PageSize?:number,Search?:number,SortBy?:string,sortDirection?:string) {
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

    if(sortDirection){
      params = params.append('sortDirection', sortDirection);
    }

    return this.http.get<AccessRequestPagedResult>(this.baseUrl, { params }).subscribe({
      next:(accesReq:AccessRequestPagedResult)=>{
        this.accessRequest.next(accesReq as AccessRequestPagedResult);
        console.log(accesReq.data);
      }
    })
  }


}
