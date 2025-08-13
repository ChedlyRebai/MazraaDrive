import { CommonModule } from '@angular/common';
import { Component, CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA, OnInit } from '@angular/core';
import { ActivatedRoute, RouterModule } from '@angular/router';
import { Breadcrumb } from 'primeng/breadcrumb';
import { ButtonModule } from 'primeng/button';
import { ChartModule } from 'primeng/chart';
import { FileUploadModule } from 'primeng/fileupload';
import { MenuModule } from 'primeng/menu';
import { PaginatorModule } from 'primeng/paginator';
import { TableModule } from 'primeng/table';
import { ToastModule } from 'primeng/toast';
import { ThemeSwitcher } from '../../admin/themeswitcher';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { ConfirmationService, MenuItem, MessageService } from 'primeng/api';
import { CreateFolderDTO, FolderDTO, FolderPagedResult } from '../../shared/models/folder';
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

@Component({
  selector: 'app-folder-details',
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
  templateUrl: './folder-details.html',
  styleUrl: './folder-details.css',
  providers: [ConfirmationService, MessageService],
})
export class FolderDetails implements OnInit {
  items: MenuItem[] | undefined;
  folders: FolderPagedResult = {} as FolderPagedResult;
  home: MenuItem | undefined;
  id = "";

  ngOnInit(): void {
    this.items = [
      { label: 'Electronics' },
      { label: 'Computer' },
      { label: 'Accessories' },
      { label: 'Keyboard' },
      { label: 'Wireless' }
    ];

    this.folders.data = [
      {
        id: 1,
        name: 'Folder 1',
        description: 'Description for Folder 1',
        createdById: 'user1',
        departmentId: 10,
        isActive: true,
        parentFolderId: null,
        parentFolderName: null,
        departmentName: '',
        createdByName: '',
        createdAt: '',
        updatedAt: null,
        subFolderCount: 0,

        subFolders: [],
        documents: [],
        documentCount: 0,
        parentFolder: {} as FolderDTO,
      },
      
    ]

    this.home = { icon: 'pi pi-home', routerLink: '/' };
    this.id = this.activatedRoute.snapshot.paramMap.get('id') || '';
    console.log('Current folder ID:', this.id);
    this.loadFolders();
  }

  baseUrl = environment.apiUrl;

  constructor(private http: HttpClient, private activatedRoute: ActivatedRoute,

    private messageService: MessageService,
    private confirmationService: ConfirmationService,

  ) {

  }

  loadFolders() {
    this.http.get<FolderDTO>(`${this.baseUrl}/Folder/${this.id}`).subscribe({
      next: (response: any) => {
        this.folders = response.data;
        console.log('Folders fetched successfully:', response);
      },
      error: (error) => {
        console.error('Error fetching folders:', error);
      }
    });
  }

  folderDialog: boolean = false;
  //folders: FolderDTO[] = [] as FolderDTO[];
  newFolder: CreateFolderDTO = {} as CreateFolderDTO;
  selectedFolders: FolderDTO[] | null = null;
  submitted: boolean = false;
  statuses: any[] = [];



  openNew() {
    this.newFolder = {} as FolderDTO;
    this.submitted = false;
    this.folderDialog = true;
  }

  editFolder(folder: FolderDTO) {
    this.newFolder = { ...folder };
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

  saveFolder() {
    //     curl -X 'POST' \
    //   'http://localhost:5108/api/Folder' \
    //   -H 'accept: text/plain' \
    //   -H 'Content-Type: application/json' \
    //   -d '{
    //   "name": "string",
    //   "description": "string",

    //   "createdById": "string",
    //   "departmentId": 10,
    //   "isActive": true
    // }'
    this.newFolder.parentFolderId = parseInt(this.id);
    console.log(this.activatedRoute.snapshot.paramMap.get('id')) // Set the parent folder ID to the current folder ID
    this.http.post(`${this.baseUrl}/Folder`, this.newFolder).subscribe({
      next: (response: any) => {
        console.log('Folder created successfully:', response);
        this.messageService.add({
          severity: 'success',
          summary: 'Successful',
          detail: 'Folder Created',
          life: 3000
        });
        this.loadFolders();
        this.folderDialog = false;
        this.newFolder = {} as FolderDTO;
      },
      error: (error) => {
        console.error('Error creating folder:', error);
        this.messageService.add({
          severity: 'error',
          summary: 'Error',
          detail: 'Failed to create folder',
          life: 3000
        });
      }
    });
    this.submitted = true;


    console.log('Saving folder:', this.newFolder);
  }

  // deleteProduct(product: Product) {
  //   this.confirmationService.confirm({
  //     message: 'Are you sure you want to delete ' + product.name + '?',
  //     header: 'Confirm',
  //     icon: 'pi pi-exclamation-triangle',
  //     rejectButtonProps: {
  //       label: 'No',
  //       severity: 'secondary',
  //       variant: 'text'
  //     },
  //     acceptButtonProps: {
  //       severity: 'danger',
  //       label: 'Yes'
  //     },
  //     accept: () => {
  //       // this.products = this.products.filter((val) => val.id !== product.id);
  //       // this.product = {};
  //       // this.messageService.add({
  //       //   severity: 'success',
  //       //   summary: 'Successful',
  //       //   detail: 'Product Deleted',
  //       //   life: 3000
  //       // });
  //     }
  //   });
  // }
  getFolders() {
    this.http.get(`${this.baseUrl}/Folder`).subscribe((response: any) => {
      this.folders = response.data as FolderPagedResult;
      console.log('Folders fetched successfully:', response.data);
      console.log(this.folders);
    });
  }

  hideDialog() {
    this.folderDialog = false;
    this.submitted = false;
  }










}
