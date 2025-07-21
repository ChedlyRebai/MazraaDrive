import { Routes } from '@angular/router';

export const routes: Routes = [
  { path: 'home', loadChildren: () => import('./home/home-routing-module').then(m => m.HomeRoutingModule) },
  { path: 'admin', loadChildren: () => import('./admin/admin-routing-module').then(m => m.AdminRoutingModule) },
  { 
    path: 'auth', 
    loadChildren: () => import('./auth/auth-routing.module').then(m => m.AuthRoutingModule) 
  },


  
  { path: '**', redirectTo: '/login' }
];
