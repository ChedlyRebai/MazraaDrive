import { FolderDTO, UpdateFolderDTO } from './../../shared/models/folder';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { FolderPagedResult } from '../../shared/models/folder';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class FolderService {
  baseUrl = environment.apiUrl + '/Folder';
  constructor(private http: HttpClient) {}

  private folders = new BehaviorSubject<FolderPagedResult>(
    {} as FolderPagedResult
  );
  folders$ = this.folders.asObservable();

  getFolders(PageSize?: number,
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
    return this.http.get<FolderPagedResult>(`${this.baseUrl}`, { params }).subscribe(
      (result) => {
        this.folders.next(result);
        console.log(result);
      },
      (error) => {
        console.error('Error fetching folders:', error);
      }
    );
  }


 UpdateFolder(editfolder:any){
   return this.http.put<UpdateFolderDTO>(`${this.baseUrl}/${editfolder.id}`, editfolder)
 }
  // UpdateFolder(folder: UpdateFolderDTO) {
  //   return this.http.put<UpdateFolderDTO>(`${this.baseUrl}/${folder.id}`, folder).subscribe(
  //     (result) => {
  //       console.log('Folder updated:', result);
  //     },
  //     (error) => {
  //       console.error('Error updating folder:', error);
  //     }
  //   );
  // }

  deleteFolder(id: string) {
    return this.http.delete(`${this.baseUrl}/${id}`)
  }

  getFolderById(id: number) {
    return this.http.get<FolderDTO>(`${this.baseUrl}/${id}`).subscribe(
      (result) => {
        console.log('Folder fetched:', result);
      },
      (error) => {
        console.error('Error fetching folder:', error);
      }
    );
  }

  getSubFolders(folderId: number) {
    return this.http.get<FolderPagedResult>(`${this.baseUrl}/id/${folderId}`)
  }

  getMyFolders(){
    return this.http.get<FolderPagedResult>(
      `${this.baseUrl}/my-folders`
    );
  }

  CreateFolder(newFolder :any){
    return this.http.post<FolderDTO>(`${this.baseUrl}`, newFolder)
  }

}
