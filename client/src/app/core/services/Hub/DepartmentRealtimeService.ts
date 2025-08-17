import { Injectable, inject } from '@angular/core';
import * as signalR from '@microsoft/signalr';
import { Subject } from 'rxjs';
import { environment } from '../../../../environments/environment';


export interface DepartmentDto {
  id: number;
  name: string;
  description?: string;
  userCount?: number;
}

@Injectable({ providedIn: 'root' })
export class DepartmentRealtimeService {
  private hub?: signalR.HubConnection;

  created$ = new Subject<DepartmentDto>();
  updated$ = new Subject<DepartmentDto>();
  deleted$ = new Subject<number>();

  connect() {
    if (this.hub) return;
    this.hub = new signalR.HubConnectionBuilder()
      .withUrl(environment.apiUrl.replace(/\/api\/?$/, '') + '/hubs/departments', {
        withCredentials: true
      })
      .withAutomaticReconnect()
      .build();

    this.hub.on('DepartmentCreated', d => this.created$.next(d));
    this.hub.on('DepartmentUpdated', d => this.updated$.next(d));
    this.hub.on('DepartmentDeleted', id => this.deleted$.next(id));

    this.hub.start().catch(err => console.error('SignalR error', err));
  }

  disconnect() {
    this.hub?.stop();
    this.hub = undefined;
  }
}