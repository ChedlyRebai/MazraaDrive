import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { LoginDTO } from '../../shared/models/login';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  baseUrl = environment.apiUrl + '/Account';

  constructor(private http: HttpClient) {}

  login(login: LoginDTO) {
    return this.http.post(`${this.baseUrl}/login`, login);
  }
}
