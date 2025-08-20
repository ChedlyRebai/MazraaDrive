import { FolderService } from './../../core/services/folder-service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

// PrimeNG Imports
import { MessageService, ConfirmationService, MenuItem } from 'primeng/api';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { DialogModule } from 'primeng/dialog';
import { InputTextModule } from 'primeng/inputtext';
import { TagModule } from 'primeng/tag';
import { ToastModule } from 'primeng/toast';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { AvatarModule } from 'primeng/avatar';
import { FileUploadModule } from 'primeng/fileupload';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { TooltipModule } from 'primeng/tooltip';
import { ProgressSpinnerModule } from 'primeng/progressspinner';
import { BreadcrumbModule } from 'primeng/breadcrumb';
import { ContextMenuModule } from 'primeng/contextmenu';
import { RadioButtonModule } from 'primeng/radiobutton';
import { ThemeSwitcher } from "../../admin/themeswitcher";
import { AdminRoutingModule } from "../../admin/admin-routing-module";


interface Folder {
  id: string;
  name: string;
  description?: string;
  createdAt: Date;
  createdByName: string;
  createdById: string;
  fileCount?: number;
  size?: string;
  visibility: 'private' | 'shared';
  category?: string;
  parentId?: string;
}

@Component({
  selector: 'app-accueil',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    TableModule,
    ButtonModule,
    DialogModule,
    InputTextModule,
    TagModule,
    ToastModule,
    ConfirmDialogModule,
    AvatarModule,
    FileUploadModule,
    IconFieldModule,
    InputIconModule,
    TooltipModule,
    ProgressSpinnerModule,
    BreadcrumbModule,
    ContextMenuModule,
    RadioButtonModule,
    ThemeSwitcher,
    AdminRoutingModule
],
  providers: [MessageService, ConfirmationService],
  templateUrl: './accueil.html',
  styleUrls: ['./accueil.css']
})
export class Accueil implements OnInit {
  @ViewChild('contextMenu') contextMenu: any;

  // Data
  folders: Folder[] = [];
  filteredFolders: Folder[] = [];
  selectedFolder: Folder | null = null;
  
  // Statistics
  totalFolders = 0;
  totalDocuments = 0;
  totalSize = '0 MB';
  recentFiles = 0;
  documentCount = 0;
  imageCount = 0;
  videoCount = 0;

  // UI State
  loading = false;
  saving = false;
  showSidebar = true;
  viewMode = 'grid';
  
  // Dialog States
  folderDialog = false;
  importDialog = false;
  editMode = false;
  submitted = false;

  // Search and Filter
  searchTerm = '';
  sortBy = '';
  currentCategory = '';

  // Forms
  newFolder: Partial<Folder> = {
    visibility: 'private'
  };

  // Breadcrumb
  items: MenuItem[] = [];
  home: MenuItem = { icon: 'pi pi-home', routerLink: '/home' };

  // Options
  sortOptions = [
    { label: 'Nom (A-Z)', value: 'name_asc' },
    { label: 'Nom (Z-A)', value: 'name_desc' },
    { label: 'Date (Plus récent)', value: 'date_desc' },
    { label: 'Date (Plus ancien)', value: 'date_asc' },
    { label: 'Taille (Plus grand)', value: 'size_desc' },
    { label: 'Taille (Plus petit)', value: 'size_asc' }
  ];

  viewModeOptions = [
    { label: 'Grille', value: 'grid' },
    { label: 'Liste', value: 'list' }
  ];

  // Context Menu
  contextMenuItems: MenuItem[] = [
    {
      label: 'Ouvrir',
      icon: 'pi pi-folder-open',
      command: () => this.openFolder(this.selectedFolder!)
    },
    {
      label: 'Modifier',
      icon: 'pi pi-pencil',
      command: () => this.editFolder(this.selectedFolder!)
    },
    {
      label: 'Partager',
      icon: 'pi pi-share-alt',
      command: () => this.shareFolder(this.selectedFolder!)
    },
    { separator: true },
    {
      label: 'Supprimer',
      icon: 'pi pi-trash',
      command: () => this.deleteFolder(this.selectedFolder!)
    }
  ];

  constructor(
    public folderService:FolderService,
    private messageService: MessageService,
    private confirmationService: ConfirmationService,
    private router: Router
  ) {}

  ngOnInit() {
    this.initializeBreadcrumb();
    this.loadFolders();
    this.loadStatistics();
    this.getAllFolders();
  }

  initializeBreadcrumb() {
    this.items = [
      { label: 'Accueil' }
    ];
  }

  loadFolders() {
    
    
    // // Mock data - replace with actual API call
    // setTimeout(() => {
    //   this.folders = [
    //     {
    //       id: '1',
    //       name: 'Documents Administratifs',
    //       description: 'Tous les documents administratifs de l\'entreprise',
    //       createdAt: new Date('2024-12-01T09:30:00'),
    //       createdByName: 'Admin User',
    //       createdById: '1',
    //       fileCount: 25,
    //       size: '15.2 MB',
    //       visibility: 'shared',
    //       category: 'documents'
    //     },
    //     {
    //       id: '2',
    //       name: 'Projets 2024',
    //       description: 'Dossiers des projets en cours pour l\'année 2024',
    //       createdAt: new Date('2024-11-15T14:20:00'),
    //       createdByName: 'Chedly Rebai',
    //       createdById: '2',
    //       fileCount: 42,
    //       size: '32.8 MB',
    //       visibility: 'private',
    //       category: 'documents'
    //     },
    //     {
    //       id: '3',
    //       name: 'Images Marketing',
    //       description: 'Photos et visuels pour les campagnes marketing',
    //       createdAt: new Date('2024-11-20T16:45:00'),
    //       createdByName: 'Marie Martin',
    //       createdById: '3',
    //       fileCount: 18,
    //       size: '125.4 MB',
    //       visibility: 'shared',
    //       category: 'images'
    //     },
    //     {
    //       id: '4',
    //       name: 'Formations Vidéo',
    //       description: 'Contenus vidéo pour la formation du personnel',
    //       createdAt: new Date('2024-10-30T11:15:00'),
    //       createdByName: 'Sophie Admin',
    //       createdById: '4',
    //       fileCount: 8,
    //       size: '2.1 GB',
    //       visibility: 'shared',
    //       category: 'videos'
    //     }
    //   ];
      
    //   this.filteredFolders = [...this.folders];
    //   this.updateStatistics();
    //   this.loading = false;
    // }, 1000);
  }

   PageSize?: number = 5;
  Search?: string = '';
  PageNumber?: number = 1;
  SortBy?: string = '';
  SortDirection?: string = '';
  getAllFolders() {
    this.folderService
       .getFolders(
         this.PageSize,
         this.Search,
         this.PageNumber,
         this.SortBy,
         this.SortDirection
       )
    //   .subscribe({
    //     next: (response: any) => {
    //       this.PageNumber = response.pageNumber;
    //       this.PageSize = response.pageSize;
    //       this.departments = response.data;
    //       this.totalRecords = response.totalRecords;
    //       this.totalDepartments = response.totalDepartments;
    //       this.totalUsers = response.totalUsers;
    //       this.avgUsersPerDepartment = Math.round(
    //         this.totalUsers / this.totalDepartments
    //       );
    //     },
    //   });
  }


  onPageChange(event: any) {
   // this.first = event.first;
    this.PageNumber = event.first / event.rows + 1;
    this.PageSize = event.rows;
    this.getAllFolders();
  }

  loadStatistics() {
    // Mock statistics - replace with actual API call
    this.totalFolders = this.folders.length;
    this.totalDocuments = 93;
    this.totalSize = '2.3 GB';
    this.recentFiles = 12;
    this.updateCategoryCounts();
  }

  updateStatistics() {
    this.totalFolders = this.folders.length;
    this.updateCategoryCounts();
  }

  updateCategoryCounts() {
    this.documentCount = this.folders.filter(f => f.category === 'documents').length;
    this.imageCount = this.folders.filter(f => f.category === 'images').length;
    this.videoCount = this.folders.filter(f => f.category === 'videos').length;
  }

  // Search and Filter Methods
  onSearch(event: any) {
    this.applyFilters();
  }

  onSort(event: any) {
    this.applySorting();
  }

  onViewModeChange(event: any) {
    // View mode is already updated via ngModel
  }

  setViewMode(mode: string) {
    this.viewMode = mode;
  }

  applyFilters() {
    this.filteredFolders = this.folders.filter(folder => {
      const matchesSearch = !this.searchTerm || 
        folder.name.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        (folder.description && folder.description.toLowerCase().includes(this.searchTerm.toLowerCase()));
      
      const matchesCategory = !this.currentCategory || folder.category === this.currentCategory;
      
      return matchesSearch && matchesCategory;
    });
    
    this.applySorting();
  }

  applySorting() {
    if (!this.sortBy) return;

    this.filteredFolders.sort((a, b) => {
      switch (this.sortBy) {
        case 'name_asc':
          return a.name.localeCompare(b.name);
        case 'name_desc':
          return b.name.localeCompare(a.name);
        case 'date_desc':
          return new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime();
        case 'date_asc':
          return new Date(a.createdAt).getTime() - new Date(b.createdAt).getTime();
        case 'size_desc':
          return this.parseSize(b.size || '0') - this.parseSize(a.size || '0');
        case 'size_asc':
          return this.parseSize(a.size || '0') - this.parseSize(b.size || '0');
        default:
          return 0;
      }
    });
  }

  parseSize(sizeStr: string): number {
    const match = sizeStr.match(/^(\d+(?:\.\d+)?)\s*(KB|MB|GB)?$/i);
    if (!match) return 0;
    
    const value = parseFloat(match[1]);
    const unit = (match[2] || 'KB').toUpperCase();
    
    switch (unit) {
      case 'GB': return value * 1024 * 1024;
      case 'MB': return value * 1024;
      case 'KB': return value;
      default: return value;
    }
  }

  filterByCategory(category: string) {
    this.currentCategory = this.currentCategory === category ? '' : category;
    this.applyFilters();
  }

  // Folder Operations
  openNew() {
    this.newFolder = { visibility: 'private' };
    this.editMode = false;
    this.submitted = false;
    this.folderDialog = true;
  }

  openFolder(folder: Folder) {
    this.messageService.add({
      severity: 'info',
      summary: 'Navigation',
      detail: `Ouverture du dossier: ${folder.name}`
    });

    this.router.navigate([`/home/folder/${folder.id}`]);
    
    // Navigate to folder content - implement navigation logic here
    // this.router.navigate(['/folder', folder.id]);
  }

  editFolder(folder: Folder) {
    this.newFolder = { ...folder };
    this.editMode = true;
    this.submitted = false;
    this.folderDialog = true;
  }

  saveFolder() {
    this.submitted = true;
    
    if (!this.newFolder.name?.trim()) {
      return;
    }

    this.saving = true;

    setTimeout(() => {
      if (this.editMode) {
        // Update existing folder
        const index = this.folders.findIndex(f => f.id === this.newFolder.id);
        if (index !== -1) {
          this.folders[index] = { ...this.newFolder } as Folder;
          this.messageService.add({
            severity: 'success',
            summary: 'Succès',
            detail: 'Dossier modifié avec succès'
          });
        }
      } else {
        // Create new folder
        const newFolder: Folder = {
          id: (this.folders.length + 1).toString(),
          name: this.newFolder.name!,
          description: this.newFolder.description,
          createdAt: new Date(),
          createdByName: 'Utilisateur Courant',
          createdById: 'current_user',
          fileCount: 0,
          size: '0 KB',
          visibility: this.newFolder.visibility || 'private',
          category: 'documents'
        };
        
        this.folders.unshift(newFolder);
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Dossier créé avec succès'
        });
      }

      this.applyFilters();
      this.updateStatistics();
      this.folderDialog = false;
      this.saving = false;
    }, 1500);
  }

  shareFolder(folder: Folder) {
    this.messageService.add({
      severity: 'info',
      summary: 'Partage',
      detail: `Fonction de partage pour: ${folder.name}`
    });
  }

  deleteFolder(folder: Folder) {
    this.confirmationService.confirm({
      message: `Êtes-vous sûr de vouloir supprimer le dossier "${folder.name}" ?`,
      header: 'Confirmer la suppression',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.folders = this.folders.filter(f => f.id !== folder.id);
        this.applyFilters();
        this.updateStatistics();
        
        this.messageService.add({
          severity: 'success',
          summary: 'Supprimé',
          detail: 'Dossier supprimé avec succès'
        });
      }
    });
  }

  hideDialog() {
    this.folderDialog = false;
    this.submitted = false;
    this.newFolder = { visibility: 'private' };
  }

  // Context Menu
  showContextMenu(event: any, folder: Folder | null) {
    event.preventDefault();

    if (folder) {
      this.selectedFolder = folder;
      this.contextMenu.show(event);
      
    }
  }

  // UI Methods
  toggleSidebar() {
    this.showSidebar = !this.showSidebar;
  }

  refreshFolders() {
    this.loadFolders();
    this.messageService.add({
      severity: 'info',
      summary: 'Actualisé',
      detail: 'Liste des dossiers actualisée'
    });
  }

  exportFolders() {
    this.messageService.add({
      severity: 'info',
      summary: 'Export',
      detail: 'Export des dossiers en cours...'
    });
  }

  openImportDialog() {
    this.importDialog = true;
  }

  onFilesSelect(event: any) {
    const files = event.files;
    this.messageService.add({
      severity: 'info',
      summary: 'Fichiers sélectionnés',
      detail: `${files.length} fichier(s) sélectionné(s)`
    });
  }

  // Utility Methods
  getInitials(name: string): string {
    return name.split(' ').map(n => n[0]).join('').toUpperCase();
  }

  formatFileSize(bytes: number): string {
    if (bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
  }

  getFolderIcon(category: string): string {
    const iconMap: { [key: string]: string } = {
      'documents': 'pi-file-text',
      'images': 'pi-image',
      'videos': 'pi-video',
      'default': 'pi-folder'
    };
    return iconMap[category] || iconMap['default'];
  }

  getFolderColor(category: string): string {
    const colorMap: { [key: string]: string } = {
      'documents': 'text-blue-500',
      'images': 'text-purple-500',
      'videos': 'text-green-500',
      'default': 'text-amber-500'
    };
    return colorMap[category] || colorMap['default'];
  }
}