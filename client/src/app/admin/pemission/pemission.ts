import { AccessRightService } from './../../core/services/access-right-service';
import { SharedModule } from './../../shared/shared.module';
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FormsModule } from '@angular/forms';

/* PrimeNG */
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { DialogModule } from 'primeng/dialog';
import { TagModule } from 'primeng/tag';
import { CheckboxModule } from 'primeng/checkbox';
import { InputTextModule } from 'primeng/inputtext';

import { ToastModule } from 'primeng/toast';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { AvatarModule } from 'primeng/avatar';
import { AutoCompleteModule } from 'primeng/autocomplete';
import { MessageService, ConfirmationService } from 'primeng/api';
import { ThemeSwitcher } from '../themeswitcher';
import {
  AccessRightDto,
  AccessRightFilterDto,
  AccessRightSummaryDto,
  BulkAccessRightDto,
  CreateAccessRightDto,
  UpdateAccessRightDto,
} from '../../shared/models/access-right';
import { AccessRequsetService } from '../../core/services/access-requset-service';

@Component({
  selector: 'app-access-rights',
  standalone: true,
  templateUrl: './pemission.html',
  styleUrls: ['./pemission.css'],
  imports: [
    
    FormsModule,
    AutoCompleteModule,
    CheckboxModule,
    CommonModule,
    FormsModule,
    AutoCompleteModule,
    CheckboxModule,
    CommonModule,
    FormsModule,
    TableModule,
    ButtonModule,
    DialogModule,
    TagModule,
    CheckboxModule,
    InputTextModule,

    ToastModule,
    ConfirmDialogModule,
    AvatarModule,
    AutoCompleteModule,
    ThemeSwitcher,
  ],
  providers: [MessageService, ConfirmationService],
})
export class Pemission implements OnInit {
  loading = false;
  rights: AccessRightDto[] = [];
  totalRecords = 0;
  summary: AccessRightSummaryDto | null = null;

  filter: AccessRightFilterDto = {
    pageNumber: 1,
    pageSize: 15,
    userId: null,
    userName: null,
    documentId: null,
    folderId: null,
    type: null,
    isActive: null,
    canCreate: null,
    canRead: null,
    canUpdate: null,
    canDelete: null,
    createdFrom: null,
    createdTo: null,
    sortBy: null,
    sortDirection: null,
    search: null,
  };

  selection: AccessRightDto[] = [];
  selected: AccessRightDto | null = null;

  // Autocomplete models
  acUser: any = null;
  acType: any = null;
  acActive: any = null;
  acRead: any = null;
  acDocument: any = null;
  acFolder: any = null;

  // Create dialog models
  createUser: any = null;
  createDocument: any = null;
  createFolder: any = null;

  // Bulk dialog models
  bulkUsers: any[] = [];
  bulkDocument: any = null;
  bulkFolder: any = null;

  // Suggestions arrays
  userSuggestions: any[] = [];
  typeSuggestions: any[] = [];
  boolSuggestions: any[] = [];
  documentSuggestions: any[] = [];
  folderSuggestions: any[] = [];

  // Static option bases
  readonly typeOptions = ['Document', 'Folder'];
  readonly boolOptions = [
    { label: 'Oui', value: true },
    { label: 'Non', value: false },
  ];

  createDialog = false;
  editDialog = false;
  bulkDialog = false;

  createModel: CreateAccessRightDto = {
    userId: '',
    documentId: null,
    folderId: null,
    canCreate: false,
    canRead: true,
    canUpdate: false,
    canDelete: false,
    isValid: true,
  };

  editModel: UpdateAccessRightDto = {
    canCreate: null,
    canRead: null,
    canUpdate: null,
    canDelete: null,
    isActive: null,
  };

  bulkModel: BulkAccessRightDto = {
    userIds: [],
    documentId: null,
    folderId: null,
    canCreate: false,
    canRead: true,
    canUpdate: false,
    canDelete: false,
  };

  constructor(
    // private svc: AccessRightsService,
    public accessRightService: AccessRightService,
    private toast: MessageService,
    private confirm: ConfirmationService
  ) {}

  ngOnInit(): void {
    this.accessRightService.getAccessRights()
    this.load();
  }

  load() {
    this.loading = true;
    // this.svc.getPaged(this.filter).subscribe({
    //   next: r => {
    //     this.rights = r.items;
    //     this.totalRecords = r.totalCount;
    //     this.summary = r.summary;
    //     this.loading = false;
    //   },
    //   error: _ => (this.loading = false)
    // });
  }

  onPage(e: any) {
    this.filter.pageNumber = e.page + 1;
    this.filter.pageSize = e.rows;
    this.load();
  }

  // Autocomplete search handlers
  searchUsers(e: any) {
    const q = (e.query || '').trim();
    if (!q) {
      this.userSuggestions = [];
      return;
    }
    // this.svc.users(q).subscribe({
    //   next: res => this.userSuggestions = res.map(u => ({ id: u.id, display: u.fullName || u.userName || u.name }))
    // });
  }

  searchTypes(e: any) {
    const q = (e.query || '').toLowerCase();
    this.typeSuggestions = this.typeOptions
      .filter((t) => !q || t.toLowerCase().includes(q))
      .map((t) => ({ value: t, display: t }));
  }

  searchBool(e: any) {
    const q = (e.query || '').toLowerCase();
    this.boolSuggestions = this.boolOptions
      .filter((o) => !q || o.label.toLowerCase().includes(q))
      .map((o) => ({ value: o.value, display: o.label }));
  }

  searchDocuments(e: any) {
    const q = (e.query || '').trim();
    if (!q) {
      this.documentSuggestions = [];
      return;
    }
    // this.svc.documents(q).subscribe({
    //   next: res => this.documentSuggestions = res.map(d => ({ id: d.id, display: d.name || ('Doc#'+d.id) }))
    // });
  }

  searchFolders(e: any) {
    const q = (e.query || '').trim();
    if (!q) {
      this.folderSuggestions = [];
      return;
    }
    // this.svc.folders(q).subscribe({
    //   next: res => this.folderSuggestions = res.map(f => ({ id: f.id, display: f.name || ('Folder#'+f.id) }))
    // });
  }

  PageSize?: number = 5;
  Search?: string = '';
  PageNumber?: number = 1;
  SortBy?: string = '';
  SortDirection?: string = '';
  getAllPermissions() {
    this.accessRightService
      .getAccessRights(
        this.PageSize,
        this.Search,
        this.PageNumber,
        this.SortBy,
        this.SortDirection
      )
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
    this.getAllPermissions();
  }

  applyUserFilter() {
    this.filter.userId = this.acUser?.id || null;
    this.filter.userName = this.acUser?.display || null;
    this.filter.pageNumber = 1;
    this.load();
  }

  applyTypeFilter() {
    this.filter.type = this.acType?.value || null;
    this.filter.pageNumber = 1;
    this.load();
  }

  applyActiveFilter() {
    this.filter.isActive = this.acActive ? this.acActive.value : null;
    this.filter.pageNumber = 1;
    this.load();
  }

  applyReadFilter() {
    this.filter.canRead = this.acRead ? this.acRead.value : null;
    this.filter.pageNumber = 1;
    this.load();
  }

  applyDocumentFilter() {
    this.filter.documentId = this.acDocument?.id || null;
    this.filter.pageNumber = 1;
    this.load();
  }

  applyFolderFilter() {
    this.filter.folderId = this.acFolder?.id || null;
    this.filter.pageNumber = 1;
    this.load();
  }

  clearFilters() {
    Object.assign(this.filter, {
      userId: null,
      userName: null,
      documentId: null,
      folderId: null,
      type: null,
      isActive: null,
      canCreate: null,
      canRead: null,
      canUpdate: null,
      canDelete: null,
      createdFrom: null,
      createdTo: null,
      search: null,
    });
    this.acUser =
      this.acType =
      this.acActive =
      this.acRead =
      this.acDocument =
      this.acFolder =
        null;
    this.filter.pageNumber = 1;
    this.load();
  }

  // Create
  openCreate() {
    this.createDialog = true;
    this.createModel = {
      userId: '',
      documentId: null,
      folderId: null,
      canCreate: false,
      canRead: true,
      canUpdate: false,
      canDelete: false,
      isValid: true,
    };
    this.createUser = this.createDocument = this.createFolder = null;
  }

  submitCreate() {
    if (
      !this.createModel.userId ||
      (!this.createModel.documentId && !this.createModel.folderId)
    ) {
      this.toast.add({
        severity: 'warn',
        summary: 'Validation',
        detail: 'Utilisateur et cible requis.',
      });
      return;
    }
    // this.svc.create(this.createModel).subscribe({
    //   next: _ => {
    //     this.toast.add({ severity: 'success', summary: 'Créé' });
    //     this.createDialog = false;
    //     this.load();
    //   }
    // });
  }

  // Edit
  openEdit(r: AccessRightDto) {
    this.selected = r;
    this.editModel = {
      canCreate: r.canCreate,
      canRead: r.canRead,
      canUpdate: r.canUpdate,
      canDelete: r.canDelete,
      isActive: r.isActive,
    };
    this.editDialog = true;
  }

  submitEdit() {
    if (!this.selected) return;
     this.accessRightService.updateAccessRight(this.selected.id, this.editModel).subscribe({
       next: _ => {
         this.toast.add({ severity: 'success', summary: 'Mis à jour' });
         this.editDialog = false;
         this.load();
         this.getAllPermissions();
       }
     });
  }

  confirmDelete(r: AccessRightDto) {
    this.confirm.confirm({
      message: 'Supprimer ce droit ?',
      accept: () => {
       this.accessRightService.deleteAccessRight(r.id).subscribe({
         next: (res:any) => {
           this.toast.add({ severity: 'success', summary: 'Supprimé' });
           this.load();
           this.getAllPermissions();
         }
       })}
    });
  }

  // Bulk
  openBulk() {
    this.bulkDialog = true;
    this.bulkModel = {
      userIds: [],
      documentId: null,
      folderId: null,
      canCreate: false,
      canRead: true,
      canUpdate: false,
      canDelete: false,
    };
    this.bulkUsers = [];
    this.bulkDocument = null;
    this.bulkFolder = null;
  }

  syncBulkUsers() {
    this.bulkModel.userIds = (this.bulkUsers || []).map((u) => u.id);
  }

  submitBulk() {
    if (
      !this.bulkModel.userIds.length ||
      (!this.bulkModel.documentId && !this.bulkModel.folderId)
    ) {
      this.toast.add({
        severity: 'warn',
        summary: 'Validation',
        detail: 'Utilisateurs et cible requis.',
      });
      return;
    }
    // this.svc.bulk(this.bulkModel).subscribe({
    //   next: _ => {
    //     this.toast.add({ severity: 'success', summary: 'Appliqué' });
    //     this.bulkDialog = false;
    //     this.load();
    //   }
    // });
  }

  statusSeverity(active: boolean) {
    return active ? 'success' : 'danger';
  }
}
