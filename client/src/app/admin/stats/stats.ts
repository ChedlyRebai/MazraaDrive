import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MessageService } from 'primeng/api';

// PrimeNG Imports
import { ChartModule } from 'primeng/chart';
import { KnobModule } from 'primeng/knob';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { AutoCompleteModule } from 'primeng/autocomplete'; // Changed from DropdownModule
import { ProgressBarModule } from 'primeng/progressbar';
import { TagModule } from 'primeng/tag';
import { AvatarModule } from 'primeng/avatar';
import { DialogModule } from 'primeng/dialog';
import { ToastModule } from 'primeng/toast';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { InputTextModule } from 'primeng/inputtext';
import { TooltipModule } from 'primeng/tooltip';
import { ThemeSwitcher } from '../themeswitcher';

interface Activity {
  id: number;
  userName: string;
  userEmail: string;
  action: string;
  type: string;
  timestamp: string;
  ipAddress: string;
  description?: string;
}

interface TopUser {
  name: string;
  department: string;
  documentCount: number;
}

interface SystemHealth {
  cpu: number;
  memory: number;
  storage: number;
}

interface PeriodOption {
  label: string;
  value: string;
}

@Component({
  selector: 'app-stats',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    ChartModule,
    KnobModule,
    TableModule,
    ButtonModule,
    AutoCompleteModule, // Changed from DropdownModule
    ProgressBarModule,
    TagModule,
    AvatarModule,
    DialogModule,
    ToastModule,
    IconFieldModule,
    InputIconModule,
    InputTextModule,
    TooltipModule,
    ThemeSwitcher
  ],
  providers: [MessageService],
  templateUrl: './stats.html',
  styleUrls: ['./stats.css']
})
export class Stats implements OnInit {

  // Statistics Data
  totalUsers = 1245;
  totalDocuments = 8456;
  totalFolders = 623;
  storageUsed = 156.7;
  storagePercentage = 78;

  // Growth Percentages
  userGrowthPercentage = 12;
  documentGrowthPercentage = 24;
  folderGrowthPercentage = 18;

  // Chart Data
  activityChartData: any;
  activityChartOptions: any;
  documentTypesData: any;
  documentTypesOptions: any;

  // Period Selection with AutoComplete
  selectedPeriod: PeriodOption | null = null;
  filteredPeriodOptions: PeriodOption[] = [];
  periodOptions: PeriodOption[] = [
    { label: 'Cette semaine', value: 'week' },
    { label: 'Ce mois', value: 'month' },
    { label: 'Ce trimestre', value: 'quarter' },
    { label: 'Cette année', value: 'year' },
    { label: 'Les 7 derniers jours', value: 'last7days' },
    { label: 'Les 30 derniers jours', value: 'last30days' },
    { label: 'Les 90 derniers jours', value: 'last90days' },
    { label: 'Personnalisé', value: 'custom' }
  ];

  // Recent Activities
  recentActivities: Activity[] = [];
  loadingActivities = false;
  totalActivities = 0;
  searchTerm = '';
  selectedActivity: Activity | null = null;
  activityDetailsDialog = false;

  // System Health
  systemHealth: SystemHealth = {
    cpu: 45,
    memory: 67,
    storage: 78
  };

  // Top Users
  topUsers: TopUser[] = [
    { name: 'Chedly Rebai', department: 'IT', documentCount: 156 },
    { name: 'Marie Martin', department: 'RH', documentCount: 134 },
    { name: 'Pierre Bernard', department: 'Finance', documentCount: 98 },
    { name: 'Sophie Dubois', department: 'Marketing', documentCount: 87 },
    { name: 'Lucas Moreau', department: 'Opérations', documentCount: 76 }
  ];

  constructor(private messageService: MessageService) {
    // Set default period
    this.selectedPeriod = this.periodOptions[0];
  }

  ngOnInit() {
    this.initializeCharts();
    this.loadRecentActivities();
  }

  initializeCharts() {
    // Activity Chart
    this.activityChartData = {
      labels: ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'],
      datasets: [
        {
          label: 'Documents créés',
          data: [12, 19, 3, 5, 2, 3, 9],
          borderColor: '#3B82F6',
          backgroundColor: 'rgba(59, 130, 246, 0.1)',
          tension: 0.4,
          fill: true
        },
        {
          label: 'Documents consultés',
          data: [25, 39, 20, 31, 56, 45, 38],
          borderColor: '#10B981',
          backgroundColor: 'rgba(16, 185, 129, 0.1)',
          tension: 0.4,
          fill: true
        }
      ]
    };

    this.activityChartOptions = {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          position: 'top'
        }
      },
      scales: {
        y: {
          beginAtZero: true,
          grid: {
            color: 'rgba(0,0,0,0.1)'
          }
        },
        x: {
          grid: {
            display: false
          }
        }
      }
    };

    // Document Types Chart
    this.documentTypesData = {
      labels: ['PDF', 'Word', 'Excel', 'PowerPoint', 'Images', 'Autres'],
      datasets: [
        {
          data: [45, 25, 15, 8, 5, 2],
          backgroundColor: [
            '#EF4444',
            '#3B82F6',
            '#10B981',
            '#F59E0B',
            '#8B5CF6',
            '#6B7280'
          ],
          borderWidth: 0
        }
      ]
    };

    this.documentTypesOptions = {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          position: 'bottom'
        }
      }
    };
  }

  loadRecentActivities() {
    this.loadingActivities = true;
    
    // Mock data
    setTimeout(() => {
      this.recentActivities = [
        {
          id: 1,
          userName: 'Chedly Rebai',
          userEmail: 'jean.dupont@company.com',
          action: 'Document créé',
          type: 'Creation',
          timestamp: '2024-12-06T10:30:00',
          ipAddress: '192.168.1.100',
          description: 'Création du document "Rapport mensuel.pdf"'
        },
        {
          id: 2,
          userName: 'Marie Martin',
          userEmail: 'marie.martin@company.com',
          action: 'Dossier partagé',
          type: 'Partage',
          timestamp: '2024-12-06T09:45:00',
          ipAddress: '192.168.1.101',
          description: 'Partage du dossier "Projets 2024" avec l\'équipe'
        },
        {
          id: 3,
          userName: 'Pierre Bernard',
          userEmail: 'pierre.bernard@company.com',
          action: 'Document supprimé',
          type: 'Suppression',
          timestamp: '2024-12-06T08:15:00',
          ipAddress: '192.168.1.102',
          description: 'Suppression du document "Brouillon.docx"'
        }
      ];
      this.totalActivities = 150;
      this.loadingActivities = false;
    }, 1000);
  }

  // AutoComplete methods for period selection
  searchPeriod(event: any) {
    const query = event.query.toLowerCase();
    this.filteredPeriodOptions = this.periodOptions.filter(option => 
      option.label.toLowerCase().includes(query)
    );
  }

  onPeriodSelect(event: any) {
    this.selectedPeriod = event;
    this.updateChartsForPeriod(event.value);
    this.messageService.add({
      severity: 'info',
      summary: 'Période mise à jour',
      detail: `Affichage des données pour: ${event.label}`
    });
  }

  onPeriodClear() {
    this.selectedPeriod = null;
    this.updateChartsForPeriod('week'); // Default to week
  }

  private updateChartsForPeriod(period: string) {
    // Update chart data based on selected period
    switch (period) {
      case 'week':
        this.updateWeeklyChartData();
        break;
      case 'month':
        this.updateMonthlyChartData();
        break;
      case 'quarter':
        this.updateQuarterlyChartData();
        break;
      case 'year':
        this.updateYearlyChartData();
        break;
      default:
        this.updateWeeklyChartData();
    }
  }

  private updateWeeklyChartData() {
    this.activityChartData = {
      ...this.activityChartData,
      labels: ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'],
      datasets: [
        {
          ...this.activityChartData.datasets[0],
          data: [12, 19, 3, 5, 2, 3, 9]
        },
        {
          ...this.activityChartData.datasets[1],
          data: [25, 39, 20, 31, 56, 45, 38]
        }
      ]
    };
  }

  private updateMonthlyChartData() {
    this.activityChartData = {
      ...this.activityChartData,
      labels: ['S1', 'S2', 'S3', 'S4'],
      datasets: [
        {
          ...this.activityChartData.datasets[0],
          data: [45, 52, 38, 67]
        },
        {
          ...this.activityChartData.datasets[1],
          data: [120, 145, 98, 156]
        }
      ]
    };
  }

  private updateQuarterlyChartData() {
    this.activityChartData = {
      ...this.activityChartData,
      labels: ['Jan', 'Fév', 'Mar'],
      datasets: [
        {
          ...this.activityChartData.datasets[0],
          data: [156, 189, 167]
        },
        {
          ...this.activityChartData.datasets[1],
          data: [456, 523, 489]
        }
      ]
    };
  }

  private updateYearlyChartData() {
    this.activityChartData = {
      ...this.activityChartData,
      labels: ['T1', 'T2', 'T3', 'T4'],
      datasets: [
        {
          ...this.activityChartData.datasets[0],
          data: [512, 623, 567, 689]
        },
        {
          ...this.activityChartData.datasets[1],
          data: [1456, 1623, 1489, 1756]
        }
      ]
    };
  }

  onSearchActivity(event: any) {
    // Implement search functionality
    console.log('Searching:', this.searchTerm);
  }

  loadActivities(event: any) {
    // Implement lazy loading
    console.log('Loading activities:', event);
  }

  viewActivityDetails(activity: Activity) {
    this.selectedActivity = activity;
    this.activityDetailsDialog = true;
  }

  exportActivity() {
    this.messageService.add({
      severity: 'info',
      summary: 'Export',
      detail: 'Export de l\'activité en cours...'
    });
  }

  performBackup() {
    this.messageService.add({
      severity: 'success',
      summary: 'Sauvegarde',
      detail: 'Sauvegarde lancée avec succès'
    });
  }

  cleanupSystem() {
    this.messageService.add({
      severity: 'warn',
      summary: 'Nettoyage',
      detail: 'Nettoyage du système en cours...'
    });
  }

  generateReport() {
    this.messageService.add({
      severity: 'info',
      summary: 'Rapport',
      detail: 'Génération du rapport en cours...'
    });
  }

  viewLogs() {
    this.messageService.add({
      severity: 'info',
      summary: 'Logs',
      detail: 'Consultation des logs...'
    });
  }

  getInitials(name: string): string {
    return name
      .split(' ')
      .map(word => word.charAt(0))
      .join('')
      .toUpperCase()
      .slice(0, 2);
  }

  getActivitySeverity(type: string): string {
    switch (type) {
      case 'Creation':
        return 'success';
      case 'Suppression':
        return 'danger';
      case 'Modification':
        return 'warning';
      case 'Partage':
        return 'info';
      default:
        return 'secondary';
    }
  }
}