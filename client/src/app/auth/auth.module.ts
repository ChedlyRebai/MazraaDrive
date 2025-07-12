import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AuthRoutingModule } from './auth-routing.module';
import { LoginComponent } from './login/login.component';
import { SharedModule } from '../shared/shared.module';


@NgModule({
  declarations: [
    // LoginComponent is now standalone, no longer declared here
  ],
  imports: [
    CommonModule,
    AuthRoutingModule,
    SharedModule,
    LoginComponent // Import standalone component instead of declaring
  ]
})
export class AuthModule { }
