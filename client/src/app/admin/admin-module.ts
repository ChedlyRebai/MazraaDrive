import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdminRoutingModule } from './admin-routing-module';
import { RouterModule } from '@angular/router';

import { ButtonModule } from 'primeng/button';
import { ToastModule } from 'primeng/toast';
import { ToolbarModule } from 'primeng/toolbar';
import { FileUploadModule } from 'primeng/fileupload';
import { TableModule } from 'primeng/table';
import { DialogModule } from 'primeng/dialog';
import { InputTextModule } from 'primeng/inputtext';
import { TextareaModule } from 'primeng/textarea';
import { SelectModule } from 'primeng/select';
import { RadioButtonModule } from 'primeng/radiobutton';
import { InputNumberModule } from 'primeng/inputnumber';
import { RatingModule } from 'primeng/rating';
import { TagModule } from 'primeng/tag';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { SharedModule } from '../shared/shared.module';
import { RoleManagementComponent } from './role-mangement/role-mangement';
import { ThemeSwitcher } from '../shared/themeswitcher';


const PRIMENG_MODULES = [
  ButtonModule,
  ToastModule,
  ToolbarModule,
  FileUploadModule,
  TableModule,
  DialogModule,
  InputTextModule,
  TextareaModule,
  SelectModule,
  RadioButtonModule,
  InputNumberModule,
  RatingModule,
  TagModule,
  ConfirmDialogModule,
  IconFieldModule,
  InputIconModule
];


@NgModule({
  declarations: [],
  imports: [
    ThemeSwitcher,
    SharedModule,
    CommonModule,
   RoleManagementComponent,
    AdminRoutingModule,
    RouterModule,
    
    PRIMENG_MODULES
  ]
})
export class AdminModule { }
