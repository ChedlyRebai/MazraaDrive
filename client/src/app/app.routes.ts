import { Routes } from '@angular/router';
import { authGuard } from './core/guards/auth-guard';
import { adminGuard } from './core/guards/admin-guard';

export const routes: Routes = [
  {
    path: 'home',
    loadChildren: () =>
      import('./home/home-routing-module').then((m) => m.HomeRoutingModule),
    canActivate: [authGuard],
  },
  {
    path: 'admin',
    loadChildren: () =>
      import('./admin/admin-routing-module').then((m) => m.AdminRoutingModule),
    canActivate: [adminGuard],
  },
  {
    path: 'login',
    loadChildren: () =>
      import('./auth/auth-routing.module').then((m) => m.AuthRoutingModule),
  },
  {
    path: '',
    redirectTo: '/login',
    pathMatch: 'full',
  },
  {
    path: '**',
    loadComponent: () =>
      import('./core/not-found/not-found').then((m) => m.NotFound),
  },
];
