import { FolderService } from './../../core/services/folder-service';
import { DocumentService } from './../../core/services/document-service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MessageService } from 'primeng/api';

// PrimeNG Imports
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { ChartModule } from 'primeng/chart';
import { BreadcrumbModule } from 'primeng/breadcrumb';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { AvatarModule } from 'primeng/avatar';
import { ToastModule } from 'primeng/toast';
import { DialogModule } from 'primeng/dialog';
import { FileUploadModule } from 'primeng/fileupload';
import { ContextMenuModule } from 'primeng/contextmenu';
import { SelectButtonModule } from 'primeng/selectbutton';
import { TooltipModule } from 'primeng/tooltip';
import { ThemeSwitcher } from '../../admin/themeswitcher';
import { TabsModule } from 'primeng/tabs';
import {
  DocFolderStats,
  DocumentDto,
  DocumentPagedResult,
} from '../../shared/models/document';
import { FolderDTO, FolderPagedResult } from '../../shared/models/folder';
import { Router } from '@angular/router';
import { NgxDocViewerModule } from "ngx-doc-viewer";

interface Document {
  id?: number;
  name: string;
  category: string;
  type: string;
  size: number;
  description?: string;
  tags?: string[];
  status: string;
  accessLevel: string;
  uploadedBy: string;
  uploadedAt: Date;
  expirationDate?: Date;
  version?: string;
  filePath?: string;
  isActive: boolean;
}
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
  selector: 'app-documents',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    ButtonModule,
    CardModule,
    ChartModule,
    BreadcrumbModule,
    TableModule,
    TagModule,
    AvatarModule,
    ToastModule,
    DialogModule,
    FileUploadModule,
    ContextMenuModule,
    SelectButtonModule,
    TooltipModule,
    ThemeSwitcher,
    TabsModule,
    NgxDocViewerModule
],
  providers: [MessageService],
  templateUrl: './documents.html',
  styleUrls: ['./documents.css'],
})
export class Documents implements OnInit {
  @ViewChild('contextMenu') contextMenu: any;

  // User and stats data
  currentUser = { name: 'Chedly Rebai', email: 'jean.dupont@company.com' };
  totalFiles = 718;
  totalFolders = 45;
  sharedFiles = 156;
  usedStorage = 12.4;
  totalStorage = 50;
  usedStoragePercentage = 25;

  documents: Document[] = [];
  selectedDocuments: Document[] = [];
  selectedDocument: DocumentDto | null = null;
  document: Document = this.getEmptyDocument();

  documentDialog = false;
  previewDialog = false;
  submitted = false;
  loading = false;
  saving = false;

  // View settings
  viewMode = 'grid';
  viewOptions = [
    { label: 'Grille', value: 'grid', icon: 'pi pi-th-large' },
    { label: 'Liste', value: 'list', icon: 'pi pi-list' },
  ];

  // Breadcrumb
  breadcrumbItems = [
    { label: 'Mes documents' },
    { label: 'Dossier principal' },
  ];
  homeItem = { icon: 'pi pi-home', routerLink: '/' };

  selectedFile: File | null = null;

  categories = [
    'Rapports',
    'Contrats',
    'Factures',
    'Certificats',
    'Politiques',
    'Procédures',
    'Formulaires',
    'Images',
    'Autres',
  ];

  statuses = ['Actif', 'Archivé', 'Brouillon', 'En révision', 'Expiré'];
  // Storage data
  storageData: StorageData[] = [
    {
      name: 'Stockage Cloud',
      icon: 'pi pi-cloud',
      color: '#3B82F6',
      usage: 65,
      filesCount: 412,
      usedSpace: '1.5GB',
    },
    {
      name: 'Stockage Local',
      icon: 'pi pi-server',
      color: '#10B981',
      usage: 45,
      filesCount: 156,
      usedSpace: '850MB',
    },
    {
      name: 'Partagé',
      icon: 'pi pi-share-alt',
      color: '#F59E0B',
      usage: 30,
      filesCount: 89,
      usedSpace: '2.1GB',
    },
    {
      name: 'Synchronisé',
      icon: 'pi pi-sync',
      color: '#8B5CF6',
      usage: 78,
      filesCount: 61,
      usedSpace: '1.2GB',
    },
  ];

  // File categories

  // Recent files and folders
  recentItems: FileItem[] = [
    {
      id: '1',
      name: 'Rapport Mensuel.pdf',
      type: 'pdf',
      size: '2.3 MB',
      modifiedDate: new Date('2024-12-06T10:30:00'),
      owner: 'Chedly Rebai',
      isShared: true,
      path: '/documents',
    },
    {
      id: '2',
      name: 'Projet Marketing',
      type: 'folder',
      size: '15 fichiers',
      modifiedDate: new Date('2024-12-05T14:22:00'),
      owner: 'Marie Martin',
      isShared: false,
      path: '/documents',
    },
    {
      id: '3',
      name: 'Présentation Client.pptx',
      type: 'powerpoint',
      size: '5.7 MB',
      modifiedDate: new Date('2024-12-04T09:15:00'),
      owner: 'Pierre Bernard',
      isShared: true,
      path: '/documents/presentations',
    },
    {
      id: '4',
      name: 'Budget 2024.xlsx',
      type: 'excel',
      size: '1.2 MB',
      modifiedDate: new Date('2024-12-03T16:45:00'),
      owner: 'Sophie Dubois',
      isShared: false,
      path: '/documents/finance',
    },
    {
      id: '5',
      name: 'Logo_Company.png',
      type: 'image',
      size: '345 KB',
      modifiedDate: new Date('2024-12-02T11:30:00'),
      owner: 'Lucas Moreau',
      isShared: true,
      path: '/documents/assets',
    },
  ];
  myDocumentss: DocumentPagedResult = {} as DocumentPagedResult;
  myFolders: FolderPagedResult = {} as FolderPagedResult;

  getmyDocs() {
    this.documentService.getMydocuments().subscribe({
      next: (docs: DocumentPagedResult) => {
        this.myDocumentss = docs;
        console.log('My documents fetched:', docs);
      },
      error: (error) => {
        console.error('Error fetching my documents:', error);
      },
    });
  }

  // Chart data
  storageChartData: any;
  storageChartOptions: any;

  // Dialog states
  showUploadDialog = false;
  uploadedFiles: any[] = [];

  // Context menu
  contextMenuItems: any[] = [];
  //stats
  stats: DocFolderStats = {} as DocFolderStats;
  constructor(
    private router: Router,
    private messageService: MessageService,
    public documentService: DocumentService,
    public folderService: FolderService
  ) {}

  viewDocument(document: DocumentDto) {
    this.selectedDocument = document;
    this.previewDialog = true;
    console.log('Viewing document:', document);
    this.previewDialog = true;
    this.showUploadDialog = true;
    this.documentDialog=true;
  }
  ngOnInit() {
    this.getmyDocs();
    this.getMyFolders();
    this.initializeCharts();
    this.setupContextMenu();
    this.initializeStats();
  }

   viewFolder(folder:FolderDTO){
     window.open(`/home/folder/${folder.id}`, '_blank');
   }
  getMyFolders() {
    this.folderService.getMyFolders().subscribe({
      next: (folders: FolderPagedResult) => {
        this.myFolders = folders;
        console.log('My folders fetched:', folders);
      },
      error: (error) => {
        console.error('Error fetching my folders:', error);
      },
    });
  }

  initializeStats() {
    this.documentService.getMyStats().subscribe({
      next: (stats: DocFolderStats) => {
        this.stats = stats;
        console.log('Document stats fetched:', stats.pdfCount);
        this.storageChartData = {
          labels: ['Documents', 'Images', 'Vidéos', 'Word', 'Pdf', 'Audio'],
          datasets: [
            {
              data: [
                stats.documentCount,
                stats.imageCount,
                stats.videoCount,
                stats.wordCount,
                stats.pdfCount,
                stats.audioCount,
              ],
              backgroundColor: [
                '#3B82F6',
                '#10B981',
                '#F59E0B',
                '#8B5CF6',
                '#E5E7EB',
              ],
              borderWidth: 0,
            },
          ],
        };

        this.storageChartOptions = {
          responsive: true,
          maintainAspectRatio: false,
          plugins: {
            legend: {
              position: 'bottom',
              labels: {
                usePointStyle: true,
                padding: 15,
              },
            },
          },
        };
        this.initializeFileCategories();
      },
      error: (error) => {
        console.error('Error fetching document stats:', error);
      },
    });

    this.storageChartData = {
      labels: ['Documents', 'Images', 'Vidéos', 'Autres', 'Pdf'],
      datasets: [
        {
          data: [this.stats.documentCount, this.stats.imageCount, 15, 10, 5],
          backgroundColor: [
            '#3B82F6',
            '#10B981',
            '#F59E0B',
            '#8B5CF6',
            '#E5E7EB',
          ],
          borderWidth: 0,
        },
      ],
    };

    this.storageChartOptions = {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          position: 'bottom',
          labels: {
            usePointStyle: true,
            padding: 15,
          },
        },
      },
    };
  }
  initializeFileCategories() {
    this.fileCategories = [
      {
        name: 'Images',
        type: 'image',
        icon: 'pi pi-image',
        color: '#3B82F6',
        count: this.stats.imageCount,
      },
      {
        name: 'Documents',
        type: 'document',
        icon: 'pi pi-file',
        color: '#8B5CF6',
        count: this.stats.documentCount,
      },
      {
        name: 'Vidéos',
        type: 'video',
        icon: 'pi pi-video',
        color: '#10B981',
        count: this.stats.videoCount,
      },
      {
        name: 'Audio',
        type: 'audio',
        icon: 'pi pi-volume-up',
        color: '#F59E0B',
        count: this.stats.audioCount,
      },
    ];
  }
  fileCategories: FileCategory[] = [
    {
      name: 'Images',
      type: 'image',
      icon: 'pi pi-image',
      color: '#3B82F6',
      count: this.stats.imageCount,
    },
    {
      name: 'Documents',
      type: 'document',
      icon: 'pi pi-file',
      color: '#8B5CF6',
      count: this.stats.documentCount,
    },
    {
      name: 'Vidéos',
      type: 'video',
      icon: 'pi pi-video',
      color: '#10B981',
      count: this.stats.videoCount,
    },
    {
      name: 'Audio',
      type: 'audio',
      icon: 'pi pi-volume-up',
      color: '#F59E0B',
      count: this.stats.audioCount,
    },
  ];

  initializeCharts() {}

  setupContextMenu() {
    this.contextMenuItems = [
      {
        label: 'Ouvrir',
        icon: 'pi pi-eye',
        command: () => this.openSelectedItem(),
      },
      {
        label: 'Télécharger',
        icon: 'pi pi-download',
        command: () => this.downloadSelectedItem(),
      },
      {
        label: 'Partager',
        icon: 'pi pi-share-alt',
        command: () => this.shareSelectedItem(),
      },
      {
        separator: true,
      },
      {
        label: 'Renommer',
        icon: 'pi pi-pencil',
        command: () => this.renameSelectedItem(),
      },
      {
        label: 'Supprimer',
        icon: 'pi pi-trash',
        command: () => this.deleteSelectedItem(),
      },
    ];
  }

  // File operations
  openItem(item: any) {
    if (item.type === 'folder') {
      // Navigate to folder
      this.router.navigate([`/home/folder/${item.id}`]);
    } else {
      // Open file
      this.previewItem(item);
    }
  }

  //     severity: 'info',
  //     summary: 'Navigation',
  //     detail: `Ouverture du dossier: ${item.name}`,
  //   });
  // } else {
  //   // Open file
  //   this.previewItem(item);
  // }

  previewItem(item: FolderDTO) {
    this.messageService.add({
      severity: 'info',
      summary: 'Aperçu',
      detail: `Aperçu du dossier: ${item.name}`,
    });
  }

  downloadItem(item: FolderDTO) {
    this.messageService.add({
      severity: 'success',
      summary: 'Téléchargement',
      detail: `Téléchargement de: ${item.name}`,
    });
  }

  shareItem(item: FolderDTO) {
    this.messageService.add({
      severity: 'info',
      summary: 'Partage',
      detail: `Partage de: ${item.name}`,
    });
  }

  // Context menu actions
  showContextMenu(event: any, item: FolderDTO) {
    event.preventDefault();
    this.contextMenu.show(event);
  }

  showItemMenu(event: any, item: FolderDTO) {
    // Show dropdown menu for item
    event.stopPropagation();
  }

  openSelectedItem() {
    this.messageService.add({
      severity: 'info',
      summary: 'Ouverture',
      detail: "Ouverture de l'élément sélectionné",
    });
  }

  downloadSelectedItem() {
    this.messageService.add({
      severity: 'success',
      summary: 'Téléchargement',
      detail: 'Téléchargement en cours...',
    });
  }

  shareSelectedItem() {
    this.messageService.add({
      severity: 'info',
      summary: 'Partage',
      detail: 'Création du lien de partage...',
    });
  }

  renameSelectedItem() {
    this.messageService.add({
      severity: 'info',
      summary: 'Renommage',
      detail: 'Mode renommage activé',
    });
  }

  deleteSelectedItem() {
    this.messageService.add({
      severity: 'warn',
      summary: 'Suppression',
      detail: 'Élément déplacé vers la corbeille',
    });
  }

  // Actions
  createNewFolder() {
    this.messageService.add({
      severity: 'success',
      summary: 'Nouveau dossier',
      detail: "Création d'un nouveau dossier",
    });
  }

  uploadFiles() {
    this.showUploadDialog = true;
  }

  refreshFiles() {
    this.messageService.add({
      severity: 'info',
      summary: 'Actualisation',
      detail: 'Liste des fichiers actualisée',
    });
  }

  manageStorage() {
    this.messageService.add({
      severity: 'info',
      summary: 'Gestion du stockage',
      detail: 'Ouverture des paramètres de stockage',
    });
  }

  filterByCategory(categoryType: string) {
    this.messageService.add({
      severity: 'info',
      summary: 'Filtrage',
      detail: `Affichage des fichiers de type: ${categoryType}`,
    });
  }

  createShareLink() {
    this.messageService.add({
      severity: 'info',
      summary: 'Lien de partage',
      detail: "Création d'un lien de partage public",
    });
  }

  viewTrash() {
    this.messageService.add({
      severity: 'info',
      summary: 'Corbeille',
      detail: 'Ouverture de la corbeille',
    });
  }

  // Upload handlers
  onUpload(event: any) {
    for (let file of event.files) {
      this.uploadedFiles.push(file);
    }
    this.messageService.add({
      severity: 'success',
      summary: 'Téléchargement réussi',
      detail: `${event.files.length} fichier(s) téléchargé(s)`,
    });
    this.showUploadDialog = false;
  }

  onUploadError(event: any) {
    this.messageService.add({
      severity: 'error',
      summary: 'Erreur de téléchargement',
      detail: 'Échec du téléchargement',
    });
  }

  // Utility methods
  getFileIcon(type: string): string {
    const iconMap: { [key: string]: string } = {
      pdf: 'pi pi-file-pdf',
      doc: 'pi pi-file-word',
      word: 'pi pi-file-word',
      excel: 'pi pi-file-excel',
      powerpoint: 'pi pi-file',
      image: 'pi pi-image',
      video: 'pi pi-video',
      audio: 'pi pi-volume-up',
      folder: 'pi pi-folder',
      archive: 'pi pi-file-o',
    };
    return iconMap[type] || 'pi pi-file';
  }

  getFileTypeColor(type: string): string {
    const colorMap: { [key: string]: string } = {
      PDF: '#EF4444',
      pdf: '#EF4444',
      png: '#7C3AED',
      word: '#2563EB',
      doc: '#2563EB',
      excel: '#059669',
      powerpoint: '#DC2626',
      image: '#7C3AED',
      video: '#059669',
      audio: '#F59E0B',
      folder: '#3B82F6',
      archive: '#6B7280',
    };
    return colorMap[type] || '#6B7280';
  }

  getTagSeverity(type: string): string {
    const severityMap: { [key: string]: string } = {
      PDF: 'danger',
      pdf: 'danger',
      doc: 'info',
      png: 'secondary',
      word: 'info',
      excel: 'success',
      powerpoint: 'warning',
      image: 'secondary',
      folder: 'info',
    };
    return severityMap[type] || 'secondary';
  }

  getInitials(name: string): string {
    return name
      .split(' ')
      .map((n) => n[0])
      .join('')
      .toUpperCase();
  }

  downloadDocument(document: Document) {
    // Simulate download
    this.messageService.add({
      severity: 'info',
      summary: 'Téléchargement',
      detail: `Téléchargement de "${document.name}" en cours...`,
    });

    // In real implementation, you would call your API to get the file
    // this.http.get(`${this.baseUrl}/Document/${document.id}/download`, { responseType: 'blob' })
  }

  saveDocument() {
    this.submitted = true;

    if (!this.isDocumentValid()) {
      return;
    }

    this.saving = true;

    // Simulate API call with file upload
    setTimeout(() => {
      if (this.document.id) {
        // Update existing document
        const index = this.documents.findIndex(
          (d) => d.id === this.document.id
        );
        if (index !== -1) {
          this.documents[index] = { ...this.document };
        }
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Document modifié avec succès',
        });
      } else {
        // Create new document
        this.document.id =
          Math.max(...this.documents.map((d) => d.id || 0)) + 1;
        this.document.uploadedAt = new Date();
        this.document.uploadedBy = 'Utilisateur Actuel'; // Get from auth service
        this.document.isActive = true;

        if (this.selectedFile) {
          this.document.type = this.getFileExtension(this.selectedFile.name);
          this.document.size = this.selectedFile.size;
        }

        this.documents.push({ ...this.document });
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Document créé avec succès',
        });
      }

      this.saving = false;
      this.documentDialog = false;
      this.document = this.getEmptyDocument();
      this.selectedFile = null;
    }, 2000);
  }

  hideDialog() {
    this.documentDialog = false;
    this.submitted = false;
    this.document = this.getEmptyDocument();
    this.selectedFile = null;
  }

  onFileSelect(event: any) {
    this.selectedFile = event.files[0];
    if (this.selectedFile && !this.document.name) {
      this.document.name = this.selectedFile.name;
    }
  }

  onImportDocuments(event: any) {
    const files = event.files;
    this.messageService.add({
      severity: 'info',
      summary: 'Import',
      detail: `${files.length} fichier(s) importé(s)`,
    });
  }

  exportDocuments() {
    this.messageService.add({
      severity: 'info',
      summary: 'Export',
      detail: 'Export des documents en cours...',
    });
  }

  // Utility methods
  getEmptyDocument(): Document {
    return {
      name: '',
      category: '',
      type: '',
      size: 0,
      description: '',
      tags: [],
      status: 'Actif',
      accessLevel: 'Public',
      uploadedBy: '',
      uploadedAt: new Date(),
      isActive: true,
    };
  }

  isDocumentValid(): boolean {
    return !!(
      this.document.name?.trim() &&
      this.document.category &&
      (this.document.id || this.selectedFile)
    );
  }

  getFileExtension(filename: string): string {
    return filename.split('.').pop()?.toUpperCase() || '';
  }

  get dialogTitle(): string {
    return this.document.id ? 'Modifier le document' : 'Nouveau document';
  }

  formatFileSize(bytes: number): string {
    if (bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
  }
}
