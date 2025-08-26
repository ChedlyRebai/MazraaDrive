import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { LoginDTO } from '../../shared/models/login';
import { Observable, ReplaySubject } from 'rxjs';
import { UserDto } from '../../shared/models/user';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  baseUrl = environment.apiUrl + '/Account';
  constructor(private http: HttpClient) {}
  login(login: LoginDTO) {
    return this.http.post(`${this.baseUrl}/login`, login , { withCredentials: true });
  }

  private currentUser=new ReplaySubject<UserDto | null>(1);
  currentUser$:Observable<UserDto | null>=this.currentUser.asObservable();

  //private
  
}
