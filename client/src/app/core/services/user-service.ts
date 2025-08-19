import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { UserPagedResult } from '../../shared/models/user';
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
   getUsers() {
       return this.http.get<UserPagedResult>(`${this.baseUrl}`).subscribe(
         (result) => {
           console.log('Fetched users:', result);
           this.users.next(result);
         },
         (error) => {
           console.error('Error fetching users:', error);
         }
       );
     }
}
