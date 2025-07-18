import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Demandes } from './demandes/demandes';
import { Documents } from './documents/documents';
import { Home } from './home';

const routes: Routes = [
  {
    path: '', component: Home, children: [
      { path: 'demandes', loadComponent: () => import('./demandes/demandes').then(m => m.Demandes) },
      { path: 'documents', loadComponent: () => import('./documents/documents').then(m => m.Documents) },
    ]
  },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HomeRoutingModule { }
