import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { RoleDto, RolePagedResult } from '../../admin/role-mangement/role-mangement';
import { BehaviorSubject } from 'rxjs';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class RoleService {
  baseUrl=environment.apiUrl+"/Role";
   constructor(private http: HttpClient) { }

   private roles = new BehaviorSubject<RolePagedResult>({} as RolePagedResult);
   roles$ = this.roles.asObservable();

  getRoles() {
    return this.http.get<RolePagedResult>(`${this.baseUrl}`).subscribe(
      (result) => {
        console.log('Fetched roles:', result);
        this.roles.next(result);
      },
      (error) => {
        console.error('Error fetching roles:', error);
      }
    );
  }

  updateRole(role: RoleDto) {
    return this.http.put<RoleDto>(`${this.baseUrl}/${role.id}`, role).subscribe(
      (result) => {
        console.log('Role updated:', result);
      },
      (error) => {
        console.error('Error updating role:', error);
      }
    );
  }


  deleteRole(id: number) {
    return this.http.delete(`${this.baseUrl}/${id}`).subscribe(
      () => {
        console.log('Role deleted');
      },
      (error) => {
        console.error('Error deleting role:', error);
      }
    );
  }

  createRole(role: RoleDto) {
    return this.http.post<RoleDto>(`${this.baseUrl}`, role).subscribe(
      (result) => {
        console.log('Role created:', result);
      },
      (error) => {
        console.error('Error creating role:', error);
      }
    );
  }
}