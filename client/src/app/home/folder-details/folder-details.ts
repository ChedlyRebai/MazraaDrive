import { CommonModule } from '@angular/common';
import { Component, CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA } from '@angular/core';
import { ActivatedRoute, RouterModule } from '@angular/router';
import { Breadcrumb } from 'primeng/breadcrumb';
import { ButtonModule } from 'primeng/button';
import { ChartModule } from 'primeng/chart';
import { FileUploadModule } from 'primeng/fileupload';
import { MenuModule } from 'primeng/menu';
import { PaginatorModule } from 'primeng/paginator';
import { TableModule } from 'primeng/table';
import { ToastModule } from 'primeng/toast';
import { ThemeSwitcher } from '../../admin/themeswitcher';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { MenuItem } from 'primeng/api';
import { FolderDTO, FolderPagedResult } from '../../shared/models/folder';

@Component({
  selector: 'app-folder-details',
   schemas: [NO_ERRORS_SCHEMA, CUSTOM_ELEMENTS_SCHEMA],
  imports: [
    Breadcrumb,
    CommonModule,
    // PrimeNG Modules
    ButtonModule,
    ThemeSwitcher,
    MenuModule,
    ChartModule,
    TableModule,
    PaginatorModule,
    FileUploadModule,
    ToastModule,
    // PrimeNG Icons
    RouterModule,],
  templateUrl: './folder-details.html',
  styleUrl: './folder-details.css'
})
export class FolderDetails {
  items: MenuItem[] | undefined;

  home: MenuItem | undefined;
  ngOnInit(): void {
    this.items = [
      { label: 'Electronics' },
      { label: 'Computer' },
      { label: 'Accessories' },
      { label: 'Keyboard' },
      { label: 'Wireless' }
    ];

    this.home = { icon: 'pi pi-home', routerLink: '/' };
    this.loadFolders();
  }

  baseUrl = environment.apiUrl;

  constructor(private http: HttpClient,private activatedRoute: ActivatedRoute) { 
    
  }
  folders: FolderDTO = {} as FolderDTO;
  
  loadFolders() {
     const id = this.activatedRoute.snapshot.paramMap.get('id');
     this.http.get<FolderDTO>(`${this.baseUrl}/Folder/${id}`).subscribe({
       next: (response:any) => {
         this.folders = response.data;
         console.log('Folders fetched successfully:', response);
       },
       error: (error) => {
         console.error('Error fetching folders:', error);
       }
     });
  }

}
