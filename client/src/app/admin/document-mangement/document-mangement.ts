import { DocumentService } from './../../core/services/document-service';
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MessageService, ConfirmationService } from 'primeng/api';
import { HttpClient } from '@angular/common/http';

// PrimeNG Imports
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { ToastModule } from 'primeng/toast';
import { ToolbarModule } from 'primeng/toolbar';
import { DialogModule } from 'primeng/dialog';
import { InputTextModule } from 'primeng/inputtext';
import { TextareaModule } from 'primeng/textarea';

import { RadioButtonModule } from 'primeng/radiobutton';

import { FileUploadModule } from 'primeng/fileupload';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { TagModule } from 'primeng/tag';
import { AvatarModule } from 'primeng/avatar';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { TooltipModule } from 'primeng/tooltip';
import { ThemeSwitcher } from '../themeswitcher';
import { AutoCompleteModule } from 'primeng/autocomplete';

import { DatePickerModule } from 'primeng/datepicker';
import { DocumentDto } from '../../shared/models/document';
import { NgxDocViewerModule } from 'ngx-doc-viewer';
import { Observable } from 'rxjs';

interface Document {
  id?: number;
  name: string;
  category: string;
  type: string;
  size: number;
  description?: string;
  tags?: string[];
  status: string;
  accessLevel: string;
  uploadedBy: string;
  uploadedAt: Date;
  expirationDate?: Date;
  version?: string;
  filePath?: string;
  isActive: boolean;
}

@Component({
  selector: 'app-document-management',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    TableModule,
    ButtonModule,
    ToastModule,
    ToolbarModule,
    DialogModule,
    InputTextModule,
    TextareaModule,
    AutoCompleteModule,
    DatePickerModule,
    RadioButtonModule,
    FileUploadModule,
    ConfirmDialogModule,
    TagModule,
    AvatarModule,
    IconFieldModule,
    InputIconModule,
    TooltipModule,
    ThemeSwitcher,
    NgxDocViewerModule,
  ],
  providers: [MessageService, ConfirmationService],
  templateUrl: './document-mangement.html',
  styleUrls: ['./document-mangement.css'],
})
export class DocumentMangement implements OnInit {
  documents: DocumentDto[] = [];
  selectedDocuments: DocumentDto[] = [];
  selectedDocument: DocumentDto | null = null;
  document: DocumentDto = this.getEmptyDocument();

  documentDialog = false;
  previewDialog = false;
  submitted = false;
  loading = false;
  saving = false;

  selectedFile: File | null = null;

  categories = [
    'Rapports',
    'Contrats',
    'Factures',
    'Certificats',
    'Politiques',
    'Procédures',
    'Formulaires',
    'Images',
    'Autres',
  ];

  statuses = ['Actif', 'Archivé', 'Brouillon', 'En révision', 'Expiré'];

  private baseUrl = 'http://localhost:5108/api';

  constructor(
    public DocumentService: DocumentService,
    private messageService: MessageService,
    private confirmationService: ConfirmationService,
    private http: HttpClient
  ) {}

  ngOnInit() {
    this.loadDocuments();
    this.DocumentService.getDocument();
  }

  get dialogTitle(): string {
    return this.document.id ? 'Modifier le document' : 'Nouveau document';
  }

  loadDocuments() {
    this.loading = true;

    // Mock data for demonstration
    // setTimeout(() => {
    //   this.documents = [
    //     {
    //       id: 1,
    //       name: 'Rapport Mensuel Janvier 2024.pdf',
    //       category: 'Rapports',
    //       type: 'PDF',
    //       size: 2457600, // 2.4 MB
    //       description: 'Rapport mensuel des activités de janvier',
    //       tags: ['rapport', 'janvier', '2024'],
    //       status: 'Actif',
    //       accessLevel: 'Public',
    //       uploadedBy: 'Chedly Rebai',
    //       uploadedAt: new Date('2024-02-01'),
    //       version: '1.0',
    //       isActive: true
    //     },
    //     {
    //       id: 2,
    //       name: 'Contrat Employé - Marie Martin.docx',
    //       category: 'Contrats',
    //       type: 'DOCX',
    //       size: 524288, // 512 KB
    //       description: 'Contrat de travail pour Marie Martin',
    //       tags: ['contrat', 'emploi', 'marie-martin'],
    //       status: 'Actif',
    //       accessLevel: 'Confidential',
    //       uploadedBy: 'Admin RH',
    //       uploadedAt: new Date('2024-01-15'),
    //       version: '2.1',
    //       isActive: true
    //     },
    //     {
    //       id: 3,
    //       name: 'Politique de Sécurité IT.pdf',
    //       category: 'Politiques',
    //       type: 'PDF',
    //       size: 1048576, // 1 MB
    //       description: 'Document de politique de sécurité informatique',
    //       tags: ['politique', 'sécurité', 'IT'],
    //       status: 'En révision',
    //       accessLevel: 'Restricted',
    //       uploadedBy: 'Chef IT',
    //       uploadedAt: new Date('2024-01-20'),
    //       expirationDate: new Date('2024-12-31'),
    //       version: '3.0',
    //       isActive: true
    //     },
    //     {
    //       id: 4,
    //       name: 'Facture Fournisseur ABC-001.pdf',
    //       category: 'Factures',
    //       type: 'PDF',
    //       size: 204800, // 200 KB
    //       description: 'Facture du fournisseur ABC pour commande 001',
    //       tags: ['facture', 'ABC', 'commande-001'],
    //       status: 'Archivé',
    //       accessLevel: 'Private',
    //       uploadedBy: 'Comptable',
    //       uploadedAt: new Date('2023-12-15'),
    //       version: '1.0',
    //       isActive: true
    //     }
    //   ];
    //   this.loading = false;
    // }, 1000);
  }

  PageSize?: number = 5;
  Search?: string = '';
  PageNumber?: number = 1;
  SortBy?: string = '';
  SortDirection?: string = '';
  getAllDocs() {
    this.DocumentService.getDocument(
      this.PageSize,
      this.Search,
      this.PageNumber,
      this.SortBy,
      this.SortDirection
    );
    //   .subscribe({
    //     next: (response: any) => {
    //       this.PageNumber = response.pageNumber;
    //       this.PageSize = response.pageSize;
    //       this.departments = response.data;
    //       this.totalRecords = response.totalRecords;
    //       this.totalDepartments = response.totalDepartments;
    //       this.totalUsers = response.totalUsers;
    //       this.avgUsersPerDepartment = Math.round(
    //         this.totalUsers / this.totalDepartments
    //       );
    //     },
    //   });
  }

  onPageChange(event: any) {
    // this.first = event.first;
    this.PageNumber = event.first / event.rows + 1;
    this.PageSize = event.rows;
    this.getAllDocs();
  }
  openNew() {
    this.document = this.getEmptyDocument();
    this.selectedFile = null;
    this.submitted = false;
    this.documentDialog = true;
  }

  editDocument(document: DocumentDto) {
    this.document = { ...document };
    this.documentDialog = true;
  }

  viewDocument(document: DocumentDto) {
    this.selectedDocument = document;
    this.previewDialog = true;
  }

  deleteDocument(document: Document) {
    this.confirmationService.confirm({
      message: `Êtes-vous sûr de vouloir supprimer "${document.name}"?`,
      header: 'Confirmer la suppression',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.documents = this.documents.filter((d) => d.id !== document.id);
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Document supprimé avec succès',
        });
      },
    });
  }

  deleteSelectedDocuments() {
    this.confirmationService.confirm({
      message: `Êtes-vous sûr de vouloir supprimer ${this.selectedDocuments.length} document(s)?`,
      header: 'Confirmer la suppression',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.documents = this.documents.filter(
          (d) => !this.selectedDocuments.includes(d)
        );
        this.selectedDocuments = [];
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Documents supprimés avec succès',
        });
      },
    });
  }

  downloadDocument(document: DocumentDto) {
    //download file from this path http://localhost:5108/api/uploads/${selectedDocument.storagePath}
    this.http
      .get(`http://localhost:5108/api/uploads/${document.storagePath}`, {
        responseType: 'blob',
      })
      .subscribe((blob) => {
        window.open(
          `http://localhost:5108/api/uploads/${document.storagePath}`
        );
        console.log(blob);
      });

    // window.Infinityr(`(`http://localhost:5108/api/uploads/${document.storagePath}`, '_blank');
    // window.history.pushState(null, '', `http://localhost:5108/api/uploads/${document.storagePath}`);
    this.messageService.add({
      severity: 'info',
      summary: 'Téléchargement',
      detail: `Téléchargement de "${document.name}" en cours...`,
    });

    // In real implementation, you would call your API to get the file
    // this.http.get(`${this.baseUrl}/Document/${document.id}/download`, { responseType: 'blob' })
  }

  saveDocument() {
    this.submitted = true;

    if (!this.isDocumentValid()) {
      return;
    }

    this.saving = true;

    if (this.document.id) {
      // Update existing document
      
      this.http
        .put(`${this.baseUrl}/Document/${this.document.id}`, this.document)
        .subscribe({
          next: () => {
            this.messageService.add({
              severity: 'success',
              summary: 'Succès',
              detail: 'Document modifié avec succès',
            });
            this.getAllDocs();
            this.saving = false;
            this.hideDialog()
            this.documentDialog = false;
          },
          error: () => {
            this.messageService.add({
              severity: 'error',
              summary: 'Erreur',
              detail: 'Erreur lors de la modification du document',
            });
          },
        });
    } else {
      // Create new document
      this.http.post(`${this.baseUrl}/Document`, this.document).subscribe({
        next: () => {
          this.messageService.add({
            severity: 'success',
            summary: 'Succès',
            detail: 'Document créé avec succès',
          });
          this.getAllDocs();
          this.hideDialog()
          this.saving = false;
          this.documentDialog = false;
        },
        error: () => {
          this.messageService.add({
            severity: 'error',
            summary: 'Erreur',
            detail: 'Erreur lors de la création du document',
          });
        },
      });
    }
  }

  hideDialog() {
    this.documentDialog = false;
    this.submitted = false;
    this.document = this.getEmptyDocument();
    this.selectedFile = null;
  }

  onFileSelect(event: any) {
    this.selectedFile = event.files[0];
    if (this.selectedFile && !this.document.name) {
      this.document.name = this.selectedFile.name;
    }
  }

  onImportDocuments(event: any) {
    const files = event.files;
    this.messageService.add({
      severity: 'info',
      summary: 'Import',
      detail: `${files.length} fichier(s) importé(s)`,
    });
  }

  exportDocuments() {
    this.messageService.add({
      severity: 'info',
      summary: 'Export',
      detail: 'Export des documents en cours...',
    });
  }

  // Utility methods
  getEmptyDocument(): DocumentDto {
    return {} as DocumentDto;
  }

  isDocumentValid(): boolean {
    return !!(
      this.document.name?.trim() &&
      (this.document.id || this.selectedFile)
    );
  }

  getFileIcon(type: string): string {
    const typeMap: { [key: string]: string } = {
      PDF: 'pi pi-file-pdf text-red-500',
      DOC: 'pi pi-file-word text-blue-500',
      DOCX: 'pi pi-file-word text-blue-500',
      XLS: 'pi pi-file-excel text-green-500',
      XLSX: 'pi pi-file-excel text-green-500',
      JPG: 'pi pi-image text-purple-500',
      JPEG: 'pi pi-image text-purple-500',
      PNG: 'pi pi-image text-purple-500',
      TXT: 'pi pi-file text-gray-500',
      ZIP: 'pi pi-file text-yellow-500',
    };
    return typeMap[type?.toUpperCase()] || 'pi pi-file text-gray-500';
  }

  getFileExtension(filename: string): string {
    return filename.split('.').pop()?.toUpperCase() || '';
  }

  formatFileSize(bytes: number): string {
    if (bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
  }

  getInitials(name: string): string {
    return name
      .split(' ')
      .map((word) => word.charAt(0))
      .join('')
      .toUpperCase()
      .slice(0, 2);
  }

  getStatusSeverity(status: string): string {
    switch (status) {
      case 'Actif':
        return 'success';
      case 'Archivé':
        return 'secondary';
      case 'Brouillon':
        return 'warning';
      case 'En révision':
        return 'info';
      case 'Expiré':
        return 'danger';
      default:
        return 'info';
    }
  }
}
