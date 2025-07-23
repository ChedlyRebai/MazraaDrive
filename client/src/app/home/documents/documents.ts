import { Component, CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

// PrimeNG Imports
import { ButtonModule } from 'primeng/button';
import { MenuModule } from 'primeng/menu';
import { ChartModule } from 'primeng/chart';
import { TableModule } from 'primeng/table';
import { PaginatorModule } from 'primeng/paginator';
import { FileUploadModule } from 'primeng/fileupload';
import { ToastModule } from 'primeng/toast';

// PrimeNG Icons
import { PlusIcon } from 'primeng/icons/plus';
import { SortAltIcon } from 'primeng/icons/sortalt';
import { AngleDoubleLeftIcon } from 'primeng/icons/angledoubleleft';
import { AngleLeftIcon } from 'primeng/icons/angleleft';
import { AngleRightIcon } from 'primeng/icons/angleright';
import { AngleDoubleRightIcon } from 'primeng/icons/angledoubleright';

// Chart.js Types
import { ChartData, ChartOptions } from 'chart.js';

// Services
import { MessageService } from 'primeng/api';
import { ThemeSwitcher } from '../../admin/themeswitcher';

// Interfaces
interface StorageInfo {
  name: string;
  files: number;
  size: string;
  color: string;
  percentage: number;
}

interface FileCategory {
  name: string;
  icon: string;
  count: number;
  color: string;
}

interface RecentFile {
  name: string;
  date: string;
  fileSize: string;
  type: string;
  icon: string;
}

interface Folder {
  name: string;
  fileCount: number;
  icon: string;
}

@Component({
  selector: 'app-documents',
  standalone: true,
  schemas:[NO_ERRORS_SCHEMA, CUSTOM_ELEMENTS_SCHEMA],
  imports: [
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
   
   
  ],
  providers: [MessageService],
  templateUrl: './documents.html',
  styleUrl: './documents.css'
})
export class Documents implements OnInit {
storageData: StorageInfo[] = [
    {
      name: 'Cloud Storage',
      files: 412,
      size: '1.5GB',
      color: 'yellow',
      percentage: 34
    },
    {
      name: 'Dropbox Storage',
      files: 200,
      size: '4.1GB',
      color: 'pink',
      percentage: 34
    },
    {
      name: 'Google Drive Storage',
      files: 24,
      size: '1.3GB',
      color: 'green',
      percentage: 34
    },
    {
      name: 'Internal Storage',
      files: 82,
      size: '5.3GB',
      color: 'indigo',
      percentage: 34
    }
  ];

  // Chart data for account storage
  accountStorageData: ChartData = {
    datasets: []
  };
  accountStorageOptions: ChartOptions = {};

  // File categories
  fileCategories: FileCategory[] = [
    {
      name: 'Images',
      icon: 'pi pi-image',
      count: 85,
      color: 'indigo'
    },
    {
      name: 'Documents',
      icon: 'pi pi-file',
      count: 231,
      color: 'purple'
    },
    {
      name: 'Videos',
      icon: 'pi pi-video',
      count: 40,
      color: 'teal'
    }
  ];

  // Folders data
  folders: Folder[] = [
    {
      name: 'Miami 2022',
      fileCount: 12,
      icon: 'pi pi-folder'
    },
    {
      name: 'Prototype',
      fileCount: 1,
      icon: 'pi pi-folder'
    },
    {
      name: 'Other Files',
      fileCount: 53,
      icon: 'pi pi-folder'
    },
    {
      name: 'Antalya Holiday',
      fileCount: 1,
      icon: 'pi pi-folder'
    },
    {
      name: 'Studio Photography',
      fileCount: 3,
      icon: 'pi pi-folder'
    },
    {
      name: 'Server Backup',
      fileCount: 9,
      icon: 'pi pi-folder-open'
    },
    {
      name: 'Document Files',
      fileCount: 53,
      icon: 'pi pi-folder'
    },
    {
      name: 'Vocals',
      fileCount: 0,
      icon: 'pi pi-image'
    },
    {
      name: 'Voices',
      fileCount: 6,
      icon: 'pi pi-folder-open'
    }
  ];

  // Recent files data
  recentFiles: RecentFile[] = [
    {
      name: 'nature.jpeg',
      date: '29 Jul 2021',
      fileSize: '12 MB',
      type: 'image',
      icon: 'pi pi-image'
    },
    {
      name: 'report.pdf',
      date: '29 Jul 2021',
      fileSize: '6 MB',
      type: 'pdf',
      icon: 'pi pi-file-pdf'
    },
    {
      name: 'screenshot.jpeg',
      date: '29 Jul 2021',
      fileSize: '32 MB',
      type: 'image',
      icon: 'pi pi-image'
    },
    {
      name: 'sales.xls',
      date: '29 Jul 2021',
      fileSize: '12 MB',
      type: 'excel',
      icon: 'pi pi-file-excel'
    },
    {
      name: 'cv.pdf',
      date: '29 Jul 2021',
      fileSize: '1.6 MB',
      type: 'pdf',
      icon: 'pi pi-file-pdf'
    },
    {
      name: 'product.png',
      date: '29 Jul 2021',
      fileSize: '1.8 MB',
      type: 'image',
      icon: 'pi pi-image'
    },
    {
      name: 'income.xls',
      date: '29 Jul 2021',
      fileSize: '12 MB',
      type: 'excel',
      icon: 'pi pi-file-excel'
    },
    {
      name: 'art.png',
      date: '29 Jul 2021',
      fileSize: '6 MB',
      type: 'image',
      icon: 'pi pi-image'
    }
  ];

  // Table columns
  cols = [
    { field: 'name', header: 'Name' },
    { field: 'date', header: 'Date' },
    { field: 'fileSize', header: 'File Size' }
  ];

  // Pagination
  first: number = 0;
  rows: number = 10;

  constructor(private messageService: MessageService) {}

  ngOnInit() {
    this.initializeChart();
  }

  initializeChart() {
    // Account Storage Doughnut Chart
    this.accountStorageData = {
      labels: ['Used', 'Available'],
      datasets: [
        {
          data: [60, 40],
          backgroundColor: [
            'var(--primary-500)',
            'var(--surface-200)'
          ],
          borderWidth: 0
        }
      ]
    };

    this.accountStorageOptions = {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: false
        },
        tooltip: {
          callbacks: {
            label: (context) => {
              return `${context.label}: ${context.parsed}%`;
            }
          }
        }
      },
      elements: {
        arc: {
          //cutout: '70%'
          
        }
      }
    };
  }

  // File upload handlers
  onUpload(event: any) {
    this.messageService.add({
      severity: 'info',
      summary: 'File Uploaded',
      detail: 'File uploaded successfully'
    });
  }

  onSelect(event: any) {
    // Handle file selection
    console.log('Files selected:', event.files);
  }

  onError(event: any) {
    this.messageService.add({
      severity: 'error',
      summary: 'Upload Error',
      detail: 'File upload failed'
    });
  }

  // Storage card actions
  onStorageMenuAction(storage: StorageInfo, action: string) {
    console.log(`${action} action for ${storage.name}`);
  }

  // Folder actions
  onFolderClick(folder: Folder) {
    console.log('Opening folder:', folder.name);
    // Navigate to folder contents
  }

  // File category actions
  onCategoryClick(category: FileCategory) {
    console.log('Filtering by category:', category.name);
    // Filter files by category
  }

  // Recent files table actions
  onFileDelete(file: RecentFile) {
    console.log('Deleting file:', file.name);
    this.messageService.add({
      severity: 'success',
      summary: 'File Deleted',
      detail: `${file.name} has been deleted`
    });
  }

  onFileView(file: RecentFile) {
    console.log('Viewing file:', file.name);
    // Open file viewer/preview
  }

  // Account storage actions
  onViewDetails() {
    console.log('Viewing storage details');
    // Navigate to detailed storage view
  }

  onUpgradeStorage() {
    console.log('Upgrading storage');
    // Navigate to upgrade options
  }

  // Utility methods
  getStorageProgressClass(color: string): string {
    return `bg-${color}-500`;
  }

  getStorageBackgroundClass(color: string): string {
    return `bg-${color}-100`;
  }

  getCategoryClass(color: string): string {
    return `bg-${color}-50 text-${color}-900`;
  }

  getFileIcon(file: RecentFile): string {
    return `${file.icon} text-primary text-xl`;
  }

  // Pagination handlers
  onPageChange(event: any) {
    this.first = event.first;
    this.rows = event.rows;
  }
}
