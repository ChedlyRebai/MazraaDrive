import { DocumentService } from './../../core/services/document-service';
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
/* PrimeNG */
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { DialogModule } from 'primeng/dialog';
import { TagModule } from 'primeng/tag';
import { ToastModule } from 'primeng/toast';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { AutoCompleteModule } from 'primeng/autocomplete';
import { CheckboxModule } from 'primeng/checkbox';
import { InputTextModule } from 'primeng/inputtext';
import { AvatarModule } from 'primeng/avatar';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { MessageService, ConfirmationService } from 'primeng/api';
import { AccessRequestCreateDto, AccessRequestDto, AccessRequestPagedResult } from '../../shared/models/access-req';
import { ThemeSwitcher } from '../../admin/themeswitcher';
import { AccessRequsetService } from '../../core/services/access-requset-service';


interface DocumentLookup {
  id: number;
  name: string;
}
@Component({
  selector: 'app-access-requests',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    TableModule,
    ButtonModule,
    DialogModule,
    TagModule,
    ToastModule,
    ConfirmDialogModule,
    AutoCompleteModule,
    CheckboxModule,
    InputTextModule,
    AvatarModule,
    IconFieldModule,
    InputIconModule,
    ThemeSwitcher
  ],
  templateUrl: './access.html',
  styleUrls: ['./access.css'],
  providers: [MessageService, ConfirmationService]
})

export class Access implements OnInit {
  // Data
  requests: AccessRequestDto[] = [];
  totalRecords = 0;

  // Pagination / query
  pageNumber = 1;
  pageSize = 15;
  statusFilter: string | null = null;
  searchTerm = '';
  sort: string | null = null;

  loading = false;

  // Stats
  totalRequests = 0;
  pendingRequests = 0;
  approvedRequests = 0;
  rejectedRequests = 0;

  // Dialogs
  createDialog = false;
  detailsDialog = false;

  // Selection
  selectedRequest: AccessRequestDto | null = null;

  // Create form
  newRequest: {
    documentId: number | null;
    document: DocumentLookup | null;
       documentName: string | null;
    requestRead: boolean;
    requestWrite: boolean;
    requestDelete: boolean;
    message: string | null;
  } = {
    documentName: null,
    documentId: null,
    document: null,
    requestRead: true,
    requestWrite: false,
    requestDelete: false,
    message: null
  };

  documentSuggestions: any[] = [];

  validationErrors: string[] = [];
  creatingRequest = false;

  constructor(
    private documentService: DocumentService,
    private accessRequestService:AccessRequsetService,
   // private svc: AccessRequestService,
    private toast: MessageService,
    private confirm: ConfirmationService
  ) {}

  ngOnInit(): void {
    this.load();
    this.getAllMyAccessRequests();
  }

   onPageChange(event: any) {
  
    this.PageNumber = event.first / event.rows + 1;
    this.PageSize = event.rows;

    this.getAllMyAccessRequests();
  }

  myAccessRequest:AccessRequestPagedResult = {} as AccessRequestPagedResult;
  load() {
    this.loading = true;

    this.requests = [
      {
        id: 1,
        documentId: 0,
        documentName: 'Finance',
        message: 'ss',
        requesterId: '1',
        requesterName: 'Mohammed',
        requestRead: true,
        requestWrite: true,
        requestDelete: true,
        status: 'Pending',
        createdAt: '2002-01-01',
        decisionAt: '2002-01-01' ,
        decidedById: 'null',
        decidedByName: 'KARIM '
      }
        ,
      {
        id: 2,
        documentId: 0,
        documentName: 'file',
        message: 'ss',
        requesterId: '1',
        requesterName: 'chedly',
        requestRead: true,
        requestWrite: true,
        requestDelete: true,
        status: 'Pending',
        createdAt: '2002-01-01',
        decisionAt: '2002-01-01' ,
        decidedById: 'null',
        decidedByName: 'KARIM '
      }
    ];
    // this.svc
    //   .getPaged({
    //     pageNumber: this.pageNumber,
    //     pageSize: this.pageSize,
    //     status: this.statusFilter,
    //     search: this.searchTerm,
    //     sort: this.sort
    //   })
    //   .subscribe({
    //     next: res => {
    //       this.requests = res.data;
    //       this.totalRecords = res.totalRecords;
    //       this.computeStats();
    //       this.loading = false;
    //     },
    //     error: _ => {
    //       this.loading = false;
    //     }
    //   });
  }


  PageSize?: number = 5;
  Search?: string = '';
  PageNumber?: number = 1;
  SortBy?: string = '';
  SortDirection?: string = '';
  getAllMyAccessRequests() {
    this.accessRequestService.getAccessMyRequests(
      this.PageSize,
      this.Search,
      this.PageNumber,
      this.SortBy,
      this.SortDirection
    ).subscribe({
      next: (response: AccessRequestPagedResult) => {
        this.myAccessRequest = response;
      },error: (err) => {
        console.error('Error fetching access requests:', err);
      }
    }
  
  )
    //  .subscribe({
    //    next: (response: any) => {
    //      this.PageNumber = response.pageNumber;
    //      this.PageSize = response.pageSize;
    //      this.departments = response.data;
    //      this.totalRecords = response.totalRecords;
    //      this.totalDepartments = response.totalDepartments;
    //      this.totalUsers = response.totalUsers;
    //      this.avgUsersPerDepartment = Math.round(
    //        this.totalUsers / this.totalDepartments
    //      );
    //    },
    //  });
  }

  computeStats() {
    this.totalRequests = this.totalRecords;
    this.pendingRequests = this.requests.filter(r => r.status === 'Pending').length;
    this.approvedRequests = this.requests.filter(r => r.status === 'Approved').length;
    this.rejectedRequests = this.requests.filter(r => r.status === 'Rejected').length;
  }

  onPage(event: any) {
    this.pageNumber = event.page + 1;
    this.pageSize = event.rows;
    this.load();
  }

  refreshRequests() {
    this.pageNumber = 1;
    this.load();
  }

  clearFilters() {
    this.statusFilter = null;
    this.searchTerm = '';
    this.pageNumber = 1;
    this.load();
  }

  onSearch(_: Event) {
    this.pageNumber = 1;
    this.load();
  }

  isAccessFormValid(): boolean {
    return !!this.newRequest.documentId &&
      (this.newRequest.requestRead || this.newRequest.requestWrite || this.newRequest.requestDelete);
  }

  showCreateDialog() {
    this.resetForm();
    this.createDialog = true;
  }

  resetForm() {
    this.validationErrors = [];
    this.newRequest = {
      documentName: null,
      documentId: null,
      document: null,
      requestRead: true,
      requestWrite: false,
      requestDelete: false,
      message: null
    };
  }

  cancelCreate() {
    this.createDialog = false;
  }

  createAccessRequest() {
    
    this.validationErrors = [];
    if (!this.isAccessFormValid()) {
      if (!this.newRequest.documentId) this.validationErrors.push('Document requis.');
      if (!(this.newRequest.requestRead || this.newRequest.requestWrite || this.newRequest.requestDelete)) {
        this.validationErrors.push('Sélectionner au moins une permission.');
      }
      return;
    }
    const dto: AccessRequestCreateDto = {
      documentId: this.newRequest.documentId!,
      requestRead: this.newRequest.requestRead,
      requestWrite: this.newRequest.requestWrite,
      requestDelete: this.newRequest.requestDelete,
      message: this.newRequest.message || ''
    };

    this.accessRequestService.createAccessRequest(dto).subscribe({
      next:(res)=>{
        this.toast.add({ severity: 'success', summary: 'Demande créée' });
        this.creatingRequest = false;
        this.createDialog = false;
        this.load();
      },error: (err:any)=>{
        console.log(err);
        console.log(err.error);
        console.log(err.message.message);
        //this.creatingRequest = false;
        this.toast.add({ severity: 'error', summary: 'Erreur', detail: err.error });
      }
    })
    console.log('Creating access request:', dto);
    
    // this.svc.create(dto).subscribe({
    //   next: _ => {
    //     this.toast.add({ severity: 'success', summary: 'Demande créée' });
    //     this.creatingRequest = false;
    //     this.createDialog = false;
    //     this.load();
    //   },
    //   error: err => {
    //     this.creatingRequest = false;
    //     this.toast.add({ severity: 'error', summary: 'Erreur', detail: 'Création échouée' });
    //   }
    // });
  }

  view(r: AccessRequestDto) {
    this.selectedRequest = r;
    this.detailsDialog = true;
  }

  approve(r: AccessRequestDto) {
    this.confirm.confirm({
      message: 'Approuver cette demande ?',
      accept: () => {
        // this.svc.decide(r.id, true).subscribe({
        //   next: _ => {
        //     this.toast.add({ severity: 'success', summary: 'Approuvée' });
        //     this.load();
        //   }
        // });
      }
    });
  }

  reject(r: AccessRequestDto) {
    this.confirm.confirm({
      message: 'Annuler cette demande ?',
      accept: () => {
        this.accessRequestService.deleteAccessRequest(r.id).subscribe({
          next: _ => {
            this.toast.add({ severity: 'danger', summary: 'Supprimée avec succès' });
            this.getAllMyAccessRequests();
            this.load();
          }
        });
      }
    });
  }

  chooseDoc?:string;

  selectDocument(d:any){
    this.newRequest.documentId = d.value.id;
    this.newRequest.documentName = d.value.name;
    this.chooseDoc = d.value.name;
    console.log('Selected document:', this.newRequest);
    console.log(d.value.id, d.value.name);
  }
  searchDocuments(event: any) {
    console.log('documents.newreq:', this.newRequest.document);
    const q = event.query?.trim();
    this.documentService.search(q).subscribe({
      next: (res:any) => {
        console.log(res);
        
        this.documentSuggestions = res;
      },
      error: () => {
        this.documentSuggestions = [];
      }
    });
    if (!q) {
      this.documentSuggestions = [];
      return;
    }
    // this.svc.searchDocuments(q).subscribe({
    //   next: res => (this.documentSuggestions = res)
    // });
  }

  statusSeverity(s: string) {
    switch (s) {
      case 'Approved':
        return 'success';
      case 'Rejected':
        return 'danger';
      default:
        return 'warning';
    }
  }

  getInitials(name: string) {
    return (name || '')
      .split(' ')
      .filter(p => p)
      .slice(0, 2)
      .map(p => p[0]?.toUpperCase())
      .join('');
  }

  permissionLabels(r: AccessRequestDto) {
    const arr: string[] = [];
    if (r.requestRead) arr.push('Lecture');
    if (r.requestWrite) arr.push('Écriture');
    if (r.requestDelete) arr.push('Suppression');
    return arr.join(', ');
  }
}