import { DepartmentService } from './../../core/services/department-service';
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
import { AutoCompleteModule } from 'primeng/autocomplete';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { TagModule } from 'primeng/tag';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { TooltipModule } from 'primeng/tooltip';

// Models
import {
  DepartmentDto,
  DepartmentCreateDTO,
  DepartmentUpdateDTO,
  DepartmentFilterDto,
  DepartmentPagedResult,
} from '../../shared/models/department';
import { DatePicker, DatePickerModule } from 'primeng/datepicker';
import { Textarea, TextareaModule } from 'primeng/textarea';
import { ThemeSwitcher } from '../themeswitcher';
import { DepartmentRealtimeService } from '../../core/services/Hub/DepartmentRealtimeService';
import { environment } from '../../../environments/environment';

interface UserCountRange {
  label: string;
  minCount: number | null;
  maxCount: number | null;
}

@Component({
  selector: 'app-department-management',
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
    ConfirmDialogModule,
    TagModule,
    IconFieldModule,
    InputIconModule,
    TooltipModule,
    ThemeSwitcher,
  ],
  providers: [MessageService, ConfirmationService],
  templateUrl: './department-mangement.html',
  styleUrls: ['./department-mangement.css'],
})
export class DepartmentMangement implements OnInit {
  departments: DepartmentDto[] = [];
  selectedDepartments: DepartmentDto[] = [];
  selectedDepartment: DepartmentDto | null = null;
  department: any = this.getEmptyDepartment();

  departmentDialog = false;
  departmentDetailsDialog = false;
  submitted = false;
  loading = false;
  saving = false;

  // Pagination and filtering
  totalRecords = 0;
  filter: DepartmentFilterDto = {
    pageNumber: 1,
    pageSize: 10,
    name: null,
    createdFrom: null,
    createdTo: null,
    minUserCount: null,
    maxUserCount: null,
    search: null,
    sortBy: null,
    sortDirection: null,
  };

  // Statistics
  totalDepartments = 0;
  totalUsers = 0;
  avgUsersPerDepartment = 0;

  // Filter options
  selectedUserCountRange: UserCountRange | null = null;
  filteredUserCountRanges: UserCountRange[] = [];
  dateRange: Date[] = [];

  userCountRanges: UserCountRange[] = [
    { label: 'Tous', minCount: null, maxCount: null },
    { label: '1-10 utilisateurs', minCount: 1, maxCount: 10 },
    { label: '11-25 utilisateurs', minCount: 11, maxCount: 25 },
    { label: '26-50 utilisateurs', minCount: 26, maxCount: 50 },
    { label: '50+ utilisateurs', minCount: 51, maxCount: null },
  ];

  private baseUrl = environment.apiUrl;

  constructor(
    public departmentService: DepartmentService,
    private realtime: DepartmentRealtimeService,
    private messageService: MessageService,
    private confirmationService: ConfirmationService,
    private http: HttpClient
  ) {}
  // private departments = new BehaviorSubject<DepartmentPagedResult>(
  //     {} as DepartmentPagedResult
  //   );
  ngOnInit() {
    //this.load(); // existing
    this.realtime.connect();
    this.realtime.created$.subscribe((d) => {
      console.log('Department created:', d);
      //this.data.unshift(d);
    });
    this.realtime.updated$.subscribe((d) => {
      // const i = this.data.findIndex((x) => x.id === d.id);
      // if (i > -1) this.data[i] = d;
      console.log('Department updated:', d);
    });
    this.realtime.deleted$.subscribe((id) => {
      console.log('Department deleted:', id);
      // this.data = this.data.filter((x) => x.id !== id);
    });
    this.loadDepartments();
    this.getAllDep();
    // this.departmentService.getDepartments();
  }
  ngOnDestroy() {
    this.realtime.disconnect();
  }
  get dialogTitle(): string {
    return this.selectedDepartment
      ? 'Modifier le département'
      : 'Nouveau département';
  }

  loadDepartments() {}
  
   PageSize?: number = 5;
  Search?: string = '';
  PageNumber?: number = 1;
  SortBy?: string = '';
  SortDirection?: string = '';
  getAllDep() {
    this.departmentService
      .getDepartments(
        this.PageSize,
        this.Search,
        this.PageNumber,
        this.SortBy,
        this.SortDirection
      )
      .subscribe({
        next: (response: any) => {
          console.log('Departments fetched:', response);
          this.PageNumber = response.pageNumber;
          this.PageSize = response.pageSize;
          this.departments = response.data;
          this.totalRecords = response.totalRecords;
          this.totalDepartments = response.totalDepartments;
          this.totalUsers = response.totalUsers;
          this.avgUsersPerDepartment = Math.round(
            this.totalUsers / this.totalDepartments
          );
        },
      });

      
  }

 

  onPageChange(event: any) {
   // this.first = event.first;
    this.PageNumber = event.first / event.rows + 1;
    this.PageSize = event.rows;
    this.getAllDep();
  }

  onGlobalFilter(event: any) {
    this.filter.name = event.target.value;
    this.filter.pageNumber = 1;
    this.loadDepartments();
  }

  // AutoComplete methods
  searchUserCountRange(event: any) {
    const query = event.query.toLowerCase();
    this.filteredUserCountRanges = this.userCountRanges.filter((range) =>
      range.label.toLowerCase().includes(query)
    );
  }

  onUserCountRangeSelect(event: any) {
    this.filter.minUserCount = event.minCount;
    this.filter.maxUserCount = event.maxCount;
    this.filter.pageNumber = 1;
    this.loadDepartments();
  }

  onUserCountRangeClear() {
    this.selectedUserCountRange = null;
    this.filter.minUserCount = null;
    this.filter.maxUserCount = null;
    this.filter.pageNumber = 1;
    this.loadDepartments();
  }

  onDateRangeSelect(event: any) {
    if (this.dateRange && this.dateRange.length === 2) {
      this.filter.createdFrom = this.dateRange[0].toISOString();
      this.filter.createdTo = this.dateRange[1].toISOString();
      this.filter.pageNumber = 1;
      this.loadDepartments();
    }
  }

  onDateRangeClear() {
    this.dateRange = [];
    this.filter.createdFrom = null;
    this.filter.createdTo = null;
    this.filter.pageNumber = 1;
    this.loadDepartments();
  }

  openNew() {
    this.department = this.getEmptyDepartment();
    this.selectedDepartment = null;
    this.submitted = false;
    this.departmentDialog = true;
  }

  editDepartment(department: DepartmentDto) {
    this.selectedDepartment = department;
    this.department = {
      id: department.id,
      name: department.name,
      description: department.description,
      userCount: department.userCount,
      folderCount: department.folderCount,
      documentRequestCount: department.documentRequestCount,
    };
    this.departmentService.updateDepartment(this.department).subscribe({
      next: (result:any) => {
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Département mis à jour avec succès',
        });
      },
      error: (error:any) => {
        this.messageService.add({
          severity: 'error',
          summary: 'Erreur',
          detail: 'Erreur lors de la mise à jour du département',
        });
      },
    });
    this.departmentDialog = true;
  }

  viewDepartment(department: DepartmentDto) {
    this.selectedDepartment = department;
    this.departmentDetailsDialog = true;
  }

  deleteDepartment(department: DepartmentDto) {
    this.confirmationService.confirm({
      message: `Êtes-vous sûr de vouloir supprimer le département "${department.name}"? Cette action affectera ${department.userCount} utilisateur(s).`,
      header: 'Confirmer la suppression',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.performDeleteDepartment(department.id);
      },
    });
  }

  deleteSelectedDepartments() {
    const totalUsers = this.selectedDepartments.reduce(
      (sum, dept) => sum + dept.userCount,
      0
    );
    this.confirmationService.confirm({
      message: `Êtes-vous sûr de vouloir supprimer ${this.selectedDepartments.length} département(s)? Cette action affectera ${totalUsers} utilisateur(s).`,
      header: 'Confirmer la suppression',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.performBulkDelete();
      },
    });
  }

  private performDeleteDepartment(departmentId: number) {
    setTimeout(() => {
      const deletedDept = this.departments.find((d) => d.id === departmentId);
      this.departments = this.departments.filter((d) => d.id !== departmentId);
      this.totalRecords--;
      this.totalDepartments--;
      if (deletedDept) {
        this.totalUsers -= deletedDept.userCount;
        this.avgUsersPerDepartment =
          this.totalDepartments > 0
            ? Math.round(this.totalUsers / this.totalDepartments)
            : 0;
      }
      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Département supprimé avec succès',
      });
    }, 500);
  }

  private performBulkDelete() {
    const departmentIds = this.selectedDepartments.map((d) => d.id);
    const deletedUsersCount = this.selectedDepartments.reduce(
      (sum, dept) => sum + dept.userCount,
      0
    );

    setTimeout(() => {
      this.departments = this.departments.filter(
        (d) => !departmentIds.includes(d.id)
      );
      this.selectedDepartments = [];
      this.totalRecords -= departmentIds.length;
      this.totalDepartments -= departmentIds.length;
      this.totalUsers -= deletedUsersCount;
      this.avgUsersPerDepartment =
        this.totalDepartments > 0
          ? Math.round(this.totalUsers / this.totalDepartments)
          : 0;
      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Départements supprimés avec succès',
      });
    }, 500);
  }

  saveDepartment() {
    this.submitted = true;
    console.log('Saving department:', this.department);
    // this.departmentService.createDepartment(this.department).subscribe({
    //   next:(result)=>{
    //     this.messageService.add({
    //       severity: 'success',
    //       summary: 'Succès',
    //       detail: 'Département créé avec succès',
    //     })
    //   },
    //   error:(error)=>{
    //     this.messageService.add({
    //       severity: 'error',
    //       summary: 'Erreur',
    //       detail: 'Erreur lors de la création du département',
    //     });
    //   }
    // })
    // if (!this.isDepartmentValid()) {
    //   this.messageService.add({
    //     severity: 'warn',
    //     summary: 'Validation',
    //     detail: 'Veuillez remplir tous les champs requis',
    //   });
    //   return;
    // }
    this.saving = true;
    if (this.selectedDepartment) {
      this.updateDepartment();
    } else {
      this.createDepartment();
    }
  }

  private createDepartment() {
    const createDto: DepartmentCreateDTO = {
      name: this.department.name,
      description: this.department.description,
    };

    setTimeout(() => {
      const newDepartment: DepartmentDto = {
        id: Math.max(...this.departments.map((d) => d.id)) + 1,
        name: createDto.name,
        description: createDto.description,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
        userCount: 0,
        folderCount: 0,
        documentRequestCount: 0,
      };

      this.departments.unshift(newDepartment);
      this.totalRecords++;
      this.totalDepartments++;
      this.avgUsersPerDepartment =
        this.totalDepartments > 0
          ? Math.round(this.totalUsers / this.totalDepartments)
          : 0;

      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Département créé avec succès',
      });
      this.hideDialog();
    }, 1500);
  }

  private updateDepartment() {
    if (!this.selectedDepartment) return;

    const updateDto: DepartmentUpdateDTO = {
      id: this.selectedDepartment.id,
      name: this.department.name,
      description: this.department.description,
    };

    // this.selectedDepartment = department;
    // this.department = {
    //   id: department.id,
    //   name: department.name,
    //   description: department.description,
    //   userCount: department.userCount,
    //   folderCount: department.folderCount,
    //   documentRequestCount: department.documentRequestCount,
    // };
    this.departmentService.updateDepartment(this.department).subscribe({
      next: (result:any) => {
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Département mis à jour avec succès',
        });
      },
      error: (error:any) => {
        this.messageService.add({
          severity: 'error',
          summary: 'Erreur',
          detail: 'Erreur lors de la mise à jour du département',
        });
      },
    });
    this.departmentDialog = true;
  }

  hideDialog() {
    this.departmentDialog = false;
    this.submitted = false;
    this.saving = false;
    this.department = this.getEmptyDepartment();
    this.selectedDepartment = null;
  }

  exportDepartments() {
    this.messageService.add({
      severity: 'info',
      summary: 'Export',
      detail: 'Export des départements en cours...',
    });
  }

  // Utility methods
  getEmptyDepartment(): any {
    return {
      name: '',
      description: '',
      userCount: 0,
      folderCount: 0,
      documentRequestCount: 0,
    };
  }

  isDepartmentValid(): boolean {
    return !!(
      this.department.name?.trim() && this.department.description?.trim()
    );
  }

  getRatio(numerator: number, denominator: number): string {
    if (denominator === 0) return 'N/A';
    return (numerator / denominator).toFixed(2);
  }
}
