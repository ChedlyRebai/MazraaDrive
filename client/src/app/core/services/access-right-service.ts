import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { BehaviorSubject, Observable } from 'rxjs';
import {
  AccessRightDto,
  AccessRightPagedResult,
} from '../../shared/models/access-right';
import { HttpClient, HttpParams } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class AccessRightService {
  baseUrl = environment.apiUrl + '/AccessRight';

  constructor(private http: HttpClient) {}

  private accessRights = new BehaviorSubject<AccessRightPagedResult>(
    {} as AccessRightPagedResult
  );
  accessRights$ = this.accessRights.asObservable();
  getAccessRights(
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
    return this.http.get<AccessRightPagedResult>(this.baseUrl,{params}).subscribe({
      next: (result: AccessRightPagedResult) => {
        this.accessRights.next(result);
        console.log('Access rights loaded:', result.data);
      },
    });
  }

  createAccessRight(accessRight: AccessRightDto) {
    return this.http.post<AccessRightDto>(this.baseUrl, accessRight);
  }

  updateAccessRight(accessRight: AccessRightDto): Observable<AccessRightDto> {
    return this.http.put<AccessRightDto>(
      `${this.baseUrl}/${accessRight.id}`,
      accessRight
    );
  }

  deleteAccessRight(id: number): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/${id}`);
  }
}
