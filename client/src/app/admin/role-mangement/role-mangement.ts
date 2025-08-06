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

import { CheckboxModule } from 'primeng/checkbox';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { TagModule } from 'primeng/tag';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { TooltipModule } from 'primeng/tooltip';

// Models
import { RoleDto, CreateRoleDto, UpdateRoleDto, RoleFilterDto, RolePagedResult } from '../../shared/models/role';
import { ThemeSwitcher } from '../themeswitcher';
import { Textarea } from 'primeng/textarea';
import { AutoComplete, AutoCompleteModule } from 'primeng/autocomplete';

@Component({
  selector: 'app-role-management',
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
    Textarea,
    AutoCompleteModule,
    CheckboxModule,
    ConfirmDialogModule,
    TagModule,
    IconFieldModule,
    InputIconModule,
    TooltipModule,
    ThemeSwitcher
  ],
  providers: [MessageService, ConfirmationService],
  templateUrl: './role-mangement.html',
  styleUrls: ['./role-mangement.css']
})
export class RoleManagementComponent implements OnInit {

  roles: RoleDto[] = [];
  selectedRoles: RoleDto[] = [];
  selectedRole: RoleDto | null = null;
  role: CreateRoleDto = this.getEmptyRole();
  
  roleDialog = false;
  roleDetailsDialog = false;
  submitted = false;
  loading = false;
  saving = false;

  // Pagination and filtering
  currentPage = 0;
  pageSize = 10;
  totalRecords = 0;
  filter: RoleFilterDto = {
    pageNumber: 1,
    pageSize: 10,
    name: null,
    isActive: null,
    createdFrom: null,
    createdTo: null,
    search: null,
    sortBy: null,
    sortDirection: null
  };

  // Statistics from API response
  totalRoles = 0;
  activeRoles = 0;
  inactiveRoles = 0;

  statusOptions = [
    { label: 'Tous', value: null },
    { label: 'Actif', value: true },
    { label: 'Inactif', value: false }
  ];

  private baseUrl = 'http://localhost:5108/api';

  constructor(
    private messageService: MessageService,
    private confirmationService: ConfirmationService,
    private http: HttpClient
  ) {}

  ngOnInit() {
    this.loadRoles();
  }

  get dialogTitle(): string {
    return this.selectedRole ? 'Modifier le rôle' : 'Nouveau rôle';
  }

  loadRoles() {
    this.loading = true;
    
    // Mock data matching your RoleDto interface
    setTimeout(() => {
      const mockResponse: RolePagedResult = {
        data: [
          {
            id: 1,
            name: 'Super Admin',
            description: 'Accès complet au système avec toutes les permissions',
            isActive: true
          },
          {
            id: 2,
            name: 'Administrateur',
            description: 'Accès administratif avec la plupart des permissions',
            isActive: true
          },
          {
            id: 3,
            name: 'Manager',
            description: 'Accès de niveau management pour la supervision',
            isActive: true
          },
          {
            id: 4,
            name: 'Employé',
            description: 'Accès standard pour les employés',
            isActive: true
          },
          {
            id: 5,
            name: 'Consultant',
            description: 'Accès limité pour les consultants externes',
            isActive: false
          },
          {
            id: 6,
            name: 'Lecteur',
            description: 'Accès en lecture seule',
            isActive: false
          }
        ],
        pageNumber: 1,
        pageSize: 10,
        totalRecords: 6,
        totalPages: 1,
        hasPreviousPage: false,
        hasNextPage: false,
        totalRoles: 6,
        activeRoles: 4,
        inactiveRoles: 2,
        search: null,
        sortBy: null,
        sortDirection: null
      };

      this.roles = mockResponse.data;
      this.totalRecords = mockResponse.totalRecords;
      this.totalRoles = mockResponse.totalRoles;
      this.activeRoles = mockResponse.activeRoles;
      this.inactiveRoles = mockResponse.inactiveRoles;
      this.loading = false;
    }, 1000);

    // Real API call would be:
    /*
    this.http.get<RolePagedResult>(`${this.baseUrl}/Role`, { params: this.filter as any }).subscribe({
      next: (response) => {
        this.roles = response.data;
        this.totalRecords = response.totalCount;
        this.totalRoles = response.totalRoles;
        this.activeRoles = response.activeRoles;
        this.inactiveRoles = response.inactiveRoles;
        this.loading = false;
      },
      error: (error) => {
        console.error('Error loading roles:', error);
        this.messageService.add({
          severity: 'error',
          summary: 'Erreur',
          detail: 'Erreur lors du chargement des rôles'
        });
        this.loading = false;
      }
    });
    */
  }

  onPageChange(event: any) {
    this.filter.pageNumber = event.page + 1;
    this.filter.pageSize = event.rows;
    this.loadRoles();
  }

  onGlobalFilter(event: any) {
    this.filter.name = event.target.value;
    this.filter.pageNumber = 1;
    this.loadRoles();
  }

  onStatusFilter(event: any) {
    this.filter.isActive = event.value;
    this.filter.pageNumber = 1;
    this.loadRoles();
  }

  openNew() {
    this.role = this.getEmptyRole();
    this.selectedRole = null;
    this.submitted = false;
    this.roleDialog = true;
  }

  editRole(role: RoleDto) {
    this.selectedRole = role;
    this.role = {
      name: role.name,
      description: role.description,
      isActive: role.isActive
    };
    this.roleDialog = true;
  }

  viewRole(role: RoleDto) {
    this.selectedRole = role;
    this.roleDetailsDialog = true;
  }

  deleteRole(role: RoleDto) {
    this.confirmationService.confirm({
      message: `Êtes-vous sûr de vouloir supprimer le rôle "${role.name}"?`,
      header: 'Confirmer la suppression',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.performDeleteRole(role.id);
      }
    });
  }

  deleteSelectedRoles() {
    this.confirmationService.confirm({
      message: `Êtes-vous sûr de vouloir supprimer ${this.selectedRoles.length} rôle(s)?`,
      header: 'Confirmer la suppression',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.performBulkDelete();
      }
    });
  }

  private performDeleteRole(roleId: number) {
    // Mock delete
    setTimeout(() => {
      this.roles = this.roles.filter(r => r.id !== roleId);
      this.totalRecords--;
      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Rôle supprimé avec succès'
      });
    }, 500);

    // Real API call would be:
    /*
    this.http.delete(`${this.baseUrl}/Role/${roleId}`).subscribe({
      next: () => {
        this.loadRoles();
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Rôle supprimé avec succès'
        });
      },
      error: (error) => {
        console.error('Error deleting role:', error);
        this.messageService.add({
          severity: 'error',
          summary: 'Erreur',
          detail: 'Erreur lors de la suppression du rôle'
        });
      }
    });
    */
  }

  private performBulkDelete() {
    const roleIds = this.selectedRoles.map(r => r.id);
    
    // Mock bulk delete
    setTimeout(() => {
      this.roles = this.roles.filter(r => !roleIds.includes(r.id));
      this.selectedRoles = [];
      this.totalRecords -= roleIds.length;
      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Rôles supprimés avec succès'
      });
    }, 500);

    // Real API call would be:
    /*
    this.http.delete(`${this.baseUrl}/Role/bulk`, { body: roleIds }).subscribe({
      next: () => {
        this.loadRoles();
        this.selectedRoles = [];
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Rôles supprimés avec succès'
        });
      },
      error: (error) => {
        console.error('Error deleting roles:', error);
        this.messageService.add({
          severity: 'error',
          summary: 'Erreur',
          detail: 'Erreur lors de la suppression des rôles'
        });
      }
    });
    */
  }

  saveRole() {
    this.submitted = true;

    if (!this.isRoleValid()) {
      this.messageService.add({
        severity: 'warn',
        summary: 'Validation',
        detail: 'Veuillez remplir tous les champs requis'
      });
      return;
    }

    this.saving = true;

    if (this.selectedRole) {
      this.updateRole();
    } else {
      this.createRole();
    }
  }

  private createRole() {
    const createDto: CreateRoleDto = { ...this.role };

    // Mock create
    setTimeout(() => {
      const newRole: RoleDto = {
        id: Math.max(...this.roles.map(r => r.id)) + 1,
        ...createDto
      };
      this.roles.unshift(newRole);
      this.totalRecords++;
      this.activeRoles = this.roles.filter(r => r.isActive).length;
      this.inactiveRoles = this.roles.filter(r => !r.isActive).length;
      
      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Rôle créé avec succès'
      });
      this.hideDialog();
    }, 1500);

    // Real API call would be:
    /*
    this.http.post<RoleDto>(`${this.baseUrl}/Role`, createDto).subscribe({
      next: (response) => {
        this.loadRoles();
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Rôle créé avec succès'
        });
        this.hideDialog();
      },
      error: (error) => {
        console.error('Error creating role:', error);
        this.messageService.add({
          severity: 'error',
          summary: 'Erreur',
          detail: 'Erreur lors de la création du rôle'
        });
        this.saving = false;
      }
    });
    */
  }

  private updateRole() {
    if (!this.selectedRole) return;

    const updateDto: UpdateRoleDto = {
      name: this.role.name !== this.selectedRole.name ? this.role.name : null,
      description: this.role.description !== this.selectedRole.description ? this.role.description : null,
      isActive: this.role.isActive !== this.selectedRole.isActive ? this.role.isActive : null
    };

    // Mock update
    setTimeout(() => {
      const index = this.roles.findIndex(r => r.id === this.selectedRole!.id);
      if (index !== -1) {
        this.roles[index] = { ...this.selectedRole!, ...this.role };
      }
      this.activeRoles = this.roles.filter(r => r.isActive).length;
      this.inactiveRoles = this.roles.filter(r => !r.isActive).length;
      
      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Rôle modifié avec succès'
      });
      this.hideDialog();
    }, 1500);

    // Real API call would be:
    /*
    this.http.put<RoleDto>(`${this.baseUrl}/Role/${this.selectedRole.id}`, updateDto).subscribe({
      next: (response) => {
        this.loadRoles();
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Rôle modifié avec succès'
        });
        this.hideDialog();
      },
      error: (error) => {
        console.error('Error updating role:', error);
        this.messageService.add({
          severity: 'error',
          summary: 'Erreur',
          detail: 'Erreur lors de la modification du rôle'
        });
        this.saving = false;
      }
    });
    */
  }

  hideDialog() {
    this.roleDialog = false;
    this.submitted = false;
    this.saving = false;
    this.role = this.getEmptyRole();
    this.selectedRole = null;
  }

  exportRoles() {
    // Mock export
    this.messageService.add({
      severity: 'info',
      summary: 'Export',
      detail: 'Export des rôles en cours...'
    });

    // Real export would be:
    /*
    this.http.get(`${this.baseUrl}/Role/export`, { responseType: 'blob' }).subscribe({
      next: (blob) => {
        const url = window.URL.createObjectURL(blob);
        const link = document.createElement('a');
        link.href = url;
        link.download = 'roles.xlsx';
        link.click();
        window.URL.revokeObjectURL(url);
      },
      error: (error) => {
        console.error('Error exporting roles:', error);
        this.messageService.add({
          severity: 'error',
          summary: 'Erreur',
          detail: 'Erreur lors de l\'export'
        });
      }
    });
    */
  }

  // Utility methods
  getEmptyRole(): CreateRoleDto {
    return {
      name: '',
      description: '',
      isActive: true
    };
  }

  isRoleValid(): boolean {
    return !!(this.role.name?.trim() && this.role.description?.trim());
  }

  getRoleDisplayName(role: RoleDto): string {
    return `${role.name} ${role.isActive ? '' : '(Inactif)'}`;
  }
}