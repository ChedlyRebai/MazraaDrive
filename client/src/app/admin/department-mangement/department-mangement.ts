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
import { DepartmentService } from '../../core/services/department-service';

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

  private baseUrl = 'http://localhost:5108/api';

  constructor(
    public departmentService: DepartmentService,
    private realtime: DepartmentRealtimeService,
    private messageService: MessageService,
    private confirmationService: ConfirmationService,
    private http: HttpClient
  ) {}

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
    this.departmentService.getDepartments();
  }
  ngOnDestroy() {
    this.realtime.disconnect();
  }
  get dialogTitle(): string {
    return this.selectedDepartment
      ? 'Modifier le département'
      : 'Nouveau département';
  }

  loadDepartments() {
    this.loading = true;

    // Mock data matching DepartmentDto interface
    setTimeout(() => {
      const mockResponse: DepartmentPagedResult = {
        data: [
          {
            id: 1,
            name: 'Ressources Humaines',
            description:
              'Gestion du personnel, recrutement, formation et développement des ressources humaines',
            createdAt: '2024-01-15T08:30:00',
            updatedAt: '2024-12-01T10:15:00',
            userCount: 15,
            folderCount: 25,
            documentRequestCount: 45,
          },
          {
            id: 2,
            name: 'Finance',
            description:
              'Gestion financière, comptabilité, budgets et contrôle de gestion',
            createdAt: '2024-01-20T09:00:00',
            updatedAt: '2024-11-28T14:30:00',
            userCount: 12,
            folderCount: 30,
            documentRequestCount: 38,
          },
          {
            id: 3,
            name: "Technologies de l'Information",
            description:
              'Développement logiciel, infrastructure IT, support technique et cybersécurité',
            createdAt: '2024-02-01T10:00:00',
            updatedAt: '2024-12-05T16:45:00',
            userCount: 20,
            folderCount: 40,
            documentRequestCount: 25,
          },
          {
            id: 4,
            name: 'Marketing et Communication',
            description:
              'Marketing digital, communication interne et externe, relations publiques',
            createdAt: '2024-02-10T11:15:00',
            updatedAt: '2024-11-30T09:20:00',
            userCount: 8,
            folderCount: 15,
            documentRequestCount: 20,
          },
          {
            id: 5,
            name: 'Opérations',
            description:
              "Gestion des opérations, production, logistique et chaîne d'approvisionnement",
            createdAt: '2024-01-25T13:45:00',
            updatedAt: '2024-12-03T11:10:00',
            userCount: 25,
            folderCount: 35,
            documentRequestCount: 55,
          },
          {
            id: 6,
            name: 'Administration Générale',
            description:
              'Support administratif, gestion des installations et services généraux',
            createdAt: '2024-03-01T08:00:00',
            updatedAt: '2024-12-02T15:30:00',
            userCount: 10,
            folderCount: 20,
            documentRequestCount: 30,
          },
        ],
        pageNumber: 1,
        pageSize: 10,
        totalRecords: 6,
        totalPages: 1,
        hasPreviousPage: false,
        hasNextPage: false,
        totalDepartments: 6,
        totalUsers: 90,
        search: null,
        sortBy: null,
        sortDirection: null,
      };

      this.departments = mockResponse.data;
      this.totalRecords = mockResponse.totalRecords;
      this.totalDepartments = mockResponse.totalDepartments;
      this.totalUsers = mockResponse.totalUsers;
      this.avgUsersPerDepartment = Math.round(
        this.totalUsers / this.totalDepartments
      );
      this.loading = false;
    }, 1000);

    // Real API call would be:
    /*
    this.http.get<DepartmentPagedResult>(`${this.baseUrl}/Department`, { params: this.filter as any }).subscribe({
      next: (response) => {
        this.departments = response.data;
        this.totalRecords = response.totalCount;
        this.totalDepartments = response.totalDepartments;
        this.totalUsers = response.totalUsers;
        this.avgUsersPerDepartment = Math.round(this.totalUsers / this.totalDepartments);
        this.loading = false;
      },
      error: (error) => {
        console.error('Error loading departments:', error);
        this.messageService.add({
          severity: 'error',
          summary: 'Erreur',
          detail: 'Erreur lors du chargement des départements'
        });
        this.loading = false;
      }
    });
    */
  }

  first = 0;

  rows = 10;
  next() {
    this.first = this.first + this.rows;
  }

  prev() {
    this.first = this.first - this.rows;
  }
  
  onPageChange(event: any) {
    this.first = event.first;
    this.rows = event.rows;
    this.filter.pageNumber = event.page + 1;
    console.log('Page  num changed to: ', event.page);
    this.filter.pageSize = event.rows;
    console.log('page size per page changed to: ', this.filter.pageSize);
    this.loadDepartments();
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

    if (!this.isDepartmentValid()) {
      this.messageService.add({
        severity: 'warn',
        summary: 'Validation',
        detail: 'Veuillez remplir tous les champs requis',
      });
      return;
    }

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

    setTimeout(() => {
      const index = this.departments.findIndex(
        (d) => d.id === this.selectedDepartment!.id
      );
      if (index !== -1) {
        this.departments[index] = {
          ...this.departments[index],
          name: updateDto.name,
          description: updateDto.description,
          updatedAt: new Date().toISOString(),
        };
      }

      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Département modifié avec succès',
      });
      this.hideDialog();
    }, 1500);
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
