import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { DepartmentDto } from './Hub/DepartmentRealtimeService';
import { BehaviorSubject } from 'rxjs';
import { DepartmentPagedResult } from '../../shared/models/department';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class DepartmentService {
  baseUrl = environment.apiUrl + '/Department';
  constructor(private http: HttpClient) {}
  private departments = new BehaviorSubject<DepartmentPagedResult>(
    {} as DepartmentPagedResult
  );
  departments$ = this.departments.asObservable();
  getDepartments() {
    return this.http
      .get<DepartmentPagedResult>(`${this.baseUrl}`)
      .subscribe(
        (result) => {
          console.log('Departments fetched:', result);
          this.departments.next(result);
        },
        (error) => {
          console.error('Error fetching departments:', error);
        }
      );
  }

  getDepartmentById(id: number) {
    return this.http
      .get<DepartmentDto>(`${this.baseUrl}/${id}`)
      .subscribe(
        (result) => {
          console.log('Department fetched:', result);
        },
        (error) => {
          console.error('Error fetching department:', error);
        }
      );
  }

  createDepartment(department: DepartmentDto) {
    return this.http
      .post<DepartmentDto>(`${this.baseUrl}`, department)
      .subscribe(
        (result) => {
          console.log('Department created:', result);
        },
        (error) => {
          console.error('Error creating department:', error);
        }
      );
  }

  updateDepartment(department: DepartmentDto) {
    return this.http
      .put<DepartmentDto>(
        `${this.baseUrl}/${department.id}`,
        department
      )
      .subscribe(
        (result) => {
          console.log('Department updated:', result);
        },
        (error) => {
          console.error('Error updating department:', error);
        }
      );
  }

  deleteDepartment(id: number) {
    return this.http.delete(`${this.baseUrl}/${id}`).subscribe(
      () => {
        console.log('Department deleted');
      },
      (error) => {
        console.error('Error deleting department:', error);
      }
    );
  }
}
