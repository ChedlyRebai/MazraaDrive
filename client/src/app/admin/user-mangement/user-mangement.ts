import { CreateUserDto, UserDto } from './../../shared/models/user';
import { Password } from 'primeng/password';
import { UserService } from './../../core/services/user-service';
import { Component, OnInit, Query, ViewChild } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { SharedModule } from '../../shared/shared.module';
import { Avatar } from 'primeng/avatar';
import { Checkbox } from 'primeng/checkbox';

import { AutoComplete } from 'primeng/autocomplete';
import { FloatLabelModule } from 'primeng/floatlabel';
import { ThemeSwitcher } from '../themeswitcher';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RoleService } from '../../core/services/role-service';
import { DepartmentService } from '../../core/services/department-service';

interface EditableUser extends Partial<UserDto> {
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
  imports: [
    SharedModule,
    Avatar,
    FormsModule,
    CommonModule,
    Checkbox,
    Password,
    AutoComplete,
    FloatLabelModule,
    ThemeSwitcher,
  ],
})
export class UserMangement implements OnInit {
  loading = false;
  saving = false;

  users: UserDto[] = [];
  selectedUsers: UserDto[] = [];

  userDialog = false;
  userDetailsDialog = false;
  dialogTitle = 'Nouvel Utilisateur';

  editMode = false;
  saveMode = false;
  user: UserDto = {} as UserDto;
  selectedUser: UserDto | null = null;
  submitted = false;

  totalUsers = 0;
  activeUsers = 0;
  inactiveUsers = 0;
  lastImportAt: Date | null = null;

  filter: UserFilter = { role: null, dept: null, status: null };

  
  statusOptions = [
    { label: 'Actif', value: true },
    { label: 'Inactif', value: false },
  ];

  PageSize?: number = 5;
  Search?: string = '';
  PageNumber?: number = 1;
  SortBy?: string = '';
  SortDirection?: string = '';
  getAllUsers() {
    this.userService.getUsers(
      this.PageSize,
      this.Search,
      this.PageNumber,
      this.SortBy,
      this.SortDirection
    );
  }

  onPageChange(event: any) {
    // this.first = event.first;
    this.PageNumber = event.first / event.rows + 1;
    this.PageSize = event.rows;
    this.getAllUsers();
  }
  
  departmentFiltered: any[] = [];
  statusFiltered: any[] = [];
  roleFilteredDialog: any[] = [];
  departmentFilteredDialog: any[] = [];

  profilePictureFile: File | null = null;

  constructor(
    public departmentService: DepartmentService,
    public roleService: RoleService,
    public userService: UserService,
    private message: MessageService,
    private confirm: ConfirmationService
  ) {
    this.loadRoles();
  }

  ngOnInit(): void {
    this.loadUsers();
    this.userService.getUsers();
    
  }


  loadRoles(){
    this.roleService.loadAllRoles().subscribe({
      next: (result:any[]) => {
        console.log(result)
        console.log('Roles loaded in component:', result);
        this.roleFilteredDialog = result;
      },
      error: (error) => {
        console.error('Error loading roles in component:', error);
      }
    });
  }

  initRoleSearch() {
    // this.roleService.getSearchRoles(this.user.role).subscribe(
    //   (result) => {
    //     this.roleFiltered = result;
    //   },
    //   (error) => {
    //     console.error('Error fetching roles:', error);
    //   }
    // );
  }

  // Autocomplete complete methods (filters)
  completeRole(e: any) {
    const q = (e.query || '').toLowerCase();
    console.log('completeRole:', q);
  }

  completeDepartment(e: any) {
    const q = (e.query || '').toLowerCase();
    if (q.length > 0) {
      this.roleService.getSearchRoles(q).subscribe(
        (result) => {
          console.log('API result:', result); // Shows array of objects
          this.roleFilteredDialog = result; // Directly assign raw objects
          // Now roleFilteredDialog contains [{id, name, description}, ...]
        },
        (error) => {
          console.error('Error fetching roles:', error);
        }
      );
    } else {
      this.roleFilteredDialog = [];
    }
  }

  completeStatus(e: any) {
    const q = (e.query || '').toLowerCase();
    this.statusFiltered = this.statusOptions.filter((o) =>
      o.label.toLowerCase().includes(q)
    );
  }

  // Autocomplete complete methods (dialog)
  completeRoleDialog(e: any) {
    const q = (e.query || '').toLowerCase();
    if (q.length > 0) {
      this.roleService.getSearchRoles(q).subscribe(
        (result) => {
          console.log('API result:', result); // Shows array of objects
          this.roleFilteredDialog = result; // Directly assign raw objects
          // Now roleFilteredDialog contains [{id, name, description}, ...]
        },
        (error) => {
          console.error('Error fetching roles:', error);
        }
      );
    } else {
      this.roleFilteredDialog = [];
    }
    console.log(this.user);
  }

  onSelectRole(e: any) {
    console.log(e);
  }
  completeDepartmentDialog(e: any) {
    const q = (e.query || '').toLowerCase();
    if (q.length > 0) {
      this.departmentService.getSearchDepartments(q).subscribe(
        (result) => {
          // result should be [{id, name, description}, ...]
          this.departmentFilteredDialog = result;
          // Now departmentFilteredDialog contains raw department objects
          console.log(
            'departmentFilteredDialog:',
            this.departmentFilteredDialog
          );
        },
        (error) => {
          console.error('Error fetching departments:', error);
          this.departmentFilteredDialog = [];
        }
      );
    } else {
      this.departmentFilteredDialog = [];
    }
    console.log(this.user);
  }

  applyFilters() {
    this.loadUsers();
  }
  clearRole() {
    this.filter.role = null;
    this.loadUsers();
  }
  clearDept() {
    this.filter.dept = null;
    this.loadUsers();
  }
  clearStatus() {
    this.filter.status = null;
    this.loadUsers();
  }

  onGlobalSearch(ev: any) {
    // hook if server-side global search required
  }

  loadUsers(): void {}

  computeStats() {
    this.totalUsers = this.users.length;
    this.activeUsers = this.users.filter((u) => u.isActive).length;
    this.inactiveUsers = this.totalUsers - this.activeUsers;
  }

  openNew() {
    this.user = {} as UserDto;
    this.dialogTitle = 'Nouvel Utilisateur';
    this.submitted = false;
    this.editMode = false;
    this.saveMode = true;
    this.profilePictureFile = null;
    this.userDialog = true;
  }

  editUser(u: UserDto) {
    this.user = { ...u };
    this.dialogTitle = 'Modifier Utilisateur';
    this.submitted = false;
    this.editMode = true;
    this.profilePictureFile = null;
    this.userDialog = true;
    this.saveMode = false;
  }

  viewUser(u: UserDto) {
    this.selectedUser = u;
    this.userDetailsDialog = true;
  }

  hideDialog() {
    this.userDialog = false;
  }

  newUser: CreateUserDto = {} as CreateUserDto;
 

  saveUser() {
    console.log(this.user);
    this.submitted = true;
    if (this.saveMode) {
      if (
        !this.user.userName ||
        !this.user.cin ||
        !this.user.departmentId ||
        !this.user.roleId ||
        !this.user.password ||
        (!this.user.id && !this.user.password)
      ) {
        this.message.add({
          severity: 'warn',
          summary: 'Validation',
          detail: 'Champs requis manquants.',
        });
        return;
      }
      console.log('Saving user:', this.user);
      this.saving = true;
      const isNew = !this.user.id;
     
      this.newUser = {
        cin: this.user.cin,
        confirmPassword: this.user.confirmPassword,
        departmentId: this.user.departmentId,

        password: this.user.password,
        phoneNumber: this.user.phoneNumber,
        roleId: this.user.roleId,

        userName: this.user.userName,
      };
      this.userService.createUser(this.newUser).subscribe({
        next: (user: any) => {
          this.message.add({
            severity: 'success',
            summary: 'Créé',
            detail: 'Utilisateur ajouté.',
          });

          this.computeStats();
          this.saving = false;
          this.userDialog = false;
          this.userService.getUsers();
        },
        error: (err) => {
          console.error('Error saving user:', err);
          this.message.add({
            severity: 'error',
            summary: 'Erreur',
            detail: "Échec de la sauvegarde de l'utilisateur.",
          });
          this.saving = false;
        },
      });
    }
    if (this.editMode) {
      if (
        !this.user.userName ||
        !this.user.departmentId ||
        !this.user.roleId ||
        !this.user.id
      ) {
        this.message.add({
          severity: 'warn',
          summary: 'Validation',
          detail: 'Champs requis manquants.',
        });
        return;
      }
      console.log('Editing user:', this.user);
      this.saving = true;
      console.log('Updating user:', this.user);
      this.userService.updateUser(this.user.id, this.user).subscribe({
        next: (user: any) => {
          this.message.add({
            severity: 'success',
            summary: 'Modifié',
            detail: 'Utilisateur modifié.',
          });

          this.computeStats();
          this.saving = false;
          this.userDialog = false;
          this.userService.getUsers();
        },
        error: (err) => {
          console.error('Error editing user:', err);
          this.message.add({
            severity: 'error',
            summary: 'Erreur',
            detail: "Échec de la modification de l'utilisateur.",
          });
          this.saving = false;
        },
      });
    }
  }

  deleteUser(u: UserDto) {
    this.confirm.confirm({
      message: `Supprimer l'utilisateur ${u.userName} ?`,
      header: 'Confirmation',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.userService.deleteUser(u.id).subscribe({
          next: () => {
            this.users = this.users.filter((x) => x.id !== u.id);
            this.computeStats();
            this.message.add({
              severity: 'success',
              summary: 'Supprimé',
              detail: 'Utilisateur supprimé.',
            });
            this.userService.getUsers();
          },
          error: (err) => {
            console.error('Error deleting user:', err);
            this.message.add({
              severity: 'error',
              summary: 'Erreur',
              detail: "Échec de la suppression de l'utilisateur.",
            });
          },
        });
      },
    });
  }

  deleteSelectedUsers() {
    if (!this.selectedUsers?.length) return;
    this.confirm.confirm({
      message: `Supprimer ${this.selectedUsers.length} utilisateurs ?`,
      header: 'Confirmation',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        const ids = new Set(this.selectedUsers.map((u) => u.id));
        this.users = this.users.filter((u) => !ids.has(u.id));
        this.selectedUsers = [];
        this.computeStats();
        this.message.add({
          severity: 'success',
          summary: 'Supprimés',
          detail: 'Utilisateurs supprimés.',
        });
      },
    });
  }

  getInitials(name: string | undefined): string {
    if (!name) return '';
    return name
      .split(/\s+/)
      .slice(0, 2)
      .map((p) => p[0]?.toUpperCase())
      .join('');
  }

  getRoleSeverity(
    role: string
  ): 'success' | 'info' | 'warning' | 'danger' | undefined {
    switch (role) {
      case 'Admin':
        return 'danger';
      case 'Manager':
        return 'warning';
      case 'User':
        return 'info';
      default:
        return undefined;
    }
  }

  onProfilePictureSelect(event: any) {}

  onImportUsers(event: any) {
    const file: File = event.files?.[0];
    if (!file) return;
    this.message.add({
      severity: 'info',
      summary: 'Import',
      detail: `Fichier ${file.name} en cours...`,
    });
    setTimeout(() => {
      this.lastImportAt = new Date();
      this.message.add({
        severity: 'success',
        summary: 'Import',
        detail: 'Import terminé.',
      });
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
