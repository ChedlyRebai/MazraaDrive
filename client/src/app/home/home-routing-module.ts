import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Demandes } from './demandes/demandes';
import { Documents } from './documents/documents';
import { Home } from './home';
import { Accueil } from './accueil/accueil';

const routes: Routes = [  
  {
    path: '', component: Home, children: [
      { path: 'demandes', component: Demandes },
      { path: 'accueil', component: Accueil },
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
