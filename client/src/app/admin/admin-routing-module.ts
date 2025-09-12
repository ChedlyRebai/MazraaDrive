import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Admin } from './admin';

import { DocReqManagement } from './doc-req-management/doc-req-management';
import { DepartmentMangement } from './department-mangement/department-mangement';
import { RoleMangementComponent } from './role-mangement/role-mangement';
import { UserMangement } from './user-mangement/user-mangement';
import { DocumentMangement } from './document-mangement/document-mangement';
import { Stats } from './stats/stats';
import { AccessRequest } from './access-request/access-request';

const routes: Routes = [
  {
    path: '',
    loadComponent: () => import('./admin').then((m) => m.Admin),
    children: [
      { path: 'access-req', component: AccessRequest },

      { path: 'stats', component: Stats },
      {
        path: 'role',
        loadComponent: () =>
          import('./role-mangement/role-mangement').then(
            (m) => m.RoleMangementComponent
          ),
      },
      {
        path: 'user',
        loadComponent: () =>
          import('./user-mangement/user-mangement').then(
            (m) => m.UserMangement
          ),
      },
      {
        path: 'document',
        loadComponent: () =>
          import('./document-mangement/document-mangement').then(
            (m) => m.DocumentMangement
          ),
      },
      {
        path: 'doc-req',
        loadComponent: () =>
          import('./doc-req-management/doc-req-management').then(
            (m) => m.DocReqManagement
          ),
      },
      {
        path: 'department',
        loadComponent: () =>
          import('./department-mangement/department-mangement').then(
            (m) => m.DepartmentMangement
          ),
      },
      {
        path: 'folders',
        loadComponent: () =>
          import('./folders-management/folders-management').then((m) => m.FoldersManagement),
      },
      {
        path: 'permissions',
        loadComponent: () =>
          import('./pemission/pemission').then((m) => m.Pemission),
      },
      {
        path: 'logs',
        loadChildren: () =>
          import('./logs/logs-module').then((m) => m.LogsModule),
      },
      { path: '**', redirectTo: 'stats' },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class AdminRoutingModule {}
