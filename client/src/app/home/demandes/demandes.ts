import {
  Component,
  CUSTOM_ELEMENTS_SCHEMA,
  NO_ERRORS_SCHEMA,
  OnInit,
} from '@angular/core';
import { CommonModule } from '@angular/common';
import { EditorModule } from 'primeng/editor';
// PrimeNG Imports
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { ToastModule } from 'primeng/toast';
import { CheckboxModule } from 'primeng/checkbox';
import { AvatarModule } from 'primeng/avatar';
import { MenuModule } from 'primeng/menu';
import { PaginatorModule } from 'primeng/paginator';
import { SelectModule } from 'primeng/select';
import { DialogModule } from 'primeng/dialog';
import { InputTextModule } from 'primeng/inputtext';
import { IconField, IconFieldModule } from 'primeng/iconfield';
import { InputIcon, InputIconModule } from 'primeng/inputicon';
import { TooltipModule } from 'primeng/tooltip';

// Servicesimport { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Editor } from 'primeng/editor';
import { ConfirmationService, MessageService } from 'primeng/api';
import { MenuItem } from 'primeng/api';
import { ThemeSwitcher } from '../../admin/themeswitcher';
import { Tag } from 'primeng/tag';

// Interfaces
interface MailItem {
  id: string;
  from: string;
  subject: string;
  date: string;
  avatar: string;
  starred: boolean;
  important: boolean;
  selected?: boolean;
  read?: boolean;
}

interface SidebarCategory {
  label: string;
  icon: string;
  count: number;
  active?: boolean;
}

interface PaginationOption {
  label: string;
  value: number;
}

import { HttpClient, HttpClientModule } from '@angular/common/http';

import { MultiSelectModule } from 'primeng/multiselect';
import { CustomerService } from './customerservice';
import { CreateDocumentRequestDTO, DocumentRequestDTO } from '../../shared/models/docrequest';
import { DocumentPagedResult } from '../../shared/models/document';
import { environment } from '../../../environments/environment';
import { ConfirmDialog } from 'primeng/confirmdialog';
export interface Country {
  name?: string;
  code?: string;
}

export interface Representative {
  name?: string;
  image?: string;
}

export interface Customer {
  id?: number;
  name?: string;
  country?: Country;
  company?: string;
  date?: string | Date;
  status?: string;
  activity?: number;
  representative?: Representative;
  verified?: boolean;
  balance?: number;
}
@Component({
  selector: 'app-demandes',
  standalone: true,
  imports: [
    CommonModule,
    // PrimeNG Modules
    TableModule,
    ButtonModule,
    ToastModule,
    AvatarModule,
    MenuModule,
    FormsModule,
    Editor,
    PaginatorModule,
    SelectModule,
    DialogModule,
    InputTextModule,
    IconFieldModule,
    InputIconModule,
    TooltipModule,
    ThemeSwitcher,
    TableModule,
    Tag,
    ButtonModule,
    IconField,
    InputIcon,
    HttpClientModule,
    CommonModule,
    MultiSelectModule,
    InputTextModule,
    ThemeSwitcher,
    ConfirmDialog,
    ToastModule,
    ButtonModule,
  ],
  schemas: [NO_ERRORS_SCHEMA, CUSTOM_ELEMENTS_SCHEMA],
  providers: [MessageService, CustomerService, ConfirmationService],
  templateUrl: './demandes.html',
  styleUrls: ['./demandes.css'],
})
export class Demandes implements OnInit {
  demandes: DocumentRequestDTO[] = [];

  customers!: Customer[];
  visible = false;
  statuses = ['Pending', 'Completed', 'Rejected'];
  priorities = ['Low', 'Normal', 'High', 'Urgent'];

  selectedCustomers!: Customer[];

  representatives!: Representative[];
  newRequest: CreateDocumentRequestDTO = {} as CreateDocumentRequestDTO;

  text: string | undefined;
  loading: boolean = true;

  activityValues: number[] = [0, 100];

  constructor(
    private HttpClient: HttpClient,
    private customerService: CustomerService,
    private messageService: MessageService,
    private confirmationService: ConfirmationService
  ) {}

  showDialog() {
    this.visible = true;
  }

  // Mail data
  mails: MailItem[] = [
    {
      id: '1',
      from: 'Ioni Bowcher',
      subject: 'Apply These 7 Secret Techniques To Improve Event Apply These',
      date: 'May 30 2022',
      avatar: '/images/avatar/ionibowcher.png',
      starred: false,
      important: true,
    },
  ];

  // Selected mails
  selectedMails: MailItem[] = [];

  // Sidebar categories
  sidebarCategories: SidebarCategory[] = [
    { label: 'Inbox', icon: 'pi pi-inbox', count: 10, active: true },
    { label: 'Starred', icon: 'pi pi-star', count: 8 },
    { label: 'Spam', icon: 'pi pi-ban', count: 3 },
    { label: 'Important', icon: 'pi pi-bookmark', count: 5 },
    { label: 'Sent', icon: 'pi pi-send', count: 3 },
    { label: 'Archived', icon: 'pi pi-book', count: 6 },
    { label: 'Trash', icon: 'pi pi-trash', count: 4 },
  ];

  // Menu items for mail actions
  mailMenuItems: MenuItem[] = [
    {
      label: 'Mark as Read',
      icon: 'pi pi-eye',
      command: () => this.markAsRead(),
    },
    {
      label: 'Mark as Unread',
      icon: 'pi pi-eye-slash',
      command: () => this.markAsUnread(),
    },
    {
      separator: true,
    },
    {
      label: 'Delete Selected',
      icon: 'pi pi-trash',
      command: () => this.deleteSelected(),
    },
  ];

  // Pagination
  first: number = 0;
  rows: number = 10;
  totalRecords: number = 12;

  // Pagination options
  rowsPerPageOptions: PaginationOption[] = [
    { label: '5', value: 5 },
    { label: '10', value: 10 },
    { label: '25', value: 25 },
    { label: '50', value: 50 },
  ];

  // Search
  searchTerm: string = '';

  // Dialog
  showNewMessageDialog: boolean = false;

  // Current active category
  activeCategory: string = 'Inbox';

  ngOnInit() {
    this.loadDocumentRequests();

    this.representatives = [
      { name: 'Amy Elsner', image: 'amyelsner.png' },
      { name: 'Anna Fali', image: 'annafali.png' },
      { name: 'Asiya Javayant', image: 'asiyajavayant.png' },
      { name: 'Bernardo Dominic', image: 'bernardodominic.png' },
      { name: 'Elwin Sharvill', image: 'elwinsharvill.png' },
      { name: 'Ioni Bowcher', image: 'ionibowcher.png' },
      { name: 'Ivan Magalhaes', image: 'ivanmagalhaes.png' },
      { name: 'Onyama Limba', image: 'onyamalimba.png' },
      { name: 'Stephen Shaw', image: 'stephenshaw.png' },
      { name: 'Xuxue Feng', image: 'xuxuefeng.png' },
    ];

    // this.statuses = [
    //   { label: 'Unqualified', value: 'unqualified' },
    //   { label: 'Qualified', value: 'qualified' },
    //   { label: 'New', value: 'new' },
    //   { label: 'Negotiation', value: 'negotiation' },
    //   { label: 'Renewal', value: 'renewal' },
    //   { label: 'Proposal', value: 'proposal' },
    // ];
    // Initialize component
    this.loadMails();
  }

  // Load mails based on current filters
  loadMails() {
    // In a real application, this would make an API call
    // For now, we'll just use the static data
    this.totalRecords = this.mails.length;
  }

  // Sidebar category selection
  onCategorySelect(category: SidebarCategory) {
    this.activeCategory = category.label;
    this.sidebarCategories.forEach((cat) => (cat.active = false));
    category.active = true;

    // Filter mails based on category
    this.filterMailsByCategory(category.label);

    this.messageService.add({
      severity: 'info',
      summary: 'Category Changed',
      detail: `Switched to ${category.label}`,
    });
  }

  // Filter mails by category
  filterMailsByCategory(categoryLabel: string) {
    // In a real application, this would filter the mails array
    // based on the selected category
    console.log(`Filtering by category: ${categoryLabel}`);
  }

  // Mail selection handlers
  onMailSelect(mail: MailItem) {
    // Toggle selection
    const index = this.selectedMails.findIndex((m) => m.id === mail.id);
    if (index > -1) {
      this.selectedMails.splice(index, 1);
    } else {
      this.selectedMails.push(mail);
    }
  }

  onSelectAll(event: any) {
    if (event.checked) {
      this.selectedMails = [...this.mails];
    } else {
      this.selectedMails = [];
    }
  }

  // Star/Bookmark handlers
  toggleStar(mail: MailItem, event: Event) {
    event.stopPropagation();
    mail.starred = !mail.starred;

    this.messageService.add({
      severity: mail.starred ? 'success' : 'info',
      summary: mail.starred ? 'Starred' : 'Unstarred',
      detail: `Mail from ${mail.from} ${
        mail.starred ? 'starred' : 'unstarred'
      }`,
    });
  }

  toggleImportant(mail: MailItem, event: Event) {
    event.stopPropagation();
    mail.important = !mail.important;

    this.messageService.add({
      severity: mail.important ? 'success' : 'info',
      summary: mail.important ? 'Important' : 'Not Important',
      detail: `Mail from ${mail.from} marked as ${
        mail.important ? 'important' : 'not important'
      }`,
    });
  }

  // Mail actions
  archiveMail(mail: MailItem, event: Event) {
    event.stopPropagation();
    this.messageService.add({
      severity: 'success',
      summary: 'Archived',
      detail: `Mail from ${mail.from} archived`,
    });
  }

  replyToMail(mail: MailItem, event: Event) {
    event.stopPropagation();
    this.showNewMessageDialog = true;
    // Set reply context
  }

  deleteMail(mail: MailItem, event: Event) {
    event.stopPropagation();
    const index = this.mails.findIndex((m) => m.id === mail.id);
    if (index > -1) {
      this.mails.splice(index, 1);
      this.totalRecords--;
    }

    this.messageService.add({
      severity: 'warn',
      summary: 'Deleted',
      detail: `Mail from ${mail.from} deleted`,
    });
  }

  // Bulk actions
  markAsRead() {
    this.selectedMails.forEach((mail) => (mail.read = true));
    this.messageService.add({
      severity: 'success',
      summary: 'Marked as Read',
      detail: `${this.selectedMails.length} mails marked as read`,
    });
  }

  markAsUnread() {
    this.selectedMails.forEach((mail) => (mail.read = false));
    this.messageService.add({
      severity: 'info',
      summary: 'Marked as Unread',
      detail: `${this.selectedMails.length} mails marked as unread`,
    });
  }

  deleteSelected() {
    this.selectedMails.forEach((selectedMail) => {
      const index = this.mails.findIndex((mail) => mail.id === selectedMail.id);
      if (index > -1) {
        this.mails.splice(index, 1);
      }
    });

    this.messageService.add({
      severity: 'warn',
      summary: 'Deleted',
      detail: `${this.selectedMails.length} mails deleted`,
    });

    this.selectedMails = [];
    this.totalRecords = this.mails.length;
  }

  // Refresh mails
  refreshMails() {
    this.loadMails();
    this.messageService.add({
      severity: 'success',
      summary: 'Refreshed',
      detail: 'Mail list refreshed',
    });
  }

  // Search functionality
  onSearch(event: any) {
    this.searchTerm = event.target.value;
    // In a real application, this would trigger a search API call
    console.log('Searching for:', this.searchTerm);
  }

  // Pagination handlers
  onPageChange(event: any) {
    this.first = event.first;
    this.rows = event.rows;
    this.loadMails();
  }

  // Dialog handlers
  showNewMessage() {
    this.showNewMessageDialog = true;
  }

  hideNewMessage() {
    this.showNewMessageDialog = false;
  }

  // Compose new message
  composeNew() {
    this.showNewMessageDialog = true;
  }

  getMailRowClass(mail: MailItem): string {
    let classes = 'cursor-pointer';
    if (mail.read === false) {
      classes += ' font-bold';
    }
    return classes;
  }

  // Check if all mails are selected
  get allSelected(): boolean {
    return (
      this.mails.length > 0 && this.selectedMails.length === this.mails.length
    );
  }

  // Check if some mails are selected
  get someSelected(): boolean {
    return (
      this.selectedMails.length > 0 &&
      this.selectedMails.length < this.mails.length
    );
  }

  // Get selected count
  get selectedCount(): number {
    return this.selectedMails.length;
  }

  // Add these methods to your component

  hideDialog() {
    this.visible = false;
  }


  detailsDialog: boolean = false;
  resquestDetails(demande: any) {
    // Handle request details logic
    console.log('Request details for:', demande);
  }
  deleteRequest(demande: any) {
    this.confirmationService.confirm({
      //target: event.target as EventTarget,
      message: 'Do you want to delete this record?',
      header: 'Danger Zone',
      icon: 'pi pi-info-circle',
      rejectLabel: 'Cancel',
      rejectButtonProps: {
        label: 'Cancel',
        severity: 'secondary',
        outlined: true,
      },
      acceptButtonProps: {
        label: 'Delete',
        severity: 'danger',
      },

      accept: () => {
        this.HttpClient.delete(
          `${this.baseUrl}/DocumentRequest/${demande.id}`
        ).subscribe({
          next: (response: any) => {
            this.messageService.add({
              severity: 'success',
              summary: 'Request Deleted',
              detail: `Request ${demande.id} deleted successfully`,
            });
            this.loadDocumentRequests(); // Refresh the list after deletion
          },
          error: (error) => {
            this.messageService.add({
              severity: 'error',
              summary: 'Deletion Failed',
              detail: `Failed to delete request ${demande.id}`,
            });
            console.error('Error deleting request:', error);
          },
        });
      },
      reject: () => {
        this.messageService.add({
          severity: 'error',
          summary: 'Rejected',
          detail: 'You have rejected',
        });
      },
    });
  }




  getSeverity(status: string) {
    switch (status) {
      case 'Pending':
        return 'warning';
      case 'Completed':
        return 'success';
      case 'Rejected':
        return 'danger';
      default:
        return 'info';
    }
  }

  baseUrl = environment.apiUrl;
  loadDocumentRequests() {
    this.HttpClient.get<DocumentPagedResult>(
      `${this.baseUrl}/DocumentRequest`
    ).subscribe({
      next: (response: any) => {
        this.demandes = response.data;

        console.log('Document requests fetched successfully:', response);
      },
      error: (error) => {
        console.error('Error fetching document requests:', error);
      },
    });
  }



  // Add these properties to your component
selectedRequest: DocumentRequestDTO | null = null;

// Update the showDetailsDialog method
showDetailsDialog(demande: DocumentRequestDTO) {
  this.selectedRequest = demande;
  this.detailsDialog = true;
}

// Add these new methods
editRequest(request: DocumentRequestDTO) {
  // Handle edit logic
  console.log('Editing request:', request);
  // You can open an edit dialog or navigate to edit page
}

downloadResponseDocument(request: DocumentRequestDTO) {
  if (request.responseDocumentId) {
    // Handle document download
    console.log('Downloading document:', request.responseDocumentName);
    // Implement download logic here
  }
}

// Add the priority severity method if not already present
getPrioritySeverity(priority: string) {
  switch (priority) {
    case 'Urgent':
      return 'danger';
    case 'High':
      return 'warning';
    case 'Normal':
      return 'info';
    case 'Low':
      return 'success';
    default:
      return 'info';
  }
}


// Add these properties to your component
responseDialog = false;
sendingResponse = false;
selectedFile: File | null = null;
uploadUrl = 'http://localhost:5108/api/DocumentRequest/upload-response';

responseForm = {
  status: '',
  message: '',
  notes: '',
  followUpPriority: 'Normal',
  followUpDate: null as Date | null
};

responseStatuses = [
  { label: 'Approuvé', value: 'Approved' },
  { label: 'Rejeté', value: 'Rejected' },
  { label: 'En attente d\'informations', value: 'Pending_Info' },
  { label: 'En cours de traitement', value: 'Processing' },
  { label: 'Complété', value: 'Completed' }
];

// Update the respondToRequest method
respondToRequest(request: DocumentRequestDTO) {
  this.selectedRequest = request;
  this.responseDialog = true;
  this.resetResponseForm();
}

// Add these new methods
resetResponseForm() {
  this.responseForm = {
    status: '',
    message: '',
    notes: '',
    followUpPriority: 'Normal',
    followUpDate: null
  };
  this.selectedFile = null;
}

onFileSelect(event: any) {
  this.selectedFile = event.files[0];
}

onFileUpload(event: any) {
  console.log('File uploaded:', event);
  this.messageService.add({
    severity: 'success',
    summary: 'Success',
    detail: 'File uploaded successfully'
  });
}

onFileError(event: any) {
  console.error('File upload error:', event);
  this.messageService.add({
    severity: 'error',
    summary: 'Error',
    detail: 'File upload failed'
  });
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

quickApprove() {
  this.responseForm.status = 'Approved';
  this.responseForm.message = 'Votre demande a été approuvée. Vous pouvez procéder comme prévu.';
}

quickReject() {
  this.responseForm.status = 'Rejected';
  this.responseForm.message = 'Votre demande a été rejetée. Veuillez consulter les notes pour plus de détails.';
}

requestMoreInfo() {
  this.responseForm.status = 'Pending_Info';
  this.responseForm.message = 'Nous avons besoin d\'informations supplémentaires pour traiter votre demande. Veuillez nous contacter.';
}

getResponseStatusSeverity(status: string) {
  switch (status) {
    case 'Approved':
    case 'Completed':
      return 'success';
    case 'Rejected':
      return 'danger';
    case 'Pending_Info':
    case 'Processing':
      return 'warning';
    default:
      return 'info';
  }
}

isResponseValid(): boolean {
  return !!(this.responseForm.status && this.responseForm.message.trim());
}

cancelResponse() {
  this.responseDialog = false;
  this.resetResponseForm();
}

saveDraft() {
  // Implement save draft logic
  console.log('Saving draft:', this.responseForm);
  this.messageService.add({
    severity: 'info',
    summary: 'Brouillon Sauvegardé',
    detail: 'Votre brouillon a été sauvegardé'
  });
}

sendResponse() {
  if (!this.isResponseValid()) {
    this.messageService.add({
      severity: 'warn',
      summary: 'Validation',
      detail: 'Veuillez remplir tous les champs requis'
    });
    return;
  }

  this.sendingResponse = true;

  // Create the response data
  const responseData = {
    requestId: this.selectedRequest?.id,
    status: this.responseForm.status,
    message: this.responseForm.message,
    notes: this.responseForm.notes,
    followUpPriority: this.responseForm.followUpPriority,
    followUpDate: this.responseForm.followUpDate,
    hasDocument: !!this.selectedFile
  };

  // Simulate API call
  setTimeout(() => {
    console.log('Sending response:', responseData);

    this.messageService.add({
      severity: 'success',
      summary: 'Réponse Envoyée',
      detail: 'Votre réponse a été envoyée avec succès'
    });

    this.sendingResponse = false;
    this.responseDialog = false;
    this.resetResponseForm();

    // Refresh the data
    this.loadDocumentRequests();
  }, 2000);
}



// Add these properties to your component
creatingRequest = false;
validationErrors: string[] = [];
minDate = new Date(); // Today's date

documentTypes = [
  { label: 'Certificat de travail', value: 'employment_certificate' },
  { label: 'Attestation de salaire', value: 'salary_certificate' },
  { label: 'Congé annuel', value: 'annual_leave' },
  { label: 'Congé maladie', value: 'sick_leave' },
  { label: 'Rapport mensuel', value: 'monthly_report' },
  { label: 'Facture', value: 'invoice' },
  { label: 'Contrat', value: 'contract' },
  { label: 'Autre', value: 'other' }
];

priorityOptions = [
  { label: 'Faible', value: 'Low' },
  { label: 'Normale', value: 'Normal' },
  { label: 'Élevée', value: 'High' },
  { label: 'Urgente', value: 'Urgent' }
];

departments = [
  { id: 1, name: 'Ressources Humaines' },
  { id: 2, name: 'Finance' },
  { id: 3, name: 'IT' },
  { id: 4, name: 'Marketing' },
  { id: 5, name: 'Opérations' }
];

contactMethods = [
  { label: 'Email', value: 'email' },
  { label: 'Téléphone', value: 'phone' },
  { label: 'SMS', value: 'sms' },
  { label: 'En personne', value: 'in_person' }
];

// Enhanced newRequest object


// Enhanced methods
isFormValid(): boolean {
  return !!(
    this.newRequest.documentType &&
    this.newRequest.priority &&
    this.newRequest.description?.trim() &&
    this.newRequest.departmentId
  );
}

validateForm(): boolean {
  this.validationErrors = [];

  if (!this.newRequest.documentType) {
    this.validationErrors.push('Le type de document est obligatoire');
  }

  if (!this.newRequest.priority) {
    this.validationErrors.push('La priorité est obligatoire');
  }

  if (!this.newRequest.description?.trim()) {
    this.validationErrors.push('La description est obligatoire');
  } else if (this.newRequest.description.length < 10) {
    this.validationErrors.push('La description doit contenir au moins 10 caractères');
  }

  if (!this.newRequest.departmentId) {
    this.validationErrors.push('Le département est obligatoire');
  }

  return this.validationErrors.length === 0;
}

getDepartmentName(departmentId: number | null): string {
  if (!departmentId) return '';
  const dept = this.departments.find(d => d.id === departmentId);
  return dept ? dept.name : '';
}

resetForm() {
  this.newRequest = {
    documentType: '',
    priority: 'Normal',
    description: '',
    departmentId: 10,
    requesterId:"10"
  };
  this.validationErrors = [];
}
createDialog: boolean = false;
cancelCreate() {
  this.resetForm();
  this.createDialog = false;
}

// Enhanced createRequest method
createRequest() {
  if (!this.validateForm()) {
    this.messageService.add({
      severity: 'warn',
      summary: 'Validation',
      detail: 'Veuillez corriger les erreurs avant de continuer'
    });
    return;
  }

  this.creatingRequest = true;

  // Prepare the request data
  const requestData = {
    ...this.newRequest,
    requestedAt: new Date().toISOString(),
    createdAt: new Date().toISOString()
  };

  // Simulate API call
  // setTimeout(() => {
  //   console.log('Creating request:', requestData);

  //   // Add to local array (for demo purposes)
  //   const newId = Math.max(...this.demandes.map(d => d.id)) + 1;
  //   const newDemande = {

  //     ...requestData,
  //     requesterName: 'Current User', // Get from auth service
  //     departmentName: this.getDepartmentName(requestData.departmentId!),
  //     responseDocumentId: null,
  //     responseDocumentName: null,
  //     respondedAt: null,
  //     processedById: null,
  //     processedByName: null,
  //     updatedAt: null,
  //     isActive: true
  //   };

  //   this.demandes.unshift(newDemande);
  //   this.totalRecords++;

  //   this.messageService.add({
  //     severity: 'success',
  //     summary: 'Succès',
  //     detail: 'Votre demande a été créée avec succès'
  //   });

  //   this.creatingRequest = false;
  //   this.visible = false;
  //   this.resetForm();

  //   // Refresh the data
  //   this.loadDocumentRequests();
  // }, 2000);
}


}




