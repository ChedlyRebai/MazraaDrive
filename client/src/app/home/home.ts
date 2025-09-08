import { CommonModule } from '@angular/common';
import { Component, computed, inject, OnInit } from '@angular/core';
import { RouterModule, RouterOutlet } from '@angular/router';
import { PrimeNG } from 'primeng/config';
import { DomHandler } from 'primeng/dom';
import { Avatar } from 'primeng/avatar';
import { SharedModule } from '../shared/shared.module';
import { UserService } from '../core/services/user-service';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule, RouterOutlet, RouterModule, Avatar, SharedModule],
  templateUrl: './home.html',
  styleUrl: './home.css',
})
export class Home implements OnInit {
  //configService: AppConfigService = inject(AppConfigService);
  constructor(private userService: UserService) {}
  primeng: PrimeNG = inject(PrimeNG);

  //isNewsActive = computed(() => this.configService.newsActive());

  //isMenuActive = computed(() => this.configService.appState().menuActive);

  isRippleDisabled = computed(() => this.primeng.ripple());

  containerClass = computed(() => {
    return {
      //   'layout-news-active': this.isNewsActive()
      // 'p-ripple-disabled': this.isRippleDisabled,
    };
  });

  ngOnInit(): void {
    this.getCurrentUser();
  }
  hideMenu() {
    //this.configService.hideMenu();
    DomHandler.unblockBodyScroll('blocked-scroll');
  }
  mobileMenuOpen = false;
  pageTitle = 'Accueil';
  currentUser = {
    id: "",
    departmentId: 0,
    role: "",
    name: "",
    avatar: "/assets/avatar.png"
  };
  navLinks: {
    label: string;
    path: string;
    icon: string;
    badge?: string | number;
  }[] = [
    { label: 'Accueil', path: '/home/accueil', icon: 'pi pi-home' },
    { label: 'Documents', path: '/home/documents', icon: 'pi pi-file' },
    { label: 'Demandes', path: '/home/demandes', icon: 'pi pi-inbox' },
    { label: 'Access', path: '/home/access', icon: 'pi pi-lock' },
    { label: 'Admin', path: '/admin', icon: 'pi pi-cog' },
  ];

  getCurrentUser() {
    this.userService.getCurrentUser().subscribe((user: any) => {
      console.log("current user:",user);
      this.currentUser = {
        id: user.id,
        departmentId: user.departmentId,
        name: user.name,
        role: user.role,
        avatar: user.avatar || '/assets/avatar.png',
      };
    });
  }


   getInitials(name: string) {
    return (name || '')
      .split(' ')
      .filter((p) => p)
      .slice(0, 2)
      .map((p) => p[0]?.toUpperCase())
      .join('');
  }

  logout() {}
}
