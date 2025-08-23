import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { CreateUserDto, UserPagedResult } from '../../shared/models/user';
import { BehaviorSubject } from 'rxjs';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class UserService {
   constructor(private http: HttpClient) { }

   baseUrl=environment.apiUrl+"/User"
   private users = new BehaviorSubject<UserPagedResult>({} as UserPagedResult);
   users$ = this.users.asObservable();
   getUsers(PageSize?: number,
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
       return this.http.get<UserPagedResult>(`${this.baseUrl}`,{params}).subscribe(
         (result) => {
           console.log('Fetched users:', result);
           this.users.next(result);
         },
         (error) => {
           console.error('Error fetching users:', error);
         }
       );
     }

     createUser(newUser:CreateUserDto){
       return this.http.post(`${this.baseUrl}`, newUser)
     }
}
