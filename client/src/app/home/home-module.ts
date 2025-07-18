import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HomeRoutingModule } from './home-routing-module';
import { RouterModule } from '@angular/router';
import { Home } from './home';
import { Demandes } from './demandes/demandes';
import { Documents } from './documents/documents';


@NgModule({
  declarations: [
  ],
  imports: [
    CommonModule,
    HomeRoutingModule,
    RouterModule
  ]
})
export class HomeModule { }
