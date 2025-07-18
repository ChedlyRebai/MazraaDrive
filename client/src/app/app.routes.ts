import { Routes } from '@angular/router';

export const routes: Routes = [
  { path: 'home', loadChildren: () => import('./home/home-routing-module').then(m => m.HomeRoutingModule) },
  { 
    path: 'auth', 
    loadChildren: () => import('./auth/auth-routing.module').then(m => m.AuthRoutingModule) 
  },

  
  { path: '**', redirectTo: '/login' }
];
