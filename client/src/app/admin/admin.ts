import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { RouterModule, RouterOutlet } from '@angular/router';
import { SharedModule } from "../shared/shared.module";
import { Avatar } from "primeng/avatar";

@Component({
  selector: 'app-admin',
  
  standalone: true, 
  imports: [CommonModule, RouterOutlet, RouterModule, SharedModule, Avatar], 
  templateUrl: './admin.html',
  styleUrl: './admin.css'
})
export class Admin {
// ...existing code...
mobileMenuOpen = false;
pageTitle = 'Dashboard';
currentUser = { fullName: 'Tom Cook', role: 'Admin' };

navLinks: { label: string; path: string; icon: string; badge?: string | number; }[] = [
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


logout() {
  
}

}
