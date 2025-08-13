import { Component, OnInit } from '@angular/core';
import { ConfirmationService, MessageService } from 'primeng/api';
import { AuditLogDto, AuditLogStatisticsDto } from '../../../shared/models/logs';
import { Button } from "primeng/button";
import { Dialog } from "primeng/dialog";
import { SharedModule } from "../../../shared/shared.module";
import { AutoComplete } from "primeng/autocomplete";
import { ThemeSwitcher } from "../../themeswitcher";

@Component({
  selector: 'app-action-logs',
  templateUrl: './action-logs.html',
  styleUrls: ['./action-logs.css'],
  providers: [ConfirmationService, MessageService],
  imports: [Button, Dialog, SharedModule, AutoComplete, ThemeSwitcher]
})
export class ActionLogs implements OnInit {
  logs: any = null; // Should be PagedResult<AuditLogDto>
  statistics: AuditLogStatisticsDto | null = null;
  selectedLogs: AuditLogDto[] = [];
  loading = false;

  // Filters
  globalFilterValue = '';
  selectedActionType: any = null;
  filteredActionTypes: any[] = [];
  selectedTargetEntity: any = null;
  filteredTargetEntities: any[] = [];

  // Dialogs
  logDetailsDialog = false;
  selectedLog: AuditLogDto | null = null;

  constructor(
    
    private confirmationService: ConfirmationService,
    private messageService: MessageService
  ) {}

  ngOnInit(): void {
    this.loadLogs();
    this.loadStatistics();
    this.loadActionTypes();
    this.loadTargetEntities();
  }

  loadLogs(event?: any) {
    this.loading = true;
    const page = event?.first ? event.first / event.rows + 1 : 1;
    const pageSize = event?.rows || 10;
    const sortField = event?.sortField || null;
    const sortOrder = event?.sortOrder === 1 ? 'asc' : 'desc';

    // this.auditLogService.getPagedLogs({
    //   pageNumber: page,
    //   pageSize: pageSize,
    //   search: this.globalFilterValue,
    //   sortBy: sortField,
    //   sortDirection: sortOrder,
    //   actionType: this.selectedActionType?.label,
    //   targetEntity: this.selectedTargetEntity?.label
    // }).subscribe({
    //   next: (res) => {
    //     this.logs = res;
    //     this.loading = false;
    //   },
    //   error: () => {
    //     this.loading = false;
    //     this.messageService.add({ severity: 'error', summary: 'Erreur', detail: 'Erreur lors du chargement des logs.' });
    //   }
    // });
  }

  loadStatistics() {
    // this.auditLogService.getStatistics().subscribe({
    //   next: (stats) => this.statistics = stats
    // });
  }

  loadActionTypes() {
    // this.auditLogService.getActionTypes().subscribe({
    //   next: (types) => this.filteredActionTypes = types.map((t: string) => ({ label: t }))
    // });
  }

  loadTargetEntities() {
    // this.auditLogService.getTargetEntities().subscribe({
    //   next: (entities) => this.filteredTargetEntities = entities.map((e: string) => ({ label: e }))
    // });
  }

  onPageChange(event: any) {
    this.loadLogs(event);
  }

  onGlobalFilter(value: string) {
    this.globalFilterValue = value;
    this.loadLogs();
  }

  searchActionType(event: any) {
    const query = event.query.toLowerCase();
    this.filteredActionTypes = this.filteredActionTypes.filter(type => type.label.toLowerCase().includes(query));
  }

  onActionTypeSelect(event: any) {
    this.loadLogs();
  }

  onActionTypeClear() {
    this.selectedActionType = null;
    this.loadLogs();
  }

  searchTargetEntity(event: any) {
    const query = event.query.toLowerCase();
    this.filteredTargetEntities = this.filteredTargetEntities.filter(entity => entity.label.toLowerCase().includes(query));
  }

  onTargetEntitySelect(event: any) {
    this.loadLogs();
  }

  onTargetEntityClear() {
    this.selectedTargetEntity = null;
    this.loadLogs();
  }

  refresh() {
    this.loadLogs();
    this.loadStatistics();
  }

  exportLogs() {
    // this.auditLogService.exportLogs().subscribe({
    //   next: (blob) => {
    //     const url = window.URL.createObjectURL(blob);
    //     const a = document.createElement('a');
    //     a.href = url;
    //     a.download = 'logs.csv';
    //     a.click();
    //     window.URL.revokeObjectURL(url);
    //   },
    //   error: () => {
    //     this.messageService.add({ severity: 'error', summary: 'Erreur', detail: 'Erreur lors de l\'export.' });
    //   }
    // });
  }

  deleteSelectedLogs() {
    // this.confirmationService.confirm({
    //   message: 'Voulez-vous vraiment supprimer les logs sélectionnés ?',
    //   header: 'Confirmation',
    //   icon: 'pi pi-exclamation-triangle',
    //   accept: () => {
    //     const ids = this.selectedLogs.map(log => log.id);
    //     this.auditLogService.deleteLogs({ ids }).subscribe({
    //       next: () => {
    //         this.messageService.add({ severity: 'success', summary: 'Succès', detail: 'Logs supprimés.' });
    //         this.selectedLogs = [];
    //         this.loadLogs();
    //         this.loadStatistics();
    //       },
    //       error: () => {
    //         this.messageService.add({ severity: 'error', summary: 'Erreur', detail: 'Erreur lors de la suppression.' });
    //       }
    //     });
    //   }
    // });
  }

  showLogDetails(log: AuditLogDto) {
    this.selectedLog = log;
    this.logDetailsDialog = true;
  }
}