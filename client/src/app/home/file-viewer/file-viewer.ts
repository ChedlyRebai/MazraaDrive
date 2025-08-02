import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { NgxDocViewerModule } from 'ngx-doc-viewer';
import { MenuItem } from 'primeng/api';
import { PdfViewerModule } from 'ng2-pdf-viewer';
import { environment } from '../../../environments/environment';
import { FolderDTO } from '../../shared/models/folder';
import { DocumentDto } from '../../shared/models/document';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-file-viewer',
  imports: [NgxDocViewerModule,PdfViewerModule,CommonModule],
  templateUrl: './file-viewer.html',
  styleUrl: './file-viewer.css'
})
export class FileViewer {
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
    this.loadFile();
  }
  file: DocumentDto = {} as DocumentDto;
  baseUrl = environment.apiUrl;
  fileurl=""
  constructor(private http: HttpClient,private activatedRoute: ActivatedRoute) { 
    
  }

  getGoogleViewerUrl(fileUrl: string): string {
    return `https://docs.google.com/gview?url=${fileUrl}&embedded=true`;
  }
  
  loadFile() {
     const id = this.activatedRoute.snapshot.paramMap.get('id');
     this.http.get<any>(`http://localhost:5108/api/Document/${id}`).subscribe({
      next: (response:any) => {

        
        this.file = response.data as DocumentDto;
        console.log('File fetched successfully:', this.file);
        // this.folders = response as DocumentDto;
       this.fileurl= `${this.baseUrl}/uploads/${response.data.storagePath}`;
        console.log('File URL:', this.fileurl);
        console.log('File fetched successfully:', response);
      },
      error: (error) => {
        console.error('Error fetching file:', error);
      }
    });
     this.fileurl = `${this.baseUrl}/uploads/${id}`;
  }
}
