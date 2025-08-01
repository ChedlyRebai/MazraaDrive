import { CommonModule } from '@angular/common';
import { Component, CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA, OnInit } from '@angular/core';
import { RouterModule } from '@angular/router';
import { Breadcrumb } from 'primeng/breadcrumb';
import { ButtonModule } from 'primeng/button';
import { ChartModule } from 'primeng/chart';
import { FileUploadModule } from 'primeng/fileupload';
import { MenuModule } from 'primeng/menu';
import { PaginatorModule } from 'primeng/paginator';
import { TableModule } from 'primeng/table';
import { ToastModule } from 'primeng/toast';
import { ThemeSwitcher } from '../../admin/themeswitcher';
import { MenuItem } from 'primeng/api';

@Component({
  selector: 'app-accueil',
   schemas:[NO_ERRORS_SCHEMA, CUSTOM_ELEMENTS_SCHEMA],
  imports: [
    Breadcrumb,
    CommonModule,
    // PrimeNG Modules
    ButtonModule,
    ThemeSwitcher,
    MenuModule,
    ChartModule,
    TableModule,
    PaginatorModule,
    FileUploadModule,
    ToastModule,
    // PrimeNG Icons
   RouterModule,],
  templateUrl: './accueil.html',
  styleUrl: './accueil.css'
})
export class Accueil implements OnInit {
  items: MenuItem[] | undefined;

    home: MenuItem | undefined;
  ngOnInit(): void {
    this.items = [
            { label: 'Electronics' },
            { label: 'Computer' },
            { label: 'Accessories' },
            { label: 'Keyboard' },
            { label: 'Wireless' }
        ];

        this.home = { icon: 'pi pi-home', routerLink: '/' };
  
  }

}
