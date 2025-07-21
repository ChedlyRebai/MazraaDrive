import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Admin } from './admin';
import { RoleMangement } from './role-mangement/role-mangement';
import { DocReqManagement } from './doc-req-management/doc-req-management';
import { DepartmentMangement } from './department-mangement/department-mangement';

const routes: Routes = [
  {
    path: '', component: Admin, children: [
      { path: 'role', component: RoleMangement },
      { path: 'user', component: RoleMangement },
      { path: 'document', component: RoleMangement },
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
