import { NgModule } from '@angular/core';
import { bootstrapApplication } from '@angular/platform-browser';
import { provideRouter, RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';

export const routes: Routes = [
  { 
    path: 'login', 
    loadComponent: () => import('./auth/login/login.component').then(m => m.LoginComponent) 
  },
  {
    path:'admin',
    loadChildren: () => import('./admin/admin-module').then(m => m.AdminModule)
  },
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'logs', loadChildren: () => import('./admin/logs/logs-module').then(m => m.LogsModule) },
 
];




@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
