import { UserService } from './../../core/services/user-service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { SharedModule } from "../../shared/shared.module";
import { Avatar } from "primeng/avatar";
import { Checkbox } from "primeng/checkbox";
import { Password } from "primeng/password";
import { AutoComplete } from "primeng/autocomplete";
import { FloatLabelModule } from 'primeng/floatlabel';
import { ThemeSwitcher } from "../themeswitcher";
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
interface User {
  id: string;
  fullName: string;
  userName: string;
  email: string;
  department: string;
  role: string;
  phoneNumber?: string;
  isActive: boolean;
  createdAt: string;
  lastLoginAt?: string;
  profilePicture?: string;
}

interface EditableUser extends Partial<User> {
  password?: string;
}

interface UserFilter {
  role: string | null;
  dept: string | null;
  status: boolean | null;
}

@Component({
  selector: 'app-user-mangement',
  templateUrl: './user-mangement.html',
  providers: [MessageService, ConfirmationService],
  imports: [SharedModule, Avatar,FormsModule ,CommonModule,Checkbox, Password, AutoComplete, FloatLabelModule, ThemeSwitcher]
})
export class UserMangement implements OnInit {

  loading = false;
  saving = false;

  users: User[] = [];
  selectedUsers: User[] = [];

  userDialog = false;
  userDetailsDialog = false;
  dialogTitle = 'Nouvel Utilisateur';

  user: EditableUser = {};
  selectedUser: User | null = null;
  submitted = false;

  totalUsers = 0;
  activeUsers = 0;
  inactiveUsers = 0;
  lastImportAt: Date | null = null;

  filter: UserFilter = { role: null, dept: null, status: null };

  // Option sources
  roleOptions = [
    { label: 'Administrateur', value: 'Admin' },
    { label: 'Manager', value: 'Manager' },
    { label: 'Utilisateur', value: 'User' }
  ];
  departmentOptions = [
    { label: 'Finance', value: 'Finance' },
    { label: 'IT', value: 'IT' },
    { label: 'RH', value: 'HR' }
  ];
  statusOptions = [
    { label: 'Actif', value: true },
    { label: 'Inactif', value: false }
  ];



  PageSize?: number = 5;
  Search?: string = '';
  PageNumber?: number = 1;
  SortBy?: string = '';
  SortDirection?: string = '';
  getAllUsers() {
    this.userService
       .getUsers(
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
    this.getAllUsers();
  }
  // Filter autocomplete suggestions
  roleFiltered: any[] = [];
  departmentFiltered: any[] = [];
  statusFiltered: any[] = [];

  // Dialog autocomplete suggestions (separate to avoid interference if desired)
  roleFilteredDialog: any[] = [];
  departmentFilteredDialog: any[] = [];

  profilePictureFile: File | null = null;

  constructor(
    public userService: UserService,
    private message: MessageService,
    private confirm: ConfirmationService
  ) {}

  ngOnInit(): void {
    this.loadUsers();
    this.userService.getUsers();
  }

  // Autocomplete complete methods (filters)
  completeRole(e: any) {
    const q = (e.query || '').toLowerCase();
    this.roleFiltered = this.roleOptions.filter(o => o.label.toLowerCase().includes(q));
  }
  completeDepartment(e: any) {
    const q = (e.query || '').toLowerCase();
    this.departmentFiltered = this.departmentOptions.filter(o => o.label.toLowerCase().includes(q));
  }
  completeStatus(e: any) {
    const q = (e.query || '').toLowerCase();
    this.statusFiltered = this.statusOptions.filter(o => o.label.toLowerCase().includes(q));
  }

  // Autocomplete complete methods (dialog)
  completeRoleDialog(e: any) {
    const q = (e.query || '').toLowerCase();
    this.roleFilteredDialog = this.roleOptions.filter(o => o.label.toLowerCase().includes(q));
  }
  completeDepartmentDialog(e: any) {
    const q = (e.query || '').toLowerCase();
    this.departmentFilteredDialog = this.departmentOptions.filter(o => o.label.toLowerCase().includes(q));
  }

  applyFilters() {
    this.loadUsers();
  }
  clearRole() { this.filter.role = null; this.loadUsers(); }
  clearDept() { this.filter.dept = null; this.loadUsers(); }
  clearStatus() { this.filter.status = null; this.loadUsers(); }

  onGlobalSearch(ev: any) {
    // hook if server-side global search required
  }

  loadUsers(): void {
    this.loading = true;
    setTimeout(() => {
      const mock: User[] = [
        { id: '1', fullName: 'John Doe', userName: 'jdoe', email: 'jdoe@example.com', department: 'IT', role: 'Admin', isActive: true, createdAt: new Date().toISOString() },
        { id: '2', fullName: 'Jane Smith', userName: 'jsmith', email: 'jsmith@example.com', department: 'Finance', role: 'User', isActive: false, createdAt: new Date().toISOString() }
      ];
      let data = [...mock];
      if (this.filter.role) data = data.filter(u => u.role === this.filter.role);
      if (this.filter.dept) data = data.filter(u => u.department === this.filter.dept);
      if (this.filter.status !== null) data = data.filter(u => u.isActive === this.filter.status);
      this.users = data;
      this.computeStats();
      this.loading = false;
    }, 300);
  }

  computeStats() {
    this.totalUsers = this.users.length;
    this.activeUsers = this.users.filter(u => u.isActive).length;
    this.inactiveUsers = this.totalUsers - this.activeUsers;
  }

  openNew() {
    this.user = { isActive: true };
    this.dialogTitle = 'Nouvel Utilisateur';
    this.submitted = false;
    this.profilePictureFile = null;
    this.userDialog = true;
  }

  editUser(u: User) {
    this.user = { ...u };
    this.dialogTitle = 'Modifier Utilisateur';
    this.submitted = false;
    this.profilePictureFile = null;
    this.userDialog = true;
  }

  viewUser(u: User) {
    this.selectedUser = u;
    this.userDetailsDialog = true;
  }

  hideDialog() {
    this.userDialog = false;
  }

  saveUser() {
    this.submitted = true;
    if (!this.user.fullName || !this.user.userName || !this.user.email ||
        !this.user.department || !this.user.role || (!this.user.id && !this.user.password)) {
      this.message.add({ severity: 'warn', summary: 'Validation', detail: 'Champs requis manquants.' });
      return;
    }
    this.saving = true;
    const isNew = !this.user.id;
    setTimeout(() => {
      if (isNew) {
        this.users.unshift({
          id: (Math.random()*100000).toFixed(0),
          fullName: this.user.fullName!,
            userName: this.user.userName!,
            email: this.user.email!,
            department: this.user.department!,
            role: this.user.role!,
            phoneNumber: this.user.phoneNumber,
            isActive: this.user.isActive ?? true,
            createdAt: new Date().toISOString(),
            profilePicture: this.user.profilePicture
        });
        this.message.add({ severity: 'success', summary: 'Créé', detail: 'Utilisateur ajouté.' });
      } else {
        const i = this.users.findIndex(x => x.id === this.user.id);
        if (i > -1) this.users[i] = { ...(this.users[i]), ...(this.user as User) };
        this.message.add({ severity: 'success', summary: 'Mis à jour', detail: 'Utilisateur modifié.' });
      }
      this.computeStats();
      this.saving = false;
      this.userDialog = false;
    }, 500);
  }

  deleteUser(u: User) {
    this.confirm.confirm({
      message: `Supprimer l'utilisateur ${u.fullName} ?`,
      header: 'Confirmation',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.users = this.users.filter(x => x.id !== u.id);
        this.computeStats();
        this.message.add({ severity: 'success', summary: 'Supprimé', detail: 'Utilisateur supprimé.' });
      }
    });
  }

  deleteSelectedUsers() {
    if (!this.selectedUsers?.length) return;
    this.confirm.confirm({
      message: `Supprimer ${this.selectedUsers.length} utilisateurs ?`,
      header: 'Confirmation',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        const ids = new Set(this.selectedUsers.map(u => u.id));
        this.users = this.users.filter(u => !ids.has(u.id));
        this.selectedUsers = [];
        this.computeStats();
        this.message.add({ severity: 'success', summary: 'Supprimés', detail: 'Utilisateurs supprimés.' });
      }
    });
  }

  getInitials(name: string | undefined): string {
    if (!name) return '';
    return name.split(/\s+/).slice(0,2).map(p => p[0]?.toUpperCase()).join('');
  }

  getRoleSeverity(role: string): 'success' | 'info' | 'warning' | 'danger' | undefined {
    switch (role) {
      case 'Admin': return 'danger';
      case 'Manager': return 'warning';
      case 'User': return 'info';
      default: return undefined;
    }
  }

  onProfilePictureSelect(event: any) {
    const file: File = event.files?.[0];
    if (file) {
      this.profilePictureFile = file;
      const reader = new FileReader();
      reader.onload = () => this.user.profilePicture = reader.result as string;
      reader.readAsDataURL(file);
    }
  }

  onImportUsers(event: any) {
    const file: File = event.files?.[0];
    if (!file) return;
    this.message.add({ severity: 'info', summary: 'Import', detail: `Fichier ${file.name} en cours...` });
    setTimeout(() => {
      this.lastImportAt = new Date();
      this.message.add({ severity: 'success', summary: 'Import', detail: 'Import terminé.' });
      this.loadUsers();
    }, 1000);
  }

  exportUsers() {
    // const csv = [
    //   'Id,Nom complet,Username,Email,Département,Rôle,Actif',
    //   ...this.users.map(u =>
    //     `${u.id},"${u.fullName}",${u.userName},${u.email},${u.department},${u.role},${u.isActive}`)
    // ].join('\n');
    // const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
    // saveAs(blob, 'utilisateurs.csv');}
  }
}