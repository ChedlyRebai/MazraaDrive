import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Demandes } from './demandes/demandes';
import { Documents } from './documents/documents';

const routes: Routes = [
  {path: 'demandes', component: Demandes  },
  {path:'documents', component:Documents}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HomeRoutingModule { }
