import { JwtService } from './../../core/services/jwt-service';
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MessageService, ConfirmationService } from 'primeng/api';
import { HttpClient } from '@angular/common/http';

// PrimeNG Imports
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { ToastModule } from 'primeng/toast';
import { ToolbarModule } from 'primeng/toolbar';
import { DialogModule } from 'primeng/dialog';
import { InputTextModule } from 'primeng/inputtext';
import { RadioButtonModule } from 'primeng/radiobutton';
import { FileUploadModule } from 'primeng/fileupload';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { TagModule } from 'primeng/tag';
import { AvatarModule } from 'primeng/avatar';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { TooltipModule } from 'primeng/tooltip';

// Models

import { Textarea } from 'primeng/textarea';
import { AutoComplete, AutoCompleteModule } from 'primeng/autocomplete';
import { ThemeSwitcher } from '../../admin/themeswitcher';
import {
  CreateDocumentRequestDTO,
  DocumentRequestDTO,
  DocumentRequestFilterDTO,
  DocumentRequestPagedResult,
  DocumentRequestStatsDto,
  UpdateDocumentRequestDTO,
} from '../../shared/models/docrequest';
import { DocumentRequsetService } from '../../core/services/document-requset-service';
import { Tabs, TabsModule } from 'primeng/tabs';
import {
  TabList,
  Tab,
  TabPanels,
  TabPanel,
} from '../../../../node_modules/primeng/tabs/index';
import { DocumentService } from '../../core/services/document-service';
import { DocumentDto } from '../../shared/models/document';

interface Department {
  id: number;
  name: string;
}

interface Request {
  id: string;
  requesterName: string;
  requesterEmail: string;
  departmentName: string;
  departmentId: string;
  documentType: string;
  priority: string;
  status: string;
  description: string;
  requestedAt: Date;
  createdAt: Date;
  respondedAt?: Date;
  processedByName?: string;
  responseDocumentName?: string;
}
@Component({
  selector: 'app-doc-req-management',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    TableModule,
    ButtonModule,
    ToastModule,
    ToolbarModule,
    DialogModule,
    InputTextModule,
    Textarea,
    AutoCompleteModule,
    RadioButtonModule,
    FileUploadModule,
    ConfirmDialogModule,
    TagModule,
    AvatarModule,
    IconFieldModule,
    InputIconModule,
    TooltipModule,
    ThemeSwitcher,
    TabsModule,
  ],
  providers: [MessageService, ConfirmationService],
  templateUrl: './demandes.html',
  styleUrls: ['./demandes.css'],
})
export class Demandes implements OnInit {
  requests: Request[] = [];
  filteredRequests: Request[] = [];
  selectedRequest: DocumentRequestDTO = {} as DocumentRequestDTO;

  // Stats
  totalRequests = 0;
  pendingRequests = 0;
  approvedRequests = 0;
  rejectedRequests = 0;

  // Dialog states
  createDialog = false;
  detailsDialog = false;
  responseDialog = false;
  loading = false;
  creatingRequest = false;
  sendingResponse = false;

  // Filters
  searchTerm = '';
  statusFilter: any = '';
  priorityFilter: any = '';

  requestResponse: DocumentRequestDTO = {} as DocumentRequestDTO;
  // Forms
  newRequest: Partial<Request> = {};
  responseForm = {
    status: '',
    message: '',
    notes: '',
  };

  // File upload
  selectedFile: File | null = null;
  uploadUrl = '/api/upload';

  // Validation
  validationErrors: string[] = [];

  // AutoComplete Suggestions
  statusFilterSuggestions: any[] = [];
  priorityFilterSuggestions: any[] = [];
  documentTypeSuggestions: any[] = [];
  prioritySuggestions: any[] = [];
  departmentSuggestions: any[] = [];
  responseStatusSuggestions: any[] = [];

  // Options
  documentTypes = [
    { label: 'Certificat de travail', value: 'certificat_travail' },
    { label: 'Attestation de salaire', value: 'attestation_salaire' },
    { label: 'Congé payé', value: 'conge_paye' },
    { label: 'Bulletin de paie', value: 'bulletin_paie' },
    { label: 'Contrat de travail', value: 'contrat_travail' },
    { label: 'Formation professionnelle', value: 'formation' },
    { label: 'Autres', value: 'autres' },
  ];

  priorityOptions = [
    { label: 'Urgent', value: 'urgent' },
    { label: 'Haute', value: 'haute' },
    { label: 'Normale', value: 'normale' },
    { label: 'Basse', value: 'basse' },
  ];

  departments = [
    { id: '1', name: 'Ressources Humaines' },
    { id: '2', name: 'Informatique' },
    { id: '3', name: 'Finance' },
    { id: '4', name: 'Marketing' },
    { id: '5', name: 'Opérations' },
  ];

  statusFilterOptions = [
    { label: 'En attente', value: 'Pending' },
    { label: 'Approuvé', value: 'Approved' },
    { label: 'Rejeté', value: 'Rejected' },
    { label: 'En cours', value: 'In Progress' },
  ];

  priorityFilterOptions = [
    { label: 'Urgent', value: 'urgent' },
    { label: 'Haute', value: 'haute' },
    { label: 'Normale', value: 'normale' },
    { label: 'Basse', value: 'basse' },
  ];

  responseStatuses = [
    { label: 'Approuvé', value: 'Approved' },
    { label: 'Rejeté', value: 'Rejected' },
    { label: 'En cours', value: 'In Progress' },
    { label: 'Information nécessaire', value: 'More Info Required' },
  ];

  cancelCreate() {
    throw new Error('Method not implemented.');
  }
  isFormValid() {
    throw new Error('Method not implemented.');
  }
  removeSelectedFile() {
    this.selectedFile = null;
  }
  onFileSelect(event: any) {
    this.selectedFile = event.files[0];
  }
  formatFileSize(bytes: number): string {
    if (bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
  }

  cancelResponse() {
    this.responseDialog = false;
    this.resetResponseForm();
  }
  resetForm() {
    throw new Error('Method not implemented.');
  }

  documentRequests: DocumentRequestDTO[] = [];
  selectedRequests: DocumentRequestDTO[] = [];

  request: any = this.getEmptyRequest();

  requestDialog = false;
  requestDetailsDialog = false;
  processDialog = false;
  submitted = false;

  saving = false;
  processing = false;

  // Process variables
  processAction = '';
  processNote = '';
  responseDocument: File | null = null;

  // Pagination and filtering
  totalRecords = 0;
  filter: DocumentRequestFilterDTO = {
    pageNumber: 1,
    pageSize: 10,
    requesterId: null,
    departmentId: null,
    documentType: null,
    priority: null,
    status: null,
    requestedFrom: null,
    requestedTo: null,
    processedById: null,
    search: null,
    sortBy: null,
    sortDirection: null,
  };

  // Statistics
  totalPendingRequests = 0;
  totalProcessedRequests = 0;
  totalRejectedRequests = 0;

  // Options

  showCreateDialog() {
    this.requestDialog = true;
  }

  showDetailsDialog(request: Request) {}

  statusOptions = [
    { label: 'En Attente', value: 'En Attente' },
    { label: 'En Cours', value: 'En Cours' },
    { label: 'Approuvé', value: 'Approuvé' },
    { label: 'Rejeté', value: 'Rejeté' },
  ];

  private baseUrl = 'http://localhost:5108/api';
  globalFilterValue: any;

  documentReqStat: DocumentRequestStatsDto = {} as DocumentRequestStatsDto;
  constructor(
    public documentRequsetService: DocumentRequsetService,
    private messageService: MessageService,
    private confirmationService: ConfirmationService,
    private http: HttpClient,
    public documentService: DocumentService,
    private jwtService: JwtService
  ) {}

  ngOnInit() {
    this.loadDocumentRequests();
    this.getMyallDocReq();
    this.documentRequsetService.getMyDepartmentDocumentRequests();
    this.getStats();
  }


  getStats(){
    this.documentRequsetService.getMyDocumentRequestStats().subscribe(
      (result) => {
        console.log('Document request stats fetched:', result);
        this.documentReqStat = result;
       
      },
      (error) => {
        console.error('Error fetching document request stats:', error);
      }
    );
  }

  PageSize?: number = 5;
  Search?: string = '';
  PageNumber?: number = 1;
  SortBy?: string = '';
  SortDirection?: string = '';
  getAlldocReq() {
    this.documentRequsetService.getDocumentRequests(
      this.PageSize,
      this.Search,
      this.PageNumber,
      this.SortBy,
      this.SortDirection
    );
    //  .subscribe({
    //    next: (response: any) => {
    //      this.PageNumber = response.pageNumber;
    //      this.PageSize = response.pageSize;
    //      this.departments = response.data;
    //      this.totalRecords = response.totalRecords;
    //      this.totalDepartments = response.totalDepartments;
    //      this.totalUsers = response.totalUsers;
    //      this.avgUsersPerDepartment = Math.round(
    //        this.totalUsers / this.totalDepartments
    //      );
    //    },
    //  });
  }

  getMyallDocReq() {
    this.documentRequsetService.getMyDepartmentDocumentRequests(
      this.PageSize,
      this.Search,
      this.PageNumber,
      this.SortBy,
      this.SortDirection
    );
  }
  get dialogTitle(): string {
    return this.request.id ? 'Modifier la demande' : 'Nouvelle demande';
  }

  loadDocumentRequests() {
    this.loading = true;
    // Mock data for demonstration

    // Real API call would be:
    /*
    this.http.get<DocumentRequestPagedResult>(`${this.baseUrl}/DocumentRequest`, { params: this.filter as any }).subscribe({
      next: (response) => {
        this.documentRequests = response.data;
        this.totalRecords = response.totalCount;
        this.totalPendingRequests = response.totalPendingRequests;
        this.totalProcessedRequests = response.totalProcessedRequests;
        this.totalRejectedRequests = response.totalRejectedRequests;
        this.loading = false;
      },
      error: (error) => {
        console.error('Error loading document requests:', error);
        this.messageService.add({
          severity: 'error',
          summary: 'Erreur',
          detail: 'Erreur lors du chargement des demandes'
        });
        this.loading = false;
      }
    });
    */
  }

  onPageChange(event: any) {
    this.filter.pageNumber = event.page + 1;
    this.filter.pageSize = event.rows;

    this.PageNumber = event.first / event.rows + 1;
    this.PageSize = event.rows;

    this.getAlldocReq();
    this.loadDocumentRequests();
  }

  onGlobalFilter(event: any) {
    this.filter.search = event.target.value;
    this.filter.pageNumber = 1;
    this.loadDocumentRequests();
  }

  onStatusFilter(event: any) {
    this.filter.status = event.value;
    this.filter.pageNumber = 1;
    this.loadDocumentRequests();
  }

  onPriorityFilter(event: any) {
    this.filter.priority = event.value;
    this.filter.pageNumber = 1;
    this.loadDocumentRequests();
  }

  openNew() {
    this.request = this.getEmptyRequest();
    this.submitted = false;
    this.requestDialog = true;
  }

  editRequest(request: DocumentRequestDTO) {
    this.request = { ...request };
    this.requestDialog = true;
  }

  viewRequest(request: DocumentRequestDTO) {
    this.selectedRequest = request;
    this.requestDetailsDialog = true;
  }

  processRequest(request: DocumentRequestDTO) {
    this.selectedRequest = request;
    this.processAction = '';
    this.processNote = '';
    this.responseDocument = null;
    this.processDialog = true;
  }

  deleteRequest(request: DocumentRequestDTO) {
    this.confirmationService.confirm({
      message: `Êtes-vous sûr de vouloir supprimer la demande #${request.id}?`,
      header: 'Confirmer la suppression',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        //this.performDeleteRequest(request.id);
        this.documentRequsetService.deleteDocumentRequest(request.id).subscribe({
          next: () => {
            this.messageService.add({
              severity: 'success',
              summary: 'Succès',
              detail: 'Demande supprimée avec succès',
            });
            this.documentRequsetService.getDocumentRequests();
          },
          error: (error) => {
            this.messageService.add({
              severity: 'error',
              summary: 'Erreur',
              detail: 'Une erreur est survenue lors de la suppression de la demande',
            });
          },
        });
      },
    });
  }

  deleteSelectedRequests() {
    this.confirmationService.confirm({
      message: `Êtes-vous sûr de vouloir supprimer ${this.selectedRequests.length} demande(s)?`,
      header: 'Confirmer la suppression',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.performBulkDelete();
      },
    });
  }

  /*private performDeleteRequest(requestId: number) {
    setTimeout(() => {
      this.documentRequests = this.documentRequests.filter(
        (r) => r.id !== requestId
      );
      this.totalRecords--;
      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Demande supprimée avec succès',
      });
    }, 500);
  }*/

  private performBulkDelete() {
    const requestIds = this.selectedRequests.map((r) => r.id);
    setTimeout(() => {
      this.documentRequests = this.documentRequests.filter(
        (r) => !requestIds.includes(r.id)
      );
      this.selectedRequests = [];
      this.totalRecords -= requestIds.length;
      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Demandes supprimées avec succès',
      });
    }, 500);
  }

  saveRequest() {
    this.submitted = true;

    console.log(this.request);
    if (!this.isRequestValid()) {
      this.messageService.add({
        severity: 'warn',
        summary: 'Validation',
        detail: 'Veuillez remplir tous les champs requis',
      });
      return;
    }

    this.documentRequsetService.createDocumentRequest(this.request).subscribe({
      next: (response) => {
        this.messageService.add({
          severity: 'success',
          summary: 'Succès',
          detail: 'Demande créée avec succès',
        });
      },
      error: (error) => {
        this.messageService.add({
          severity: 'error',
          summary: 'Erreur',
          detail: 'Une erreur est survenue lors de la création de la demande',
        });
      },
    });
    this.saving = true;
    console.log(this.request);
    if (this.request.id) {
      this.updateRequest();
    } else {
      this.createRequest();
    }
  }

  createRequest() {
    const createDto: CreateDocumentRequestDTO = {
      requesterId: 'current-user-id', // Get from auth service
      departmentId: this.request.departmentId,
      documentType: this.request.documentType,
      description: this.request.description,
      priority: this.request.priority,
    };

    // setTimeout(() => {
    //   const newRequest: DocumentRequestDTO = {
    //     id: Math.max(...this.documentRequests.map((r) => r.id)) + 1,
    //     requesterId: createDto.requesterId,
    //     requesterName: 'Utilisateur Actuel',
    //     departmentId: createDto.departmentId,
    //     departmentName:
    //       this.departments.find((d) => d.id === createDto.departmentId)?.name ||
    //       '',
    //     documentType: createDto.documentType,
    //     description: createDto.description,
    //     priority: createDto.priority,
    //     status: 'En Attente',
    //     responseDocumentId: null,
    //     responseDocumentName: null,
    //     requestedAt: new Date().toISOString(),
    //     respondedAt: null,
    //     processedById: null,
    //     processedByName: null,
    //     createdAt: new Date().toISOString(),
    //     updatedAt: null,
    //     isActive: true,
    //   };

    //   this.documentRequests.unshift(newRequest);
    //   this.totalRecords++;
    //   this.totalPendingRequests++;

    //   this.messageService.add({
    //     severity: 'success',
    //     summary: 'Succès',
    //     detail: 'Demande créée avec succès',
    //   });
    //   this.hideDialog();
    // }, 1500);
  }

  createNewRequest() {
    this.requestDialog = true;
  }
  private updateRequest() {
    const updateDto: UpdateDocumentRequestDTO = {
      documentType: this.request.documentType,
      description: this.request.description,
      priority: this.request.priority,
      status: this.request.status,
      responseMessage: this.request.responseMessage,
      responseDocumentId: this.request.responseDocumentId,
      processedById: this.request.processedById,
    };

    setTimeout(() => {
      const index = this.documentRequests.findIndex(
        (r) => r.id === this.request.id
      );
      if (index !== -1) {
        this.documentRequests[index] = {
          ...this.documentRequests[index],
          ...updateDto,
          documentType: updateDto.documentType ?? '',
          description: updateDto.description ?? '',
          priority: updateDto.priority ?? '',
          status: updateDto.status ?? '',
          updatedAt: new Date().toISOString(),
        };
      }

      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Demande modifiée avec succès',
      });
      this.hideDialog();
    }, 1500);
  }

  confirmProcess() {
    if (!this.processAction) {
      this.messageService.add({
        severity: 'warn',
        summary: 'Validation',
        detail: 'Veuillez sélectionner une action',
      });
      return;
    }

    this.processing = true;

    setTimeout(() => {
      if (this.selectedRequest) {
        const index = this.documentRequests.findIndex(
          (r) => r.id === this.selectedRequest!.id
        );
        if (index !== -1) {
          this.documentRequests[index] = {
            ...this.documentRequests[index],
            status: this.processAction,
            respondedAt: new Date().toISOString(),
            processedById: 'current-admin-id',
            processedByName: 'Admin Actuel',
            responseDocumentId: this.responseDocument ? 999 : null,
            responseDocumentName: this.responseDocument?.name || null,
            updatedAt: new Date().toISOString(),
          };
        }

        // Update statistics
        this.updateStatistics();
      }

      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Demande traitée avec succès',
      });

      this.processing = false;
      this.processDialog = false;
    }, 1500);
  }

  private updateStatistics() {
    this.totalPendingRequests = this.documentRequests.filter(
      (r) => r.status === 'En Attente'
    ).length;
    this.totalProcessedRequests = this.documentRequests.filter(
      (r) => r.status === 'Approuvé'
    ).length;
    this.totalRejectedRequests = this.documentRequests.filter(
      (r) => r.status === 'Rejeté'
    ).length;
  }

  hideDialog() {
    this.requestDialog = false;
    this.submitted = false;
    this.saving = false;
    this.request = this.getEmptyRequest();
  }

  onResponseDocumentSelect(event: any) {
    this.responseDocument = event.files[0];
  }

  downloadResponseDocument(request: DocumentRequestDTO) {
    this.messageService.add({
      severity: 'info',
      summary: 'Téléchargement',
      detail: `Téléchargement de "${request.responseDocumentName}" en cours...`,
    });

    // Simulate download
    window.open(
      `http://localhost:5108/api/uploads/${request.responseDocumentName}`
    );
  }

  exportRequests() {
    this.messageService.add({
      severity: 'info',
      summary: 'Export',
      detail: 'Export des demandes en cours...',
    });
  }

  // Utility methods
  getEmptyRequest(): any {
    return {
      requesterId: '',
      requesterName: '',
      departmentId: null,
      documentType: '',
      description: '',
      priority: 'Normale',
      status: 'En Attente',
    };
  }

  isRequestValid(): boolean {
    return !!(
      this.request.documentType?.trim() &&
      this.request.description?.trim() &&
      this.request.priority
    );
  }

  getInitials(name: string): string {
    return name
      .split(' ')
      .map((word) => word.charAt(0))
      .join('')
      .toUpperCase()
      .slice(0, 2);
  }

  getDocumentTypeIcon(type: string): string {
    const iconMap: { [key: string]: string } = {
      'Certificat de Travail': 'pi pi-file-pdf text-red-500',
      'Attestation de Salaire': 'pi pi-file-word text-blue-500',
      'Contrat de Travail': 'pi pi-file text-gray-600',
      'Relevé de Notes': 'pi pi-file-excel text-green-500',
      'Certificat Médical': 'pi pi-heart text-pink-500',
      'Justificatif de Domicile': 'pi pi-home text-purple-500',
      "Pièce d'Identité": 'pi pi-id-card text-orange-500',
    };
    return iconMap[type] || 'pi pi-file text-gray-500';
  }

  getPrioritySeverity(priority: string): string {
    switch (priority) {
      case 'Urgente':
        return 'danger';
      case 'Élevée':
        return 'warning';
      case 'Normale':
        return 'info';
      case 'Faible':
        return 'secondary';
      default:
        return 'info';
    }
  }

  getStatusSeverity(status: string): string {
    switch (status) {
      case 'Approuvé':
        return 'success';
      case 'Rejeté':
        return 'danger';
      case 'En Cours':
        return 'warning';
      case 'En Attente':
        return 'info';
      default:
        return 'info';
    }
  }

  selectedStatus: any = null;
  selectedPriority: any = null;
  selectedDepartment: any = null;
  selectedRequestPriority: any = null;
  selectedRequestStatus: any = null;

  // Filtered options for autocomplete
  filteredStatusOptions: any[] = [];
  filteredPriorityOptions: any[] = [];
  filteredDepartments: any[] = [];
  filteredDocumentTypes: any[] = [];
  filteredRequestPriorityOptions: any[] = [];
  filteredRequestStatusOptions: any[] = [];

  // ...existing methods...

  // AutoComplete search methods
  searchStatus(event: any) {
    const query = event.query.toLowerCase();
    this.filteredStatusOptions = this.statusOptions.filter((option) =>
      option.label.toLowerCase().includes(query)
    );
  }

  searchPriority(event: any) {
    const query = event.query.toLowerCase();
    this.filteredPriorityOptions = this.priorityOptions.filter((option) =>
      option.label.toLowerCase().includes(query)
    );
  }

  searchDepartment(event: any) {
    const query = event.query.toLowerCase();
    this.filteredDepartments = this.departments.filter((dept) =>
      dept.name.toLowerCase().includes(query)
    );
  }

  searchDocumentType(event: any) {
    const query = event.query.toLowerCase();
     this.filteredDocumentTypes = this.documentTypes.filter((type) =>
       type.label.toLowerCase().includes(query)
     );
  }

  searchRequestPriority(event: any) {
    const query = event.query.toLowerCase();
    this.filteredRequestPriorityOptions = this.priorityOptions.filter(
      (option) => option.label.toLowerCase().includes(query)
    );
  }

  searchRequestStatus(event: any) {
    const query = event.query.toLowerCase();
    this.filteredRequestStatusOptions = this.statusOptions.filter((option) =>
      option.label.toLowerCase().includes(query)
    );
  }

  // Selection event handlers
  onStatusSelect(event: any) {
    this.filter.status = event.value;
    this.filter.pageNumber = 1;
    this.loadDocumentRequests();
  }

  onStatusClear() {
    this.selectedStatus = null;
    this.filter.status = null;
    this.filter.pageNumber = 1;
    this.loadDocumentRequests();
  }

  onPrioritySelect(event: any) {
    this.filter.priority = event.value;
    this.filter.pageNumber = 1;
    this.loadDocumentRequests();
  }

  onPriorityClear() {
    this.selectedPriority = null;
    this.filter.priority = null;
    this.filter.pageNumber = 1;
    this.loadDocumentRequests();
  }

  onDepartmentSelect(event: any) {
    this.request.departmentId = event.id;
  }

  onDocumentTypeSelect(event: any) {
    console.log(event);
    this.request.documentType = event.value;
  }

  onRequestPrioritySelect(event: any) {
    console.log(event.value.value);
    this.request.priority = event.value.value;
  }

  onRequestStatusSelect(event: any) {
    this.request.status = event.value;
  }

  updateStats() {
    this.totalRequests = this.requests.length;
    this.pendingRequests = this.requests.filter(
      (r: any) => r.status === 'Pending'
    ).length;
    this.approvedRequests = this.requests.filter(
      (r: any) => r.status === 'Approved'
    ).length;
    this.rejectedRequests = this.requests.filter(
      (r: any) => r.status === 'Rejected'
    ).length;
  }

  // AutoComplete search methods
  searchStatusFilter(event: any) {
    const query = event.query.toLowerCase();
    this.statusFilterSuggestions = this.statusFilterOptions.filter((option) =>
      option.label.toLowerCase().includes(query)
    );
  }

  quickApprove() {
    this.selectedRequest.status = 'Approved';
    this.selectedRequest.responseMessage =
      'Votre demande a été approuvée. Le document sera traité dans les plus brefs délais.';
  }

  quickReject() {
    this.selectedRequest.status = 'Rejected';
    this.selectedRequest.responseMessage =
      "Votre demande a été rejetée. Veuillez nous contacter pour plus d'informations.";
  }

  requestMoreInfo() {
    this.selectedRequest.status = 'More Info Required';
    this.selectedRequest.responseMessage =
      'Des informations supplémentaires sont nécessaires pour traiter votre demande. Veuillez nous fournir plus de détails.';
  }
  searchPriorityFilter(event: any) {
    const query = event.query.toLowerCase();
    this.priorityFilterSuggestions = this.priorityFilterOptions.filter(
      (option) => option.label.toLowerCase().includes(query)
    );
  }

  searchResponseStatus(event: any) {
    const query = event.query.toLowerCase();
    this.responseStatusSuggestions = this.responseStatuses.filter((status) =>
      status.label.toLowerCase().includes(query)
    );
  }

  // Filter methods
  onSearch(event: any) {
    this.applyFilters();
  }

  // CRUD operations

  respondToRequest(request: DocumentRequestDTO) {
    this.selectedRequest = request;
    this.responseDialog = true;
    this.resetResponseForm();
  }

  resetResponseForm() {
    this.responseForm = {
      status: '',
      message: '',
      notes: '',
    };
    this.selectedFile = null;
  }

  sendResponse() {
    // if (!this.isResponseValid()) {
    //   return;
    // }

    this.sendingResponse = true;
    console.log('Sending response:', this.responseForm);
    console.log('request response:', this.requestResponse);
    console.log('selected request:', this.selectedRequest);
    console.log('selected file:', this.selectedFile);
    console.log('response message:', this.selectedRequest.responseMessage);

    const formData = new FormData();
    formData.append('File', this.selectedFile ? this.selectedFile : '');
    formData.append('Name', this.selectedFile ? this.selectedFile.name : '');
    formData.append('FolderId', '10');

    // Example folderId
    if(this.selectedFile){
      this.documentService.uploadDocument(formData).subscribe({
      next: (response: DocumentDto) => {
        console.log('File uploaded successfully:', response);
        this.selectedRequest.responseDocumentId = response.id;
        console.log('responseDocumentId:', response.id);
        console.log('id:', this.selectedRequest.id);
        this.documentRequsetService
          .updateDocumentRequest(this.selectedRequest, this.selectedRequest.id)
          .subscribe({
            next: (response) => {
              console.log('Document request updated successfully:', response);
              this.messageService.add({
                severity: 'success',
                summary: 'Réponse envoyée',
                detail: 'La réponse a été envoyée avec succès',
              });
              this.responseDialog = false;
              this.sendingResponse = false;
            },
            error: (error) => {
              console.error('Error updating document request:', error);
            },
          });
      },
      error: (error) => {
        console.error('Error uploading file:', error);
      },
    });
    }else{
      this.documentRequsetService
        .updateDocumentRequest(this.selectedRequest, this.selectedRequest.id)
        .subscribe({
          next: (response) => {
            console.log('Document request updated successfully:', response);
            this.messageService.add({
              severity: 'success',
              summary: 'Réponse envoyée',
              detail: 'La réponse a été envoyée avec succès',
            });
            this.responseDialog = false;
            this.sendingResponse = false;
          },
          error: (error) => {
            console.error('Error updating document request:', error);
          },
        });
    }
    
  }

  applyFilters() {
    this.filteredRequests = this.requests.filter((request) => {
      const matchesSearch =
        !this.searchTerm ||
        request.requesterName
          .toLowerCase()
          .includes(this.searchTerm.toLowerCase()) ||
        request.documentType
          .toLowerCase()
          .includes(this.searchTerm.toLowerCase()) ||
        request.description
          .toLowerCase()
          .includes(this.searchTerm.toLowerCase());

      const statusValue = this.getSelectedValue(this.statusFilter);
      const priorityValue = this.getSelectedValue(this.priorityFilter);

      const matchesStatus = !statusValue || request.status === statusValue;
      const matchesPriority =
        !priorityValue || request.priority === priorityValue;

      return matchesSearch && matchesStatus && matchesPriority;
    });
  }
  getSelectedValue(value: any): string {
    if (!value) return '';
    if (typeof value === 'string') return value;
    if (typeof value === 'object' && value.value) return value.value;
    if (typeof value === 'object' && value.id) return value.id;
    return value.toString();
  }

  onResponseMessageChange() {
    console.log(this.selectedRequest.responseMessage);
  }
  sendRespnse() {
    if (!this.selectedRequest) {
      console.error('No request selected!');
      return;
    }

    this.sendingResponse = true;
    console.log('Sending response:', this.responseForm);
    console.log('Selected request:', this.selectedRequest);
    console.log('Selected file:', this.selectedFile);

    let upload$;

    if (this.selectedFile) {
      const formData = new FormData();
      formData.append('File', this.selectedFile);
      formData.append('Name', this.selectedFile.name);
      formData.append('FolderId', '10'); // example folderId

      upload$ = this.documentService.uploadDocument(formData);
    }

    if (upload$) {
      upload$.subscribe({
        next: (uploadResponse: any) => {
          console.log('Upload response:', uploadResponse);

          // Update selectedRequest fields
          this.selectedRequest.status = this.getSelectedValue(
            this.responseForm.status
          );
          // this.selectedRequest.createdAt = new Date();
          this.selectedRequest.processedByName = 'Admin Courant';

          if (this.selectedFile) {
            this.selectedRequest.responseDocumentName = this.selectedFile.name;
          }

          this.documentRequsetService
            .updateDocumentRequest(
              this.selectedRequest,
              this.selectedRequest.id
            )
            .subscribe({
              next: (response) => {
                console.log('Document request updated successfully:', response);
                this.messageService.add({
                  severity: 'success',
                  summary: 'Réponse envoyée',
                  detail: 'La réponse a été envoyée avec succès',
                });
                this.responseDialog = false;
                this.sendingResponse = false;
              },
              error: (err) => {
                console.error('Error updating document request:', err);
              },
              complete: () => {
                this.sendingResponse = false;
                this.applyFilters();
                this.updateStats();
              },
            });
        },
        error: (err: any) => {
          console.error('Error uploading file:', err);
          this.sendingResponse = false;
        },
      });
    } else {
      // No file to upload, just update the request
      this.selectedRequest.status = this.getSelectedValue(
        this.responseForm.status
      );
      this.selectedRequest.processedByName = 'Admin Courant';

      this.documentRequsetService
        .updateDocumentRequest(this.selectedRequest, this.selectedRequest.id)
        .subscribe({
          next: (response) => {
            console.log('Document request updated successfully:', response);
            this.messageService.add({
              severity: 'success',
              summary: 'Réponse envoyée',
              detail: 'La réponse a été envoyée avec succès',
            });
            this.responseDialog = false;
          },
          error: (err) => {
            console.error('Error updating document request:', err);
          },
          complete: () => {
            this.sendingResponse = false;
            this.applyFilters();
            this.updateStats();
          },
        });
    }
  }
}
