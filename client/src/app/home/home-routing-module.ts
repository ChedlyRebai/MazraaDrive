import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Demandes } from './demandes/demandes';
import { Documents } from './documents/documents';
import { Home } from './home';
import { Accueil } from './accueil/accueil';
import { FolderDetails } from './folder-details/folder-details';
import { FileViewer } from './file-viewer/file-viewer';
import { DocumentRecherche } from './document-recherche/document-recherche';

const routes: Routes = [
  {
    path: '',
    loadComponent() {
      return import('./home').then((m) => m.Home);
    },
    children: [
      { path: 'demandes', component: Demandes },
      { path: 'accueil', component: Accueil },
      {
        path: 'documents',
       component: Documents,
      },
      {
        path: 'folder/:id',
        component: FolderDetails,
      },
      {
        path: 'file/:id',
        component: FileViewer,
      },
      {
        path: 'document-search',
        component: DocumentRecherche,
       
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class HomeRoutingModule {}
