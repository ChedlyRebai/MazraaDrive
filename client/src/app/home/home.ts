
import { CommonModule } from '@angular/common';
import { Component, computed, inject } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { PrimeNG } from 'primeng/config';
import { DomHandler } from 'primeng/dom';

@Component({
  selector: 'app-home',
  standalone: true, 
  imports: [CommonModule, RouterOutlet], 
  templateUrl: './home.html',
  styleUrl: './home.css'
})
export class Home {
   //configService: AppConfigService = inject(AppConfigService);

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

    hideMenu() {
        //this.configService.hideMenu();
        DomHandler.unblockBodyScroll('blocked-scroll');
    }
}
