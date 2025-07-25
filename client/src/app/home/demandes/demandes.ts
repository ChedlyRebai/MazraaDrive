
import { Component, CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA, OnInit } from '@angular/core';
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
import { MessageService } from 'primeng/api';
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



import { HttpClientModule } from '@angular/common/http';

import { MultiSelectModule } from 'primeng/multiselect';
import { CustomerService } from './customerservice';
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
  ],
  schemas: [NO_ERRORS_SCHEMA, CUSTOM_ELEMENTS_SCHEMA],
  providers: [MessageService, CustomerService],
  templateUrl: './demandes.html',
  styleUrls: ['./demandes.css']
})




export class Demandes implements OnInit {
  customers!: Customer[];

  selectedCustomers!: Customer[];

  representatives!: Representative[];

  statuses!: any[];
  text: string | undefined;
  loading: boolean = true;

  activityValues: number[] = [0, 100];

  constructor(private customerService: CustomerService, private messageService: MessageService) { }
  visible: boolean = false;

  showDialog() {
    this.visible = true;
  }


  getSeverity(status: string) {
    switch (status) {
      case 'unqualified':
        return 'danger';

      case 'qualified':
        return 'success';

      case 'new':
        return 'info';

      case 'negotiation':
        return 'warn';

      case 'renewal':
        return null;


    }
    return null;
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
      important: true
    },
    {
      id: '2',
      from: 'Xuxue Feng',
      subject: 'Eget ipsum quam eu a, sit pellentesque molestie tristique.',
      date: 'May 28 2022',
      avatar: '/images/avatar/xuxuefeng.png',
      starred: true,
      important: false
    },
    {
      id: '3',
      from: 'Ivan Magalhaes',
      subject: 'Consequat sed nibh laoreet ultrices at elit tellus, nunc. Neque,',
      date: 'May 26 2022',
      avatar: '/images/avatar/ivanmagalhaes.png',
      starred: true,
      important: false
    },
    {
      id: '4',
      from: 'Asiya Javayant',
      subject: 'Consectetur sed dis viverra lorem. Augue felis sed elit rhoncus non',
      date: 'May 28 2022',
      avatar: '/images/avatar/asiyajavayant.png',
      starred: false,
      important: true
    },
    {
      id: '5',
      from: 'Amy Elsner',
      subject: 'Nullam purus metus, cras adipiscing magna et, aliquam gravida',
      date: 'May 30 2022',
      avatar: '/images/avatar/amyelsner.png',
      starred: false,
      important: true
    }
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
    { label: 'Trash', icon: 'pi pi-trash', count: 4 }
  ];

  // Menu items for mail actions
  mailMenuItems: MenuItem[] = [
    {
      label: 'Mark as Read',
      icon: 'pi pi-eye',
      command: () => this.markAsRead()
    },
    {
      label: 'Mark as Unread',
      icon: 'pi pi-eye-slash',
      command: () => this.markAsUnread()
    },
    {
      separator: true
    },
    {
      label: 'Delete Selected',
      icon: 'pi pi-trash',
      command: () => this.deleteSelected()
    }
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
    { label: '50', value: 50 }
  ];

  // Search
  searchTerm: string = '';

  // Dialog
  showNewMessageDialog: boolean = false;

  // Current active category
  activeCategory: string = 'Inbox';


  ngOnInit() {
    this.customerService.getCustomersLarge().then((customers: any) => {
      this.customers = customers;
      this.loading = false;

      this.customers.forEach((customer) => (customer.date = new Date(<Date>customer.date)));
    });

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
      { name: 'Xuxue Feng', image: 'xuxuefeng.png' }
    ];

    this.statuses = [
      { label: 'Unqualified', value: 'unqualified' },
      { label: 'Qualified', value: 'qualified' },
      { label: 'New', value: 'new' },
      { label: 'Negotiation', value: 'negotiation' },
      { label: 'Renewal', value: 'renewal' },
      { label: 'Proposal', value: 'proposal' }
    ];
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
    this.sidebarCategories.forEach(cat => cat.active = false);
    category.active = true;

    // Filter mails based on category
    this.filterMailsByCategory(category.label);

    this.messageService.add({
      severity: 'info',
      summary: 'Category Changed',
      detail: `Switched to ${category.label}`
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
    const index = this.selectedMails.findIndex(m => m.id === mail.id);
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
      detail: `Mail from ${mail.from} ${mail.starred ? 'starred' : 'unstarred'}`
    });
  }

  toggleImportant(mail: MailItem, event: Event) {
    event.stopPropagation();
    mail.important = !mail.important;

    this.messageService.add({
      severity: mail.important ? 'success' : 'info',
      summary: mail.important ? 'Important' : 'Not Important',
      detail: `Mail from ${mail.from} marked as ${mail.important ? 'important' : 'not important'}`
    });
  }

  // Mail actions
  archiveMail(mail: MailItem, event: Event) {
    event.stopPropagation();
    this.messageService.add({
      severity: 'success',
      summary: 'Archived',
      detail: `Mail from ${mail.from} archived`
    });
  }

  replyToMail(mail: MailItem, event: Event) {
    event.stopPropagation();
    this.showNewMessageDialog = true;
    // Set reply context
  }

  deleteMail(mail: MailItem, event: Event) {
    event.stopPropagation();
    const index = this.mails.findIndex(m => m.id === mail.id);
    if (index > -1) {
      this.mails.splice(index, 1);
      this.totalRecords--;
    }

    this.messageService.add({
      severity: 'warn',
      summary: 'Deleted',
      detail: `Mail from ${mail.from} deleted`
    });
  }

  // Bulk actions
  markAsRead() {
    this.selectedMails.forEach(mail => mail.read = true);
    this.messageService.add({
      severity: 'success',
      summary: 'Marked as Read',
      detail: `${this.selectedMails.length} mails marked as read`
    });
  }

  markAsUnread() {
    this.selectedMails.forEach(mail => mail.read = false);
    this.messageService.add({
      severity: 'info',
      summary: 'Marked as Unread',
      detail: `${this.selectedMails.length} mails marked as unread`
    });
  }

  deleteSelected() {
    this.selectedMails.forEach(selectedMail => {
      const index = this.mails.findIndex(mail => mail.id === selectedMail.id);
      if (index > -1) {
        this.mails.splice(index, 1);
      }
    });

    this.messageService.add({
      severity: 'warn',
      summary: 'Deleted',
      detail: `${this.selectedMails.length} mails deleted`
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
      detail: 'Mail list refreshed'
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

  // Utility methods
  getStarIcon(mail: MailItem): string {
    return mail.starred ? 'pi pi-star-fill' : 'pi pi-star';
  }

  getImportantIcon(mail: MailItem): string {
    return mail.important ? 'pi pi-bookmark-fill' : 'pi pi-bookmark';
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
    return this.mails.length > 0 && this.selectedMails.length === this.mails.length;
  }

  // Check if some mails are selected
  get someSelected(): boolean {
    return this.selectedMails.length > 0 && this.selectedMails.length < this.mails.length;
  }

  // Get selected count
  get selectedCount(): number {
    return this.selectedMails.length;
  }
}