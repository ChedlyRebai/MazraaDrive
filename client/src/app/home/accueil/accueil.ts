import { CommonModule } from '@angular/common';
import { ChangeDetectorRef, Component, CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA, OnInit, ViewChild } from '@angular/core';
import { RouterModule } from '@angular/router';
import { Breadcrumb } from 'primeng/breadcrumb';
import { ButtonModule } from 'primeng/button';
import { ChartModule } from 'primeng/chart';
import { FileUploadModule } from 'primeng/fileupload';
import { MenuModule } from 'primeng/menu';
import { PaginatorModule } from 'primeng/paginator';
import { Table, TableModule } from 'primeng/table';
import { ToastModule } from 'primeng/toast';
import { ThemeSwitcher } from '../../admin/themeswitcher';
import { ConfirmationService, MenuItem, MessageService } from 'primeng/api';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { FolderDTO, FolderPagedResult } from '../../shared/models/folder';
import { FormsModule } from '@angular/forms';
import { CheckboxModule } from 'primeng/checkbox';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { DialogModule } from 'primeng/dialog';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { InputNumberModule } from 'primeng/inputnumber';
import { InputTextModule } from 'primeng/inputtext';
import { RadioButtonModule } from 'primeng/radiobutton';
import { RatingModule } from 'primeng/rating';
import { RippleModule } from 'primeng/ripple';
import { SelectModule } from 'primeng/select';
import { TagModule } from 'primeng/tag';
import { TextareaModule } from 'primeng/textarea';
import { ToolbarModule } from 'primeng/toolbar';
import { Product } from '../../admin/doc-req-management/doc-req-management';

@Component({
  selector: 'app-accueil',
  schemas: [NO_ERRORS_SCHEMA, CUSTOM_ELEMENTS_SCHEMA],
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
    CommonModule,
    FormsModule,
    // PrimeNG Modules
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
    InputIconModule,
    CheckboxModule,
    RippleModule,
    ThemeSwitcher,
    // PrimeNG Icons
    RouterModule,],
  templateUrl: './accueil.html',
  styleUrl: './accueil.css',
  providers: [ConfirmationService,MessageService  ]
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
    this.getFolders();
  }

  baseUrl = environment.apiUrl;

  @ViewChild('dt') dt!: Table;

  constructor(
    private messageService: MessageService,
    private confirmationService: ConfirmationService,
    private cd: ChangeDetectorRef,
    private http: HttpClient
  ) {}
  folders: FolderPagedResult= {} as FolderPagedResult;
  
  getFolders() {
    this.http.get(`${this.baseUrl}/Folder`).subscribe((response: any) => {
      this.folders = response.data as FolderPagedResult;
      console.log('Folders fetched successfully:', response.data);
      console.log(this.folders);
    });
  }
  folderDialog: boolean = false;
  //folders: FolderDTO[] = [] as FolderDTO[];
  folder: FolderDTO = {} as FolderDTO;
  selectedFolders: FolderDTO[] | null = null;
  submitted: boolean = false;
  statuses: any[] = [];
  


  openNew() {
    this.folder = {} as FolderDTO;
    this.submitted = false;
    this.folderDialog = true;
  }

  editFolder(folder: FolderDTO) {
    this.folder = { ...folder };
    this.folderDialog = true;
  }

  deleteSelectedProducts() {
    this.confirmationService.confirm({
      message: 'Are you sure you want to delete the selected products?',
      header: 'Confirm',
      icon: 'pi pi-exclamation-triangle',
      rejectButtonProps: {
        label: 'No',
        severity: 'secondary',
        variant: 'text'
      },
      acceptButtonProps: {
        severity: 'danger',
        label: 'Yes'
      },
      accept: () => {
        // this.products = this.products.filter((val) => !this.selectedProducts?.includes(val));
        // this.selectedProducts = null;
        // this.messageService.add({
        //   severity: 'success',
        //   summary: 'Successful',
        //   detail: 'Products Deleted',
        //   life: 3000
        // });
      }
    });
  }

  deleteProduct(product: Product) {
    this.confirmationService.confirm({
      message: 'Are you sure you want to delete ' + product.name + '?',
      header: 'Confirm',
      icon: 'pi pi-exclamation-triangle',
      rejectButtonProps: {
        label: 'No',
        severity: 'secondary',
        variant: 'text'
      },
      acceptButtonProps: {
        severity: 'danger',
        label: 'Yes'
      },
      accept: () => {
        // this.products = this.products.filter((val) => val.id !== product.id);
        // this.product = {};
        // this.messageService.add({
        //   severity: 'success',
        //   summary: 'Successful',
        //   detail: 'Product Deleted',
        //   life: 3000
        // });
      }
    });
  }

  hideDialog() {
    this.folderDialog = false;
    this.submitted = false;
  }

  saveProduct() {
    this.submitted = true;

    // if (this.product.name?.trim()) {
    //   if (this.product.id) {
    //     // Update existing product
    //     const index = this.findIndexById(this.product.id);
    //     if (index !== -1) {
    //       this.products[index] = this.product;
    //     }
    //     this.messageService.add({
    //       severity: 'success',
    //       summary: 'Successful',
    //       detail: 'Product Updated',
    //       life: 3000
    //     });
    //   } else {
    //     // Create new product
    //     this.product.id = this.createId();
    //     this.product.image = 'product-placeholder.svg';
    //     this.products.push(this.product);
    //     this.messageService.add({
    //       severity: 'success',
    //       summary: 'Successful',
    //       detail: 'Product Created',
    //       life: 3000
    //     });
    //   }

    //   this.products = [...this.products];
    //   this.folderDialog = false;
    //   this.product = {};
    //}
  }

 

 

  

  getSeverity(status: string): "success" | "info" | "warn" | "danger" | "secondary" | "contrast" | undefined {
    switch (status) {
      case 'INSTOCK':
        return 'success';
      case 'LOWSTOCK':
        return 'warn';
      case 'OUTOFSTOCK':
        return 'danger';
      default:
        return 'info';
    }
  }



}
