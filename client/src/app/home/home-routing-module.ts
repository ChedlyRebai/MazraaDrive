import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Demandes } from './demandes/demandes';
import { Documents } from './documents/documents';
import { Home } from './home';
import { Accueil } from './accueil/accueil';
import { FolderDetails } from './folder-details/folder-details';
import { FileViewer } from './file-viewer/file-viewer';
import { DocumentRecherche } from './document-recherche/document-recherche';
import { Access } from './access/access';

const routes: Routes = [
  {
    path: '',

    loadComponent() {
      return import('./home').then((m) => m.Home);
    },
    children: [
      {
        path: 'demandes',
        loadComponent() {
          return import('./demandes/demandes').then((m) => m.Demandes);
        },
      },
      {
        path: 'accueil',
        loadComponent() {
          return import('./accueil/accueil').then((m) => m.Accueil);
        },
      },
      {
        path: 'chat',
        loadComponent() {
          return import('./chat-doc/chat-doc').then((m) => m.ChatDoc);
        },
      },
      {
        path: 'documents',
        loadComponent() {
          return import('./documents/documents').then((m) => m.Documents);
        },
      },
      {
        path: 'access',
        loadComponent() {
          return import('./access/access').then((m) => m.Access);
        },
      },
      {
        path: 'folder/:id',
        loadComponent() {
          return import('./folder-details/folder-details').then(
            (m) => m.FolderDetails
          );
        },
      },
      {
        path: 'file/:id',
        loadComponent() {
          return import('./file-viewer/file-viewer').then((m) => m.FileViewer);
        },
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
