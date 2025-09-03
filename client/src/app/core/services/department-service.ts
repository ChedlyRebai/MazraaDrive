import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { DepartmentDto } from './Hub/DepartmentRealtimeService';
import { BehaviorSubject } from 'rxjs';
import {
  DepartmentCreateDTO,
  DepartmentPagedResult,
} from '../../shared/models/department';
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
  getDepartments(
    PageSize?: number,
    Search?: string,
    PageNNumber?: number,
    SortBy?: string,
    SortDirection?: string
  ) {
    let params = new HttpParams();

    if (PageSize) {
      console.log('PageSize in service:', PageSize);
      params = params.set('PageSize', PageSize.toString());
    }

    if (Search) {
      params = params.set('Search', Search);
    }

    if (PageNNumber) {
      console.log('PageNNumber in service:', PageNNumber);
      params = params.set('PageNumber', PageNNumber.toString());
    }

    if (SortBy) {
      params = params.set('SortBy', SortBy);
    }
    if (SortDirection) {
      params = params.set('SortDirection', SortDirection);
    }

    return this.http.get<DepartmentPagedResult>(`${this.baseUrl}`, { params });
  }

  getDepartmentById(id: number) {
    return this.http.get<DepartmentDto>(`${this.baseUrl}/${id}`).subscribe(
      (result) => {
        console.log('Department fetched:', result);
      },
      (error) => {
        console.error('Error fetching department:', error);
      }
    );
  }
  
  

  createDepartment(department: DepartmentCreateDTO) {
    return this.http.post<DepartmentDto>(`${this.baseUrl}`, department);
  }

  updateDepartment(department: DepartmentDto) {
    return this.http.put<DepartmentDto>(
      `${this.baseUrl}/${department.id}`,
      department
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

  getDepartmentForSealection(id: number) {
    return this.http.get<DepartmentDto>(`${this.baseUrl}/${id}`).subscribe(
      (result) => {
        console.log('Department fetched:', result);
      },
      (error) => {
        console.error('Error fetching department:', error);
      }
    );
  }

  getSearchDepartments(searchTerm: string) {
    return this.http.get<DepartmentDto[]>(
      `${this.baseUrl}/search/${searchTerm}`
    );
  }
}
