import { CommonModule } from '@angular/common';
import { Component, CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA, OnInit } from '@angular/core';
import { ActivatedRoute, RouterModule } from '@angular/router';
import { Breadcrumb } from 'primeng/breadcrumb';
import { ButtonModule } from 'primeng/button';
import { ChartModule } from 'primeng/chart';
import { FileUploadModule } from 'primeng/fileupload';
import { TabsModule } from 'primeng/tabs';
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
import { UserDto } from '../../shared/models/user';
import { FolderService } from '../../core/services/folder-service';
import { DocumentService } from '../../core/services/document-service';
import { DocumentPagedResult } from '../../shared/models/document';
interface FileItem {
  id: string;
  name: string;
  type: string;
  size: string;
  modifiedDate: Date;
  owner: string;
  isShared: boolean;
  path: string;
}

interface StorageData {
  name: string;
  icon: string;
  color: string;
  usage: number;
  filesCount: number;
  usedSpace: string;
}

interface FileCategory {
  name: string;
  type: string;
  icon: string;
  color: string;
  count: number;
}
@Component({
  selector: 'app-folder-details',
  schemas: [NO_ERRORS_SCHEMA, CUSTOM_ELEMENTS_SCHEMA,NO_ERRORS_SCHEMA],
  imports: [
    TabsModule  ,
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
  subFolders: FolderPagedResult | null = null;  
  subDocuments: DocumentPagedResult | null = null;
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
        subFolders: [
          {
            id: 2,
            name: 'Subfolder 1',

            createdById: 'user2',

            isActive: true,
            parentFolderId: 1,



            createdAt: '',
            createdBy: {} as UserDto
          }
        ],
        documents: [],
        documentCount: 0,
        parentFolder: {} as FolderDTO,
      },
      
    ]

    this.home = { icon: 'pi pi-home', routerLink: '/' };
    this.id = this.activatedRoute.snapshot.paramMap.get('id') || '';
    console.log('Current folder ID:', this.id);
    this.loadFolders();
    this.getDocuments();
    this.getSubFolders();
  }

  baseUrl = environment.apiUrl;

  constructor(private http: HttpClient, private activatedRoute: ActivatedRoute,
    private folderService:FolderService,
    private documentService:DocumentService,
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


  getDocuments(){
    this.documentService.getFolderDocuments(parseInt(this.id)).subscribe({
      next: (response: DocumentPagedResult) => {
        this.subDocuments = response;
        console.log('Documents fetched successfully:', response);
      },
      error: (error) => {
        console.error('Error fetching documents:', error);
      }
    });
  }

  getSubFolders(){
    this.folderService.getSubFolders(parseInt(this.id)).subscribe({
      next: (response: FolderPagedResult) => {
        this.subFolders = response;
        console.log('Subfolders fetched successfully:', response);
      },
      error: (error) => {
        console.error('Error fetching subfolders:', error);
      }
    });
  }


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






recentItems: FileItem[] = [
    {
      id: '1',
      name: 'Rapport Mensuel.pdf',
      type: 'pdf',
      size: '2.3 MB',
      modifiedDate: new Date('2024-12-06T10:30:00'),
      owner: 'Chedly Rebai',
      isShared: true,
      path: '/documents'
    },
    {
      id: '2',
      name: 'Projet Marketing',
      type: 'folder',
      size: '15 fichiers',
      modifiedDate: new Date('2024-12-05T14:22:00'),
      owner: 'Marie Martin',
      isShared: false,
      path: '/documents'
    },
    {
      id: '3',
      name: 'Présentation Client.pptx',
      type: 'powerpoint',
      size: '5.7 MB',
      modifiedDate: new Date('2024-12-04T09:15:00'),
      owner: 'Pierre Bernard',
      isShared: true,
      path: '/documents/presentations'
    },
    {
      id: '4',
      name: 'Budget 2024.xlsx',
      type: 'excel',
      size: '1.2 MB',
      modifiedDate: new Date('2024-12-03T16:45:00'),
      owner: 'Sophie Dubois',
      isShared: false,
      path: '/documents/finance'
    },
    {
      id: '5',
      name: 'Logo_Company.png',
      type: 'image',
      size: '345 KB',
      modifiedDate: new Date('2024-12-02T11:30:00'),
      owner: 'Lucas Moreau',
      isShared: true,
      path: '/documents/assets'
    }
  ];


   getFileIcon(type: string): string {
    const iconMap: { [key: string]: string } = {
      'PDF': 'pi pi-file-pdf',
      'word': 'pi pi-file-word',
      'DOCX': 'pi pi-file-word',
      'excel': 'pi pi-file-excel',
      'powerpoint': 'pi pi-file',
      'image': 'pi pi-image',
      'video': 'pi pi-video',
      'audio': 'pi pi-volume-up',
      'folder': 'pi pi-folder',
      'archive': 'pi pi-file-o'
    };
    return iconMap[type] || 'pi pi-file';
  }


   getTagSeverity(type: string): string {
    const severityMap: { [key: string]: string } = {
      'PDF': 'danger',
      'DOCX': 'info',
      'WORD': 'info',
      'EXCEL': 'success',
      'POWERPOINT': 'warning',
      'IMAGE': 'secondary',
      'FOLDER': 'info'
    };
    return severityMap[type] || 'secondary';
  }

  getFileTypeColor(type: string): string {
    const colorMap: { [key: string]: string } = {
      'pdf': '#EF4444',
      'PDF': '#EF4444',
      'word': '#2563EB',
      'DOCX': '#2563EB',
      'excel': '#059669',
      'powerpoint': '#DC2626',
      'image': '#7C3AED',
      'video': '#059669',
      'audio': '#F59E0B',
      'folder': '#3B82F6',
      'archive': '#6B7280'
    };
    return colorMap[type] || '#6B7280';
  }
  // Chart data
  storageChartData: any;
  storageChartOptions: any;

  // Dialog states
  showUploadDialog = false;
  uploadedFiles: any[] = [];

  // Context menu
  contextMenuItems: any[] = [];

 

  initializeCharts() {
    this.storageChartData = {
      labels: ['Documents', 'Images', 'Vidéos', 'Autres', 'Libre'],
      datasets: [{
        data: [45, 25, 15, 10, 5],
        backgroundColor: [
          '#3B82F6',
          '#10B981',
          '#F59E0B',
          '#8B5CF6',
          '#E5E7EB'
        ],
        borderWidth: 0
      }]
    };

    this.storageChartOptions = {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          position: 'bottom',
          labels: {
            usePointStyle: true,
            padding: 15
          }
        }
      }
    };
  }

  setupContextMenu() {
    this.contextMenuItems = [
      {
        label: 'Ouvrir',
        icon: 'pi pi-eye',
        
      },
      {
        label: 'Télécharger',
        icon: 'pi pi-download',
      
      },
      {
        label: 'Partager',
        icon: 'pi pi-share-alt',
        
      },
      {
        separator: true
      },
      {
        label: 'Renommer',
        icon: 'pi pi-pencil',
        
      },
      {
        label: 'Supprimer',
        icon: 'pi pi-trash',
       
      }
    ];
  }
  

  // File operations
  openItem(item: FileItem) {
    if (item.type === 'folder') {
      // Navigate to folder
      this.messageService.add({
        severity: 'info',
        summary: 'Navigation',
        detail: `Ouverture du dossier: ${item.name}`
      });
    } else {
      // Open file
      this.previewItem(item);
    }
  }

  previewItem(item: FileItem) {
    this.messageService.add({
      severity: 'info',
      summary: 'Aperçu',
      detail: `Aperçu du fichier: ${item.name}`
    });
  }

  downloadItem(item: FileItem) {
    this.messageService.add({
      severity: 'success',
      summary: 'Téléchargement',
      detail: `Téléchargement de: ${item.name}`
    });
  }

  shareItem(item: FileItem) {
    this.messageService.add({
      severity: 'info',
      summary: 'Partage',
      detail: `Partage de: ${item.name}`
    });
  }

  // Context menu actions
  showContextMenu(event: any, item: FileItem) {
    event.preventDefault();
    
  }

  showItemMenu(event: any, item: FileItem) {
    // Show dropdown menu for item
    event.stopPropagation();}
  



}
