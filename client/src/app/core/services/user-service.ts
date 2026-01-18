import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { CreateUserDto, UserPagedResult } from '../../shared/models/user';
import { BehaviorSubject } from 'rxjs';
import { environment } from '../../../environments/environment';
import { CookieService } from 'ngx-cookie-service';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  constructor(private http: HttpClient, private cookiesService: CookieService) {}


  currentUser = {
    id: "",
    departmentId: 0,
    role: "",
    name: "",
    avatar: "/assets/avatar.png"
  };

  baseUrl = environment.apiUrl + '/User';
  private users = new BehaviorSubject<UserPagedResult>({} as UserPagedResult);
  users$ = this.users.asObservable();
  getUsers(
    PageSize?: number,
    Search?: string,
    PageNumber?: number,
    SortBy?: string,
    SortDirection?: string
  ) {
    let params = new HttpParams();

    if (PageSize) {
      params = params.append('PageSize', PageSize.toString());
    }

    if (PageNumber) {
      params = params.append('PageNumber', PageNumber.toString());
    }

    if (Search) {
      params = params.append('Search', Search.toString());
    }

    if (SortBy) {
      params = params.append('SortBy', SortBy);
    }

    if (SortDirection) {
      params = params.append('SortDirection', SortDirection);
    }
    return this.http
      .get<UserPagedResult>(`${this.baseUrl}`, { params })
      .subscribe(
        (result) => {
          console.log('Fetched users:', result);
          this.users.next(result);
        },
        (error) => {
          console.error('Error fetching users:', error);
        }
      );
  }

  createUser(newUser: CreateUserDto) {
    return this.http.post(`${this.baseUrl}`, newUser);
  }

  deleteUser(userId: string) {
    return this.http.delete(`${this.baseUrl}/${userId}`);
  }

  updateUser(userId: string, updatedUser: CreateUserDto) {
    return this.http.put(`${this.baseUrl}/${userId}`, updatedUser);
  }

  logout(){
     
  const token = this.cookiesService.delete('token');
  console.log(token);
  window.location.href = '/login';
  }

  getCurrentUser() {
    return this.http.get(`${environment.apiUrl}/Account/me`, { withCredentials: true }).subscribe((user: any) => {
      console.log("current user:",user);
      this.currentUser = {
        id: user.id,
        departmentId: user.departmentId,
        name: user.name,
        role: user.role,
        avatar: user.avatar || '/assets/avatar.png',
      };
    }
    );
  }
}
