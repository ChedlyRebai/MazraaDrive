
import { FormsModule } from '@angular/forms';
import { Component, OnInit } from '@angular/core';
import { ConfirmationService, MessageService, LazyLoadEvent } from 'primeng/api';
import { PagedResult, PaginationParams } from '../../shared/models/pageresult';
import { Checkbox } from "primeng/checkbox";
import { Dialog } from "primeng/dialog";
import { Button } from "primeng/button";
import { SharedModule } from "../../shared/shared.module";
import { AutoComplete } from "primeng/autocomplete";
import { ThemeSwitcher } from "../themeswitcher";
import { RoleService } from '../../core/services/role-service';

import { CommonModule } from '@angular/common';
export interface RoleDto {
  id: number;
  name: string;
  description: string;
  isActive: boolean;
}
export interface CreateRoleDto {
  name: string;
  description: string;
  isActive: boolean;
}
export interface UpdateRoleDto {
  name: string | null;
  description: string | null;
  isActive: boolean | null;
}
export interface RoleFilterDto extends PaginationParams {
  name: string | null;
  isActive: boolean | null;
  createdFrom: string | null;
  createdTo: string | null;
}
export interface RolePagedResult extends PagedResult<RoleDto> {
  totalRoles: number;
  activeRoles: number;
  inactiveRoles: number;
}

@Component({
  selector: 'app-role-mangement',
  templateUrl: './role-mangement.html',
  providers: [MessageService, ConfirmationService],
  imports: [Checkbox, CommonModule,Dialog, FormsModule,Button, SharedModule, AutoComplete, ThemeSwitcher]
})
export class RoleMangementComponent implements OnInit {

  constructor(
    public roleService: RoleService,
    private message: MessageService,
    private confirm: ConfirmationService
  ) {}
  roles: RoleDto[] = [];
  selectedRoles: RoleDto[] = [];
  totalRecords = 0;

  // Stats
  totalRoles = 0;
  activeRoles = 0;
  inactiveRoles = 0;

  // UI State
  loading = false;
  saving = false;
  roleDialog = false;
  roleDetailsDialog = false;
  dialogTitle = 'Nouveau Rôle';
  submitted = false;

  // Form model
  roleForm: CreateRoleDto & { id?: number } = { name: '', description: '', isActive: true };
  selectedRole: RoleDto | null = null;

  // Filters
  globalFilterValue = '';
  roleFilter: any = {
    pageNumber: 1,
    pageSize: 10,
    name: null,
    isActive: null,
    createdFrom: null,
    createdTo: null
  };

  // Status autocomplete
  statusOptions = [
    { label: 'Actif', value: true },
    { label: 'Inactif', value: false }
  ];
  statusFiltered: any[] = [];
  statusSelection: any = null;



  PageSize?: number = 5;
  Search?: string = '';
  PageNumber?: number = 1;
  SortBy?: string = '';
  SortDirection?: string = '';
  getAllRoles() {
    this.roleService
      .getRoles(
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
    this.getAllRoles();
  }

  ngOnInit(): void {
    this.roleService.getRoles();
    this.loadRoles();
  }

  completeStatus(e: any) {
    const q = (e.query || '').toLowerCase();
    this.statusFiltered = this.statusOptions.filter(o => o.label.toLowerCase().includes(q));
  }

  onStatusSelect() {
    this.roleFilter.isActive = this.statusSelection?.value ?? null;
    this.reload();
  }

  clearStatus() {
    this.statusSelection = null;
    this.roleFilter.isActive = null;
    this.reload();
  }

  onGlobalFilter(val: string) {
    this.roleFilter.name = val ? val : null;
    this.roleFilter.pageNumber = 1;
    this.loadRoles();
  }

  // onPageChange(event: LazyLoadEvent) {
  //   if (event.rows != null && event.first != null) {
  //     this.roleFilter.pageSize = event.rows;
  //     this.roleFilter.pageNumber = Math.floor(event.first / event.rows) + 1;
  //     this.loadRoles();
  //   }
  // }

  reload() {
    this.roleFilter.pageNumber = 1;
    this.loadRoles();
  }

  loadRoles() {
    this.loading = true;
    // TODO: Replace mock with service call:
    // this.roleService.getRoles(this.roleFilter).subscribe(...)
    setTimeout(() => {
      const all: RoleDto[] = [
        { id: 1, name: 'Administrateur', description: 'Accès complet', isActive: true },
        { id: 2, name: 'Manager', description: 'Gestion d\'équipe', isActive: true },
        { id: 3, name: 'Employé', description: 'Accès standard', isActive: true },
        { id: 4, name: 'Archive', description: 'Rôle désactivé', isActive: false }
      ];

      let filtered = [...all];
      if (this.roleFilter.name)
        filtered = filtered.filter(r => r.name.toLowerCase().includes(this.roleFilter.name!.toLowerCase()));
      if (this.roleFilter.isActive !== null)
        filtered = filtered.filter(r => r.isActive === this.roleFilter.isActive);

      const start = (this.roleFilter.pageNumber - 1) * this.roleFilter.pageSize;
      const pageItems = filtered.slice(start, start + this.roleFilter.pageSize);

      // Simulate RolePagedResult
      const result: any = {
        items: pageItems,
        total: filtered.length,
        totalRoles: all.length,
        activeRoles: all.filter(r => r.isActive).length,
        inactiveRoles: all.filter(r => !r.isActive).length
      };

      this.roles = result.items;
      this.totalRecords = result.total;
      this.totalRoles = result.totalRoles;
      this.activeRoles = result.activeRoles;
      this.inactiveRoles = result.inactiveRoles;
      this.loading = false;
    }, 300);
  }

  openNew() {
    this.roleForm = { name: '', description: '', isActive: true };
    this.dialogTitle = 'Nouveau Rôle';
    this.submitted = false;
    this.roleDialog = true;
  }

  editRole(role: RoleDto) {
    this.roleForm = { id: role.id, name: role.name, description: role.description, isActive: role.isActive };
    this.dialogTitle = 'Modifier Rôle';
    this.submitted = false;
    this.roleDialog = true;
  }

  viewRole(role: RoleDto) {
    this.selectedRole = role;
    this.roleDetailsDialog = true;
  }

  hideDialog() {
    this.roleDialog = false;
  }

  saveRole() {
    this.submitted = true;
    if (!this.roleForm.name || !this.roleForm.description) return;

    this.saving = true;
    const isNew = !this.roleForm.id;

    // Build DTOs
    if (isNew) {
      const create: CreateRoleDto = {
        name: this.roleForm.name,
        description: this.roleForm.description,
        isActive: this.roleForm.isActive
      };
      // TODO: service.createRole(create)
      setTimeout(() => {
        this.roles.unshift({
          id: Math.floor(Math.random() * 100000),
          ...create
        });
        this.messageSuccess('Rôle créé.');
      }, 400);
    } else {
      const update: UpdateRoleDto = {
        name: this.roleForm.name,
        description: this.roleForm.description,
        isActive: this.roleForm.isActive
      };
      // TODO: service.updateRole(this.roleForm.id!, update)
      setTimeout(() => {
        const i = this.roles.findIndex(r => r.id === this.roleForm.id);
        if (i > -1) this.roles[i] = {
          id: this.roleForm.id!,
          name: update.name ?? '',
          description: update.description ?? '',
          isActive: update.isActive ?? false
        };
        this.messageSuccess('Rôle mis à jour.');
      }, 400);
    }

    setTimeout(() => {
      this.computeStatsFromCurrent();
      this.saving = false;
      this.roleDialog = false;
    }, 450);
  }

  deleteRole(role: RoleDto) {
    this.confirm.confirm({
      message: `Supprimer le rôle "${role.name}" ?`,
      header: 'Confirmation',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        // TODO: service.deleteRole(role.id)
        this.roles = this.roles.filter(r => r.id !== role.id);
        this.computeStatsFromCurrent();
        this.messageSuccess('Rôle supprimé.');
      }
    });
  }

  deleteSelectedRoles() {
    if (!this.selectedRoles.length) return;
    this.confirm.confirm({
      message: `Supprimer ${this.selectedRoles.length} rôles ?`,
      header: 'Confirmation',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        const ids = new Set(this.selectedRoles.map(r => r.id));
        this.roles = this.roles.filter(r => !ids.has(r.id));
        this.selectedRoles = [];
        this.computeStatsFromCurrent();
        this.messageSuccess('Rôles supprimés.');
      }
    });
  }

  exportRoles() {

  }

  computeStatsFromCurrent() {
    this.totalRoles = this.roles.length;
    this.activeRoles = this.roles.filter(r => r.isActive).length;
    this.inactiveRoles = this.totalRoles - this.activeRoles;
  }

  private messageSuccess(detail: string) {
    this.message.add({ severity: 'success', summary: 'Succès', detail });
  }


}