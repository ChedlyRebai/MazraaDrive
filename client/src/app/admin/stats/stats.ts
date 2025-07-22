


import { ChangeDetectorRef, Component, CUSTOM_ELEMENTS_SCHEMA, inject, NO_ERRORS_SCHEMA, OnInit, PLATFORM_ID } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StarFillIcon } from 'primeng/icons/starfill';
import { StarIcon } from 'primeng/icons/star';


// PrimeNG Imports
import { ChartModule } from 'primeng/chart';
import { KnobModule } from 'primeng/knob';
import { SelectModule } from 'primeng/select';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { RatingModule } from 'primeng/rating';
import { TagModule } from 'primeng/tag';
import { PaginatorModule } from 'primeng/paginator';
import { TooltipModule } from 'primeng/tooltip';
import { ChevronDownIcon } from 'primeng/icons/chevrondown';
// Chart.js Types
import { ChartOptions, ChartData } from 'chart.js';
import { ThemeSwitcher } from '../themeswitcher';

// Data Interfaces
interface StatsData {
  label: string;
  value: string | number;
  change: string;
  changeType: 'positive' | 'negative';
  icon?: string;
  chartData?: any;
}

interface Product {
  id?: string;
  name?: string;
  category?: string;
  price?: number;
  rating?: number;
  status?: string;
  inventoryStatus?: string;
  image?: string;
}

interface SelectOption {
  label: string;
  value: string;
}



@Component({
  selector: 'app-stats',
  standalone: true,
  schemas: [CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA],
  imports: [
    StarFillIcon,
    StarIcon,

    ChevronDownIcon,
    CommonModule,
    // PrimeNG Modules
    ChartModule,
    ThemeSwitcher,
    KnobModule,
    ChevronDownIcon,
    SelectModule,
    StarFillIcon,
    StarIcon,
    TableModule,
    ButtonModule,
    InputTextModule,
    IconFieldModule,
    InputIconModule,
    RatingModule,
    TagModule,
    PaginatorModule,
    TooltipModule
  ],
  templateUrl: './stats.html',
  styleUrl: './stats.css'
})
export class Stats implements OnInit {
  // Chart Data
  revenueChartData: ChartData = {
    datasets: [
      {
        label: 'Revenue',
        backgroundColor: '#404040',
        borderColor: 'var(--primary-color)',
        data: [
          2100, 8400, 2400, 7300, 4300, 3200, 5400, 7400, 3400, 6200, 4500, 8200

        ]
      },
      {
        label: 'Profit',
        backgroundColor: 'c',
        borderColor: 'var(--primary-200)',
        data: [
          4200, 5400, 2400, 4300, 2300, 1200, 3400, 4400, 1400, 3200, 2500, 4200
        ]
      }
    ]
  };
  revenueChartOptions: ChartOptions = {};

  salesByCategoryData: ChartData = {
    datasets: [
      {
        data: [300, 150, 100, 80, 60],
        backgroundColor: [
          'var(--primary-500)',
          'var(--primary-400)',
          'var(--primary-300)',
          'var(--primary-200)',
          'var(--primary-100)'
        ],
        borderWidth: 0
      }
    ]
  };
  salesByCategoryOptions: ChartOptions = {};

  // Dropdown Options
  timeRangeOptions: SelectOption[] = [
    { label: 'Last Week', value: 'week' },
    { label: 'Last Month', value: 'month' },
    { label: 'Last Quarter', value: 'quarter' },
    { label: 'Last Year', value: 'year' }
  ];

  selectedTimeRange: SelectOption = this.timeRangeOptions[0];

  // Stats Widgets Data
  statsData: StatsData[] = [
    {
      label: 'Sales',
      value: 120,
      change: '+12%',
      changeType: 'positive'
    },
    {
      label: 'Revenue',
      value: '$4500',
      change: '+20%',
      changeType: 'positive'
    },
    {
      label: 'Visitors',
      value: 360,
      change: '+24%',
      changeType: 'negative'
    },
    {
      label: 'Stock',
      value: 164,
      change: '+30%',
      changeType: 'positive'
    }
  ];

  // Knob value for stock
  stockPercentage: number = 80;

  // Table Data
  recentSales: Product[] = [];
  topProducts: Product[] = [];

  // Table Columns
  columns = [
    { field: 'name', header: 'Name' },
    { field: 'category', header: 'Category' },
    { field: 'price', header: 'Price' },
    { field: 'status', header: 'Status' }
  ];

  ngOnInit() {
    this.initializeCharts();
    this.loadRecentSales();
    this.loadTopProducts();
    this.initChart();
  }

  initializeCharts() {
    // Revenue Chart Configuration
    this.revenueChartData = {
      labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
      datasets: [
        {
          label: 'Revenue',
          backgroundColor: 'var(--primary-color)',
          borderColor: 'var(--primary-color)',
          data: [2100, 8400, 2400, 7300, 4300, 3200, 5400, 7400, 3400, 6200, 4500, 8200]
        },
        {
          label: 'Profit',
          backgroundColor: 'var(--primary-200)',
          borderColor: 'var(--primary-200)',
          data: [4200, 5400, 2400, 4300, 2300, 1200, 3400, 4400, 1400, 3200, 2500, 4200]
        }
      ]
    };

    this.revenueChartOptions = {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          position: 'top'
        }
      },
      scales: {
        x: {
          grid: {
            display: false
          }
        },
        y: {
          beginAtZero: true,
          grid: {
            color: 'var(--surface-border)'
          }
        }
      }
    };

    // Sales by Category Chart Configuration
    this.salesByCategoryData = {
      labels: ['Electronics', 'Clothing', 'Accessories', 'Home & Garden', 'Sports'],
      datasets: [
        {
          data: [300, 150, 100, 80, 60],
          backgroundColor: [
            'var(--primary-500)',
            'var(--primary-400)',
            'var(--primary-300)',
            'var(--primary-200)',
            'var(--primary-100)'
          ],
          borderWidth: 0
        }
      ]
    };

    this.salesByCategoryOptions = {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          position: 'bottom',
          labels: {
            usePointStyle: true,
            padding: 20
          }
        }
      }
    };
  }

  loadRecentSales() {
    this.recentSales = [
      {
        id: '1',
        name: 'Bamboo Watch',
        category: 'Accessories',
        price: 65,
        rating: 5,
        status: 'INSTOCK',
        inventoryStatus: 'INSTOCK'
      },
      {
        id: '2',
        name: 'Black Watch',
        category: 'Accessories',
        price: 72,
        rating: 4,
        status: 'INSTOCK',
        inventoryStatus: 'INSTOCK'
      },
      {
        id: '3',
        name: 'Blue Band',
        category: 'Fitness',
        price: 79,
        rating: 3,
        status: 'LOWSTOCK',
        inventoryStatus: 'LOWSTOCK'
      },
      {
        id: '4',
        name: 'Blue T-Shirt',
        category: 'Clothing',
        price: 29,
        rating: 5,
        status: 'INSTOCK',
        inventoryStatus: 'INSTOCK'
      },
      {
        id: '5',
        name: 'Bracelet',
        category: 'Accessories',
        price: 15,
        rating: 4,
        status: 'INSTOCK',
        inventoryStatus: 'INSTOCK'
      }
    ];
  }

  loadTopProducts() {
    this.topProducts = [
      {
        id: '1',
        name: 'Bamboo Watch',
        price: 65,
        rating: 5,
        image: 'bamboo-watch.jpg'
      },
      {
        id: '2',
        name: 'Black Watch',
        price: 72,
        rating: 4,
        image: 'black-watch.jpg'
      },
      {
        id: '3',
        name: 'Blue Band',
        price: 79,
        rating: 3,
        image: 'blue-band.jpg'
      },
      {
        id: '4',
        name: 'Blue T-Shirt',
        price: 29,
        rating: 5,
        image: 'blue-t-shirt.jpg'
      },
      {
        id: '5',
        name: 'Bracelet',
        price: 15,
        rating: 4,
        image: 'bracelet.jpg'
      },
      {
        id: '6',
        name: 'Brown Purse',
        price: 120,
        rating: 4,
        image: 'brown-purse.jpg'
      }
    ];
  }

  // Chart Event Handlers
  onTimeRangeChange(event: any) {
    this.selectedTimeRange = event.value;
    // Update chart data based on selected time range
    this.updateChartData();
  }

  updateChartData() {
    // Logic to update chart data based on time range
    // This would typically make an API call to fetch new data
    console.log('Updating chart data for:', this.selectedTimeRange);
  }

  // Table Event Handlers
  onSearch(event: any) {
    // Implement search functionality
    const searchTerm = event.target.value;
    console.log('Searching for:', searchTerm);
  }

  onExport() {
    // Implement export functionality
    console.log('Exporting data...');
  }

  onProductView(product: Product) {
    // Handle product view action
    console.log('Viewing product:', product);
  }

  // Utility Methods
  getSeverity(status: string): "success" | "info" | "warn" | "danger" | "secondary" | "contrast" | undefined {
    switch (status?.toUpperCase()) {
      case 'INSTOCK':
        return 'success';
      case 'LOWSTOCK':
        return 'warn';
      case 'OUTOFSTOCK':
        return 'danger';
      default:
        return 'info';
    }
  }

  formatCurrency(value: number): string {
    return new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD'
    }).format(value);
  }

  getChangeIcon(changeType: 'positive' | 'negative'): string {
    return changeType === 'positive' ? 'pi pi-arrow-up' : 'pi pi-arrow-down';
  }

  getChangeClass(changeType: 'positive' | 'negative'): string {
    return changeType === 'positive' ? 'text-green-500' : 'text-pink-500';
  }


  data: any;

  options: any;

  platformId = inject(PLATFORM_ID);
  cd = inject(ChangeDetectorRef);

  initChart() {

    const documentStyle = getComputedStyle(document.documentElement);
    const textColor = documentStyle.getPropertyValue('--text-color');

    this.data = {
      labels: ['A', 'B', 'C'],
      datasets: [
        {
          data: [540, 325, 702],
          backgroundColor: [documentStyle.getPropertyValue('--p-cyan-500'), documentStyle.getPropertyValue('--p-orange-500'), documentStyle.getPropertyValue('--p-gray-500')],
          hoverBackgroundColor: [documentStyle.getPropertyValue('--p-cyan-400'), documentStyle.getPropertyValue('--p-orange-400'), documentStyle.getPropertyValue('--p-gray-400')]
        }
      ]
    };

    this.options = {
      plugins: {
        legend: {
          labels: {
            usePointStyle: true,
            color: textColor
          }
        }
      }
    };
    this.cd.markForCheck()
  }
}