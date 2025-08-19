import { FolderDTO, UpdateFolderDTO } from './../../shared/models/folder';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { FolderPagedResult } from '../../shared/models/folder';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class FolderService {
  baseUrl=environment.apiUrl+"/Folder"
   constructor(private http: HttpClient) { }

       private folders = new BehaviorSubject<FolderPagedResult>({} as FolderPagedResult);
          folders$ = this.folders.asObservable();

  getFolders() {
    return this.http.get<FolderPagedResult>(`${this.baseUrl}`).subscribe(
      (result) => {
        this.folders.next(result);
      },
      (error) => {
        console.error('Error fetching folders:', error);
      }
    );
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

  deleteFolder(id: number) {
    return this.http.delete(`${this.baseUrl}/${id}`).subscribe(
      () => {
        console.log('Folder deleted');
      },
      (error) => {
        console.error('Error deleting folder:', error);
      }
    );
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

}
