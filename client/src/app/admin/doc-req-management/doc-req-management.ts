import { DocumentService } from './../../core/services/document-service';
import { DocumentRequsetService } from './../../core/services/document-requset-service';
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MessageService, ConfirmationService } from 'primeng/api';
import { TextareaModule } from 'primeng/textarea';
// PrimeNG Imports
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { DialogModule } from 'primeng/dialog';
import { InputTextModule } from 'primeng/inputtext';
import { AutoCompleteModule } from 'primeng/autocomplete';
import { TagModule } from 'primeng/tag';
import { ToastModule } from 'primeng/toast';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { AvatarModule } from 'primeng/avatar';
import { FileUploadModule } from 'primeng/fileupload';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { TooltipModule } from 'primeng/tooltip';
import { ThemeSwitcher } from '../themeswitcher';
import { HttpClient } from '@angular/common/http';
import { DocumentRequestDTO } from '../../shared/models/docrequest';

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
  selector: 'app-demandes',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    TableModule,
    ButtonModule,
    DialogModule,
    InputTextModule,
    AutoCompleteModule,
    TagModule,
    ToastModule,
    ConfirmDialogModule,
    AvatarModule,
    FileUploadModule,
    IconFieldModule,
    InputIconModule,
    TooltipModule,

    ThemeSwitcher,
  ],
  providers: [MessageService, ConfirmationService],
  templateUrl: './doc-req-management.html',
  styleUrls: ['./doc-req-management.css'],
})
export class DocReqManagement implements OnInit {
  // Data
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

  constructor(
    public http: HttpClient,
    public documentService: DocumentService,
    public documentRequsetService: DocumentRequsetService,
    private messageService: MessageService,
    private confirmationService: ConfirmationService
  ) {}

  ngOnInit() {
    this.loadRequests();
    this.documentRequsetService.getDocumentRequests();
  }

  loadRequests() {
    this.loading = true;

    // Mock data
    setTimeout(() => {
      this.requests = [
        {
          id: '1',
          requesterName: 'Chedly Rebai',
          requesterEmail: 'jean.dupont@company.com',
          departmentName: 'Informatique',
          departmentId: '2',
          documentType: 'Certificat de travail',
          priority: 'haute',
          status: 'Pending',
          description:
            "J'ai besoin d'un certificat de travail pour ma demande de prêt bancaire.",
          requestedAt: new Date('2024-12-06T10:30:00'),
          createdAt: new Date('2024-12-06T10:30:00'),
        },
        {
          id: '2',
          requesterName: 'Marie Martin',
          requesterEmail: 'marie.martin@company.com',
          departmentName: 'Ressources Humaines',
          departmentId: '1',
          documentType: 'Bulletin de paie',
          priority: 'normale',
          status: 'Approved',
          description: 'Demande des bulletins de paie des 3 derniers mois.',
          requestedAt: new Date('2024-12-05T14:22:00'),
          createdAt: new Date('2024-12-05T14:22:00'),
          respondedAt: new Date('2024-12-05T16:30:00'),
          processedByName: 'Sophie Admin',
        },
      ];

      this.filteredRequests = [...this.requests];
      this.updateStats();
      this.loading = false;
    }, 1000);
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

  onPageChange(event: any) {
    // this.first = event.first;
    this.PageNumber = event.first / event.rows + 1;
    this.PageSize = event.rows;
    this.getAlldocReq();
  }

  updateStats() {
    this.totalRequests = this.requests.length;
    this.pendingRequests = this.requests.filter(
      (r) => r.status === 'Pending'
    ).length;
    this.approvedRequests = this.requests.filter(
      (r) => r.status === 'Approved'
    ).length;
    this.rejectedRequests = this.requests.filter(
      (r) => r.status === 'Rejected'
    ).length;
  }

  // AutoComplete search methods
  searchStatusFilter(event: any) {
    const query = event.query.toLowerCase();
    this.statusFilterSuggestions = this.statusFilterOptions.filter((option) =>
      option.label.toLowerCase().includes(query)
    );
  }

  searchPriorityFilter(event: any) {
    const query = event.query.toLowerCase();
    this.priorityFilterSuggestions = this.priorityFilterOptions.filter(
      (option) => option.label.toLowerCase().includes(query)
    );
  }

  searchDocumentType(event: any) {
    const query = event.query.toLowerCase();
    this.documentTypeSuggestions = this.documentTypes.filter((type) =>
      type.label.toLowerCase().includes(query)
    );
  }

  searchPriority(event: any) {
    const query = event.query.toLowerCase();
    this.prioritySuggestions = this.priorityOptions.filter((priority) =>
      priority.label.toLowerCase().includes(query)
    );
  }

  searchDepartment(event: any) {
    const query = event.query.toLowerCase();
    this.departmentSuggestions = this.departments.filter((dept) =>
      dept.name.toLowerCase().includes(query)
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

  onStatusFilter(event: any) {
    if (event && event.value) {
      this.statusFilter = event.value;
    } else if (event === null) {
      this.statusFilter = '';
    }
    this.applyFilters();
  }

  onPriorityFilter(event: any) {
    if (event && event.value) {
      this.priorityFilter = event.value;
    } else if (event === null) {
      this.priorityFilter = '';
    }
    this.applyFilters();
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

  clearFilters() {
    this.searchTerm = '';
    this.statusFilter = '';
    this.priorityFilter = '';
    this.filteredRequests = [...this.requests];
  }

  hasFilters(): boolean {
    return !!(this.searchTerm || this.statusFilter || this.priorityFilter);
  }

  // Dialog methods
  showCreateDialog() {
    this.createDialog = true;
    this.resetForm();
  }

  showDetailsDialog(request: DocumentRequestDTO) {
    this.selectedRequest = request;
    this.detailsDialog = true;
  }

  // CRUD operations
  createRequest() {
    this.validationErrors = this.validateForm();
    if (this.validationErrors.length > 0) {
      return;
    }

    this.creatingRequest = true;

    setTimeout(() => {
      const newRequest: Request = {
        id: (this.requests.length + 1).toString(),
        requesterName: 'Utilisateur Courant',
        requesterEmail: 'user@company.com',
        departmentName: this.getDepartmentName(
          this.getSelectedValue(this.newRequest.departmentId)
        ),
        departmentId: this.getSelectedValue(this.newRequest.departmentId)!,
        documentType: this.getDisplayValue(this.newRequest.documentType)!,
        priority: this.getSelectedValue(this.newRequest.priority)!,
        status: 'Pending',
        description: this.newRequest.description!,
        requestedAt: new Date(),
        createdAt: new Date(),
      };

      this.requests.unshift(newRequest);
      this.applyFilters();
      this.updateStats();

      this.messageService.add({
        severity: 'success',
        summary: 'Succès',
        detail: 'Demande créée avec succès',
      });

      this.createDialog = false;
      this.creatingRequest = false;
    }, 1500);
  }

  respondToRequest(request: DocumentRequestDTO) {
    this.selectedRequest = request;
    this.responseDialog = true;
    this.resetResponseForm();
  }

  editRequest(request: DocumentRequestDTO) {
    // Implementation for editing request
    this.messageService.add({
      severity: 'info',
      summary: 'Modification',
      detail: 'Fonction de modification en cours de développement',
    });
  }

  deleteRequest(request: DocumentRequestDTO) {
    this.confirmationService.confirm({
      message: 'Êtes-vous sûr de vouloir supprimer cette demande ?',
      header: 'Confirmer la suppression',
      icon: 'pi pi-exclamation-triangle',
      // accept: () => {
      //   this.requests = this.requests.filter(r => r.id !== request.id);
      //   this.applyFilters();
      //   this.updateStats();

      //   this.messageService.add({
      //     severity: 'success',
      //     summary: 'Supprimé',
      //     detail: 'Demande supprimée avec succès'
      //   });
      // }
    });
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
    const formData = new FormData();
    formData.append('File', this.selectedFile ? this.selectedFile : '');
    formData.append('Name', this.selectedFile ? this.selectedFile.name : '');
    formData.append('FolderId', '10');

    // Example folderId
    this.documentService.uploadDocument(formData).subscribe({
      next: (response) => {
        console.log('File uploaded successfully:', response);
      },
      error: (error) => {
        console.error('Error uploading file:', error);
      },
    });

    console.log();
    this.documentRequsetService
      .updateDocumentRequest(this.selectedRequest, this.selectedRequest.id)
      .subscribe({
        next: (response) => {
          console.log('Document request updated successfully:', response);
        },
        error: (error) => {
          console.error('Error updating document request:', error);
        },
      });

    // setTimeout(() => {
    //   if (this.selectedRequest) {
    //     this.selectedRequest.status = this.getSelectedValue(this.responseForm.status);
    //     this.selectedRequest.respondedAt = new Date();
    //     this.selectedRequest.processedByName = 'Admin Courant';

    //     if (this.selectedFile) {
    //       this.selectedRequest.responseDocumentName = this.selectedFile.name;
    //     }
    //   }

    //   this.applyFilters();
    //   this.updateStats();

    //   this.messageService.add({
    //     severity: 'success',
    //     summary: 'Réponse envoyée',
    //     detail: 'La réponse a été envoyée avec succès'
    //   });

    //   this.responseDialog = false;
    //   this.sendingResponse = false;
    // }, 1500);
  }

  // Utility methods
  getInitials(name: string): string {
    return name
      .split(' ')
      .map((n) => n[0])
      .join('')
      .toUpperCase();
  }

  getStatusSeverity(status: string): string {
    const severityMap: { [key: string]: string } = {
      Pending: 'warning',
      Approved: 'success',
      Rejected: 'danger',
      'In Progress': 'info',
    };
    return severityMap[status] || 'secondary';
  }

  getStatusIcon(status: string): string {
    const iconMap: { [key: string]: string } = {
      Pending: 'pi-clock',
      Approved: 'pi-check',
      Rejected: 'pi-times',
      'In Progress': 'pi-spinner',
    };
    return iconMap[status] || 'pi-info';
  }

  getPrioritySeverity(priority: string): string {
    const severityMap: { [key: string]: string } = {
      urgent: 'danger',
      haute: 'warning',
      normale: 'info',
      basse: 'secondary',
    };
    return severityMap[priority] || 'secondary';
  }

  getPriorityIcon(priority: string): string {
    const iconMap: { [key: string]: string } = {
      urgent: 'pi-exclamation-triangle',
      haute: 'pi-flag',
      normale: 'pi-minus',
      basse: 'pi-arrow-down',
    };
    return iconMap[priority] || 'pi-flag';
  }

  getDocumentTypeIcon(type: string): string {
    return 'pi pi-file-text';
  }

  getDocumentTypeColor(type: string): string {
    return '#3B82F6';
  }

  getDepartmentName(departmentId: string): string {
    const dept = this.departments.find((d) => d.id === departmentId);
    return dept?.name || '';
  }

  // Helper methods for AutoComplete values
  getDisplayValue(value: any): string {
    if (!value) return '';
    if (typeof value === 'string') return value;
    if (typeof value === 'object' && value.label) return value.label;
    if (typeof value === 'object' && value.name) return value.name;
    return value.toString();
  }

  getSelectedValue(value: any): string {
    if (!value) return '';
    if (typeof value === 'string') return value;
    if (typeof value === 'object' && value.value) return value.value;
    if (typeof value === 'object' && value.id) return value.id;
    return value.toString();
  }

  validateForm(): string[] {
    const errors: string[] = [];

    if (!this.newRequest.documentType) {
      errors.push('Le type de document est requis');
    }
    if (!this.newRequest.priority) {
      errors.push('La priorité est requise');
    }
    if (!this.newRequest.departmentId) {
      errors.push('Le département est requis');
    }
    if (!this.newRequest.description?.trim()) {
      errors.push('La description est requise');
    }

    return errors;
  }

  isFormValid(): boolean {
    return this.validateForm().length === 0;
  }

  isResponseValid(): boolean {
    return !!this.responseForm.status;
  }

  resetForm() {
    this.newRequest = {};
    this.validationErrors = [];
  }

  resetResponseForm() {
    this.responseForm = {
      status: '',
      message: '',
      notes: '',
    };
    this.selectedFile = null;
  }

  cancelCreate() {
    this.createDialog = false;
    this.resetForm();
  }

  cancelResponse() {
    this.responseDialog = false;
    this.resetResponseForm();
  }

  // File handling
  onFileSelect(event: any) {
    this.selectedFile = event.files[0];
  }

  removeSelectedFile() {
    this.selectedFile = null;
  }

  formatFileSize(bytes: number): string {
    if (bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
  }

  // Quick actions
  quickApprove() {
    this.requestResponse.status = 'Approved';
    // this.requestResponse.message = 'Votre demande a été approuvée. Le document sera traité dans les plus brefs délais.';
  }

  quickReject() {
    this.responseForm.status = 'Rejected';
    // this.responseForm.message = 'Votre demande a été rejetée. Veuillez nous contacter pour plus d\'informations.';
  }

  requestMoreInfo() {
    this.responseForm.status = 'More Info Required';
    //this.responseForm.message = 'Des informations supplémentaires sont nécessaires pour traiter votre demande. Veuillez nous fournir plus de détails.';
  }

  saveDraft() {
    this.messageService.add({
      severity: 'info',
      summary: 'Brouillon sauvegardé',
      detail: 'Votre réponse a été sauvegardée en brouillon',
    });
  }

  // Additional methods
  refreshRequests() {
    this.loadRequests();
    this.messageService.add({
      severity: 'info',
      summary: 'Actualisé',
      detail: 'Liste des demandes actualisée',
    });
  }

  exportRequests() {
    this.messageService.add({
      severity: 'info',
      summary: 'Export',
      detail: 'Export des demandes en cours...',
    });
  }

  downloadResponseDocument(request: DocumentRequestDTO) {
    this.messageService.add({
      severity: 'info',
      summary: 'Téléchargement',
      detail: `Téléchargement de ${request.responseDocumentName}`,
    });
  }

  getResponseStatusSeverity(status: string): string {
    return this.getStatusSeverity(status);
  }
}
