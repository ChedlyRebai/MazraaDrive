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
import { 
  DocumentRequestDTO, 
  CreateDocumentRequestDTO, 
  UpdateDocumentRequestDTO, 
  DocumentRequestFilterDTO, 
  DocumentRequestPagedResult 
} from '../../shared/models/docrequest'
import { ThemeSwitcher } from '../themeswitcher';
import { Textarea } from 'primeng/textarea';
import { AutoComplete, AutoCompleteModule } from 'primeng/autocomplete';

interface Department {
  id: number;
  name: string;
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
    ThemeSwitcher
  ],
  providers: [MessageService, ConfirmationService],
  templateUrl: './doc-req-management.html',
  styleUrls: ['./doc-req-management.css']
})
export class DocReqManagement implements OnInit {

  documentRequests: DocumentRequestDTO[] = [];
  selectedRequests: DocumentRequestDTO[] = [];
  selectedRequest: DocumentRequestDTO | null = null;
  request: any = this.getEmptyRequest();
  
  requestDialog = false;
  requestDetailsDialog = false;
  processDialog = false;
  submitted = false;
  loading = false;
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
    sortDirection: null
  };

  // Statistics
  totalPendingRequests = 0;
  totalProcessedRequests = 0;
  totalRejectedRequests = 0;

  // Options
  departments: Department[] = [
    { id: 1, name: 'Ressources Humaines' },
    { id: 2, name: 'Finance' },
    { id: 3, name: 'IT' },
    { id: 4, name: 'Marketing' },
    { id: 5, name: 'Opérations' },
    { id: 6, name: 'Administration' }
  ];

  documentTypes = [
    'Certificat de Travail',
    'Attestation de Salaire',
    'Contrat de Travail',
    'Relevé de Notes',
    'Certificat Médical',
    'Justificatif de Domicile',
    'Pièce d\'Identité',
    'Autre'
  ];

  priorityOptions = [
    { label: 'Faible', value: 'Faible' },
    { label: 'Normale', value: 'Normale' },
    { label: 'Élevée', value: 'Élevée' },
    { label: 'Urgente', value: 'Urgente' }
  ];

  statusOptions = [
    { label: 'En Attente', value: 'En Attente' },
    { label: 'En Cours', value: 'En Cours' },
    { label: 'Approuvé', value: 'Approuvé' },
    { label: 'Rejeté', value: 'Rejeté' }
  ];

  private baseUrl = 'http://localhost:5108/api';
globalFilterValue: any;

  constructor(
    private messageService: MessageService,
    private confirmationService: ConfirmationService,
    private http: HttpClient
  ) {}

  ngOnInit() {
    this.loadDocumentRequests();
  }

  get dialogTitle(): string {
    return this.request.id ? 'Modifier la demande' : 'Nouvelle demande';
  }

  loadDocumentRequests() {
    this.loading = true;
    
    // Mock data for demonstration
    setTimeout(() => {
      const mockResponse: DocumentRequestPagedResult = {
        data: [
          {
            id: 1,
            requesterId: 'user1',
            requesterName: 'Jean Dupont',
            departmentId: 1,
            departmentName: 'Ressources Humaines',
            documentType: 'Certificat de Travail',
            description: 'Demande de certificat de travail pour candidature externe',
            priority: 'Normale',
            status: 'En Attente',
            responseDocumentId: null,
            responseDocumentName: null,
            requestedAt: '2024-12-06T09:30:00',
            respondedAt: null,
            processedById: null,
            processedByName: null,
            createdAt: '2024-12-06T09:30:00',
            updatedAt: null,
            isActive: true
          },
          {
            id: 2,
            requesterId: 'user2',
            requesterName: 'Marie Martin',
            departmentId: 2,
            departmentName: 'Finance',
            documentType: 'Attestation de Salaire',
            description: 'Attestation de salaire pour demande de prêt bancaire',
            priority: 'Élevée',
            status: 'Approuvé',
            responseDocumentId: 101,
            responseDocumentName: 'attestation_salaire_marie_martin.pdf',
            requestedAt: '2024-12-05T14:15:00',
            respondedAt: '2024-12-05T16:30:00',
            processedById: 'admin1',
            processedByName: 'Admin RH',
            createdAt: '2024-12-05T14:15:00',
            updatedAt: '2024-12-05T16:30:00',
            isActive: true
          },
          {
            id: 3,
            requesterId: 'user3',
            requesterName: 'Pierre Bernard',
            departmentId: 3,
            departmentName: 'IT',
            documentType: 'Contrat de Travail',
            description: 'Copie du contrat de travail pour dossier personnel',
            priority: 'Faible',
            status: 'En Cours',
            responseDocumentId: null,
            responseDocumentName: null,
            requestedAt: '2024-12-04T11:00:00',
            respondedAt: null,
            processedById: 'admin1',
            processedByName: 'Admin RH',
            createdAt: '2024-12-04T11:00:00',
            updatedAt: '2024-12-06T08:00:00',
            isActive: true
          },
          {
            id: 4,
            requesterId: 'user4',
            requesterName: 'Sophie Dubois',
            departmentId: 4,
            departmentName: 'Marketing',
            documentType: 'Justificatif de Domicile',
            description: 'Justificatif de domicile pour mise à jour du dossier',
            priority: 'Urgente',
            status: 'Rejeté',
            responseDocumentId: null,
            responseDocumentName: null,
            requestedAt: '2024-12-03T16:45:00',
            respondedAt: '2024-12-04T09:15:00',
            processedById: 'admin2',
            processedByName: 'Admin Finance',
            createdAt: '2024-12-03T16:45:00',
            updatedAt: '2024-12-04T09:15:00',
            isActive: true
          }
        ],
        pageNumber: 1,
        pageSize: 10,
        totalRecords: 4,
        totalPages: 1,
        hasNextPage: false,
        hasPreviousPage: false,
        totalPendingRequests: 1,
        totalProcessedRequests: 2,
        totalRejectedRequests: 1,
        search: null,
        sortBy: null,
        sortDirection: null
      };

      this.documentRequests = mockResponse.data;
      this.totalRecords = mockResponse.totalRecords;
      this.totalPendingRequests = mockResponse.totalPendingRequests;
      this.totalProcessedRequests = mockResponse.totalProcessedRequests;
      this.totalRejectedRequests = mockResponse.totalRejectedRequests;
      this.loading = false;
    }, 1000);

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
        this.performDeleteRequest(request.id);
      }
    });
  }

  deleteSelectedRequests() {
    this.confirmationService.confirm({
      message: `Êtes-vous sûr de vouloir supprimer ${this.selectedRequests.length} demande(s)?`,
      header: 'Confirmer la suppression',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.performBulkDelete();
      }
    });
  }

  private performDeleteRequest(requestId: number) {
    setTimeout(() => {
      this.documentRequests = this.documentRequests.filter(r => r.id !== requestId);
      this.totalRecords--;
      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Demande supprimée avec succès'
      });
    }, 500);
  }

  private performBulkDelete() {
    const requestIds = this.selectedRequests.map(r => r.id);
    setTimeout(() => {
      this.documentRequests = this.documentRequests.filter(r => !requestIds.includes(r.id));
      this.selectedRequests = [];
      this.totalRecords -= requestIds.length;
      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Demandes supprimées avec succès'
      });
    }, 500);
  }

  saveRequest() {
    this.submitted = true;

    if (!this.isRequestValid()) {
      this.messageService.add({
        severity: 'warn',
        summary: 'Validation',
        detail: 'Veuillez remplir tous les champs requis'
      });
      return;
    }

    this.saving = true;

    if (this.request.id) {
      this.updateRequest();
    } else {
      this.createRequest();
    }
  }

  private createRequest() {
    const createDto: CreateDocumentRequestDTO = {
      requesterId: 'current-user-id', // Get from auth service
      departmentId: this.request.departmentId,
      documentType: this.request.documentType,
      description: this.request.description,
      priority: this.request.priority
    };

    setTimeout(() => {
      const newRequest: DocumentRequestDTO = {
        id: Math.max(...this.documentRequests.map(r => r.id)) + 1,
        requesterId: createDto.requesterId,
        requesterName: 'Utilisateur Actuel',
        departmentId: createDto.departmentId,
        departmentName: this.departments.find(d => d.id === createDto.departmentId)?.name || '',
        documentType: createDto.documentType,
        description: createDto.description,
        priority: createDto.priority,
        status: 'En Attente',
        responseDocumentId: null,
        responseDocumentName: null,
        requestedAt: new Date().toISOString(),
        respondedAt: null,
        processedById: null,
        processedByName: null,
        createdAt: new Date().toISOString(),
        updatedAt: null,
        isActive: true
      };

      this.documentRequests.unshift(newRequest);
      this.totalRecords++;
      this.totalPendingRequests++;

      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Demande créée avec succès'
      });
      this.hideDialog();
    }, 1500);
  }

  private updateRequest() {
    const updateDto: UpdateDocumentRequestDTO = {
      documentType: this.request.documentType,
      description: this.request.description,
      priority: this.request.priority,
      status: this.request.status,
      responseDocumentId: this.request.responseDocumentId,
      processedById: this.request.processedById
    };

    setTimeout(() => {
      const index = this.documentRequests.findIndex(r => r.id === this.request.id);
      if (index !== -1) {
        this.documentRequests[index] = { 
          ...this.documentRequests[index], 
          ...updateDto,
          documentType: updateDto.documentType ?? '',
          description: updateDto.description ?? '',
          priority: updateDto.priority ?? '',
          status: updateDto.status ?? '',
          updatedAt: new Date().toISOString()
        };
      }

      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Demande modifiée avec succès'
      });
      this.hideDialog();
    }, 1500);
  }

  confirmProcess() {
    if (!this.processAction) {
      this.messageService.add({
        severity: 'warn',
        summary: 'Validation',
        detail: 'Veuillez sélectionner une action'
      });
      return;
    }

    this.processing = true;

    setTimeout(() => {
      if (this.selectedRequest) {
        const index = this.documentRequests.findIndex(r => r.id === this.selectedRequest!.id);
        if (index !== -1) {
          this.documentRequests[index] = {
            ...this.documentRequests[index],
            status: this.processAction,
            respondedAt: new Date().toISOString(),
            processedById: 'current-admin-id',
            processedByName: 'Admin Actuel',
            responseDocumentId: this.responseDocument ? 999 : null,
            responseDocumentName: this.responseDocument?.name || null,
            updatedAt: new Date().toISOString()
          };
        }

        // Update statistics
        this.updateStatistics();
      }

      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Demande traitée avec succès'
      });

      this.processing = false;
      this.processDialog = false;
    }, 1500);
  }

  private updateStatistics() {
    this.totalPendingRequests = this.documentRequests.filter(r => r.status === 'En Attente').length;
    this.totalProcessedRequests = this.documentRequests.filter(r => r.status === 'Approuvé').length;
    this.totalRejectedRequests = this.documentRequests.filter(r => r.status === 'Rejeté').length;
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
      detail: `Téléchargement de "${request.responseDocumentName}" en cours...`
    });
  }

  exportRequests() {
    this.messageService.add({
      severity: 'info',
      summary: 'Export',
      detail: 'Export des demandes en cours...'
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
      status: 'En Attente'
    };
  }

  isRequestValid(): boolean {
    return !!(
      this.request.departmentId &&
      this.request.documentType?.trim() &&
      this.request.description?.trim() &&
      this.request.priority
    );
  }

  getInitials(name: string): string {
    return name
      .split(' ')
      .map(word => word.charAt(0))
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
      'Pièce d\'Identité': 'pi pi-id-card text-orange-500'
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
  filteredDocumentTypes: string[] = [];
  filteredRequestPriorityOptions: any[] = [];
  filteredRequestStatusOptions: any[] = [];

  // ...existing methods...

  // AutoComplete search methods
  searchStatus(event: any) {
    const query = event.query.toLowerCase();
    this.filteredStatusOptions = this.statusOptions.filter(option => 
      option.label.toLowerCase().includes(query)
    );
  }

  searchPriority(event: any) {
    const query = event.query.toLowerCase();
    this.filteredPriorityOptions = this.priorityOptions.filter(option => 
      option.label.toLowerCase().includes(query)
    );
  }

  searchDepartment(event: any) {
    const query = event.query.toLowerCase();
    this.filteredDepartments = this.departments.filter(dept => 
      dept.name.toLowerCase().includes(query)
    );
  }

  searchDocumentType(event: any) {
    const query = event.query.toLowerCase();
    this.filteredDocumentTypes = this.documentTypes.filter(type => 
      type.toLowerCase().includes(query)
    );
  }

  searchRequestPriority(event: any) {
    const query = event.query.toLowerCase();
    this.filteredRequestPriorityOptions = this.priorityOptions.filter(option => 
      option.label.toLowerCase().includes(query)
    );
  }

  searchRequestStatus(event: any) {
    const query = event.query.toLowerCase();
    this.filteredRequestStatusOptions = this.statusOptions.filter(option => 
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
    this.request.documentType = event;
  }

  onRequestPrioritySelect(event: any) {
    this.request.priority = event.value;
  }

  onRequestStatusSelect(event: any) {
    this.request.status = event.value;
  }

}