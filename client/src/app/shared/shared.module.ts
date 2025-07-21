import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

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
    CommonModule,
    PRIMENG_MODULES
  ],
  exports:[
    PRIMENG_MODULES
  ],
})
export class SharedModule { }
