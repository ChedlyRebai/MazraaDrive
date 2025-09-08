import { CommonModule } from '@angular/common';
import { Component, inject, OnInit } from '@angular/core';
import { RouterModule, RouterOutlet } from '@angular/router';
import { SharedModule } from "../shared/shared.module";
import { Avatar } from "primeng/avatar";
import { UserService } from '../core/services/user-service';

@Component({
  selector: 'app-admin',
  
  standalone: true, 
  imports: [CommonModule, RouterOutlet, RouterModule, SharedModule, Avatar], 
  templateUrl: './admin.html',
  styleUrl: './admin.css'
})
export class Admin implements OnInit {
  constructor(private userService: UserService) {}
// ...existing code...
mobileMenuOpen = false;
pageTitle = 'Dashboard';

navLinks: { label: string; path: string; icon: string; badge?: string | number; }[] = [
  {label:'Home' , path:'/home/accueil', icon:'pi pi-home'},
  { label: 'Dashboard', path: '/admin/stats', icon: 'pi pi-chart-bar' },
  { label: 'Users', path: '/admin/user', icon: 'pi pi-users' },
  { label: 'Documents', path: '/admin/document', icon: 'pi pi-file' },
  { label: 'Departments', path: '/admin/department', icon: 'pi pi-sitemap' },
  { label: 'Roles', path: '/admin/role', icon: 'pi pi-shield' },
  { label: 'Doc Access Requests', path: '/admin/access-req', icon: 'pi pi-inbox' },
  { label: 'Permissions', path: '/admin/permissions', icon: 'pi pi-lock' },
  { label: 'Logs', path: '/admin/logs/action-logs', icon: 'pi pi-history' },
  { label: 'Doc Requests', path: '/admin/doc-req', icon: 'pi pi-inbox' }
];

ngOnInit(): void {
  this.getCurrentUser();
}
 currentUser = {
    id: "",
    departmentId: 0,
    role: "",
    name: "",
    avatar: "/assets/avatar.png"
  };

  getCurrentUser() {
    this.userService.getCurrentUser().subscribe((user: any) => {
      console.log("current user:",user);
      this.currentUser = {
        id: user.id,
        departmentId: user.departmentId,
        name: user.name,
        role: user.role,
        avatar: user.avatar || '/assets/avatar.png',
      };
    });
  }


   getInitials(name: string) {
    return (name || '')
      .split(' ')
      .filter((p) => p)
      .slice(0, 2)
      .map((p) => p[0]?.toUpperCase())
      .join('');
  }
logout() {
  window.location.href = '/login';
}

}
