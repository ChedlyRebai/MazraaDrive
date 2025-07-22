import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Admin } from './admin';

import { DocReqManagement } from './doc-req-management/doc-req-management';
import { DepartmentMangement } from './department-mangement/department-mangement';
import { RoleManagementComponent } from './role-mangement/role-mangement';
import { UserMangement } from './user-mangement/user-mangement';
import { DocumentMangement } from './document-mangement/document-mangement';
import { Stats } from './stats/stats';

const routes: Routes = [
  {
    path: '', component: Admin, children: [
      {path:'',component:Stats},
      { path: 'role', component: RoleManagementComponent },
      { path: 'user', component: UserMangement },
      { path: 'document', component: DocumentMangement },
      { path: 'doc-req', component: DocReqManagement },
      { path: 'department', component: DepartmentMangement }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminRoutingModule { }
