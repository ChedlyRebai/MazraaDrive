import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LogsRoutingModule } from './logs-routing-module';
import { AiLogs } from './ai-logs/ai-logs';

import { RouterModule } from '@angular/router';



@NgModule({
  declarations: [
   
  ],
  imports: [
    AiLogs,

    CommonModule,
    RouterModule,
    LogsRoutingModule
  ]
})
export class LogsModule { }
