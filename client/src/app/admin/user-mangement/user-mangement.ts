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
import { PasswordModule } from 'primeng/password';
import { FileUploadModule } from 'primeng/fileupload';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { TagModule } from 'primeng/tag';
import { AvatarModule } from 'primeng/avatar';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { TooltipModule } from 'primeng/tooltip';
import { ThemeSwitcher } from '../themeswitcher';
import { AutoCompleteModule } from 'primeng/autocomplete';

interface User {
  id?: number;
  fullName: string;
  userName: string;
  email: string;
  phoneNumber?: string;
  department: string;
  role: string;
  isActive: boolean;
  profilePicture?: string;
  password?: string;
  createdAt: Date;
  updatedAt?: Date;
  lastLoginAt?: Date;
}

@Component({
  selector: 'app-user-management',
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
    AutoCompleteModule,
    CheckboxModule,
    PasswordModule,
    FileUploadModule,
    ConfirmDialogModule,
    TagModule,
    AvatarModule,
    IconFieldModule,
    InputIconModule,
    TooltipModule,
    ThemeSwitcher
  ],
  providers: [MessageService, ConfirmationService],
  templateUrl: './user-mangement.html',
  styleUrls: ['./user-mangement.css']
})
export class UserMangement implements OnInit {

  users: User[] = [];
  selectedUsers: User[] = [];
  user: User = this.getEmptyUser();
  selectedUser: User | null = null;
  
  userDialog = false;
  userDetailsDialog = false;
  submitted = false;
  loading = false;
  saving = false;

  departments = [
    'Ressources Humaines',
    'Finance',
    'IT',
    'Marketing',
    'Opérations',
    'Ventes',
    'Administration'
  ];

  roles = [
    'Admin',
    'Manager',
    'Employee',
    'Viewer'
  ];

  private baseUrl = 'http://localhost:5108/api';

  constructor(
    private messageService: MessageService,
    private confirmationService: ConfirmationService,
    private http: HttpClient
  ) {}

  ngOnInit() {
    this.loadUsers();
  }

  get dialogTitle(): string {
    return this.user.id ? 'Modifier l\'utilisateur' : 'Nouvel utilisateur';
  }

  loadUsers() {
    this.loading = true;
    
    // Mock data for demonstration
    setTimeout(() => {
      this.users = [
        {
          id: 1,
          fullName: 'Jean Dupont',
          userName: 'jdupont',
          email: 'jean.dupont@company.com',
          phoneNumber: '+33 1 23 45 67 89',
          department: 'IT',
          role: 'Admin',
          isActive: true,
          createdAt: new Date('2024-01-15'),
          lastLoginAt: new Date('2024-12-06')
        },
        {
          id: 2,
          fullName: 'Marie Martin',
          userName: 'mmartin',
          email: 'marie.martin@company.com',
          phoneNumber: '+33 1 98 76 54 32',
          department: 'Ressources Humaines',
          role: 'Manager',
          isActive: true,
          createdAt: new Date('2024-02-01'),
          lastLoginAt: new Date('2024-12-05')
        },
        {
          id: 3,
          fullName: 'Pierre Bernard',
          userName: 'pbernard',
          email: 'pierre.bernard@company.com',
          department: 'Finance',
          role: 'Employee',
          isActive: false,
          createdAt: new Date('2024-03-10'),
          lastLoginAt: new Date('2024-11-20')
        },
        {
          id: 4,
          fullName: 'Sophie Dubois',
          userName: 'sdubois',
          email: 'sophie.dubois@company.com',
          phoneNumber: '+33 1 55 44 33 22',
          department: 'Marketing',
          role: 'Manager',
          isActive: true,
          createdAt: new Date('2024-04-05'),
          lastLoginAt: new Date('2024-12-04')
        }
      ];
      this.loading = false;
    }, 1000);

    // Uncomment this for real API call
    /*
    this.http.get<any>(`${this.baseUrl}/User`).subscribe({
      next: (response) => {
        if (response.success) {
          this.users = response.data;
        }
        this.loading = false;
      },
      error: (error) => {
        console.error('Error loading users:', error);
        this.messageService.add({
          severity: 'error',
          summary: 'Erreur',
          detail: 'Erreur lors du chargement des utilisateurs'
        });
        this.loading = false;
      }
    });
    */
  }

  openNew() {
    this.user = this.getEmptyUser();
    this.submitted = false;
    this.userDialog = true;
  }

  editUser(user: User) {
    this.user = { ...user };
    this.userDialog = true;
  }

  viewUser(user: User) {
    this.selectedUser = user;
    this.userDetailsDialog = true;
  }

  deleteUser(user: User) {
    this.confirmationService.confirm({
      message: `Êtes-vous sûr de vouloir supprimer ${user.fullName}?`,
      header: 'Confirmer la suppression',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.users = this.users.filter(u => u.id !== user.id);
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Utilisateur supprimé avec succès'
        });
      }
    });
  }

  deleteSelectedUsers() {
    this.confirmationService.confirm({
      message: `Êtes-vous sûr de vouloir supprimer ${this.selectedUsers.length} utilisateur(s)?`,
      header: 'Confirmer la suppression',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.users = this.users.filter(u => !this.selectedUsers.includes(u));
        this.selectedUsers = [];
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Utilisateurs supprimés avec succès'
        });
      }
    });
  }

  saveUser() {
    this.submitted = true;

    if (!this.isUserValid()) {
      return;
    }

    this.saving = true;

    // Simulate API call
    setTimeout(() => {
      if (this.user.id) {
        // Update existing user
        const index = this.users.findIndex(u => u.id === this.user.id);
        if (index !== -1) {
          this.users[index] = { ...this.user, updatedAt: new Date() };
        }
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Utilisateur modifié avec succès'
        });
      } else {
        // Create new user
        this.user.id = Math.max(...this.users.map(u => u.id || 0)) + 1;
        this.user.createdAt = new Date();
        this.users.push({ ...this.user });
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Utilisateur créé avec succès'
        });
      }

      this.saving = false;
      this.userDialog = false;
      this.user = this.getEmptyUser();
    }, 1500);

    // Real API call would be:
    /*
    const request = this.user.id 
      ? this.http.put(`${this.baseUrl}/User/${this.user.id}`, this.user)
      : this.http.post(`${this.baseUrl}/User`, this.user);

    request.subscribe({
      next: (response: any) => {
        if (response.success) {
          this.loadUsers();
          this.messageService.add({
            severity: 'success',
            summary: 'Succès',
            detail: this.user.id ? 'Utilisateur modifié' : 'Utilisateur créé'
          });
        }
        this.saving = false;
        this.userDialog = false;
        this.user = this.getEmptyUser();
      },
      error: (error) => {
        console.error('Error saving user:', error);
        this.messageService.add({
          severity: 'error',
          summary: 'Erreur',
          detail: 'Erreur lors de la sauvegarde'
        });
        this.saving = false;
      }
    });
    */
  }

  hideDialog() {
    this.userDialog = false;
    this.submitted = false;
    this.user = this.getEmptyUser();
  }

  onProfilePictureSelect(event: any) {
    const file = event.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = (e: any) => {
        this.user.profilePicture = e.target.result;
      };
      reader.readAsDataURL(file);
    }
  }

  onImportUsers(event: any) {
    const file = event.files[0];
    // Handle CSV/Excel import
    this.messageService.add({
      severity: 'info',
      summary: 'Import',
      detail: 'Fonctionnalité d\'import en cours de développement'
    });
  }

  exportUsers() {
    // Handle export functionality
    this.messageService.add({
      severity: 'info',
      summary: 'Export',
      detail: 'Fonctionnalité d\'export en cours de développement'
    });
  }

  // Utility methods
  getEmptyUser(): User {
    return {
      fullName: '',
      userName: '',
      email: '',
      phoneNumber: '',
      department: '',
      role: '',
      isActive: true,
      createdAt: new Date()
    };
  }

  isUserValid(): boolean {
    return !!(
      this.user.fullName?.trim() &&
      this.user.userName?.trim() &&
      this.user.email?.trim() &&
      this.user.department &&
      this.user.role &&
      (this.user.id || this.user.password?.trim())
    );
  }

  getInitials(name: string): string {
    return name
      .split(' ')
      .map(word => word.charAt(0))
      .join('')
      .toUpperCase()
      .slice(0, 2);
  }

  getRoleSeverity(role: string): string {
    switch (role) {
      case 'Admin':
        return 'danger';
      case 'Manager':
        return 'warning';
      case 'Employee':
        return 'info';
      case 'Viewer':
        return 'secondary';
      default:
        return 'info';
    }
  }
}