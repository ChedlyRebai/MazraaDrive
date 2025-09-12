
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
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
        path: 'notifications',
        loadComponent() {
          return import('./notifications/notifications').then((m) => m.Notifications);
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
        async loadComponent() {
          const m = await import('./chat-doc/chat-doc');
          return m.ChatDoc;
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
        path: 'doc-access/:token',
        loadComponent() {
          return import('./document-access/document-access').then(
            (m) => m.DocumentAccess
          );
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
