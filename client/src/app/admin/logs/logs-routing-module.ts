import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {path: 'ai-logs', loadComponent: () => import('./ai-logs/ai-logs').then(m => m.AiLogs)},
  {path: 'action-logs', loadComponent: () => import('./action-logs/action-logs').then(m => m.ActionLogs)},

  // Add more log routes as needed

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LogsRoutingModule { }
