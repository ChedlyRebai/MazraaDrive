import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Demandes } from './demandes/demandes';
import { Documents } from './documents/documents';
import { Home } from './home';

const routes: Routes = [  
  {
    path: '', loadComponent: () => import('./home').then(m => m.Home), children: [
      { path: 'demandes', loadComponent: () => import('./demandes/demandes').then(m => m.Demandes) },
      { path: 'documents', loadComponent: () => import('./documents/documents').then(m => m.Documents) },
      { path: 'document-search', loadComponent: () => import('./document-recherche/document-recherche').then(m => m.DocumentRecherche) }
    ]
  },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HomeRoutingModule { }
