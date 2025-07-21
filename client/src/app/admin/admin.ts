import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-admin',
  
  standalone: true, 
  imports: [CommonModule, RouterOutlet], 
  templateUrl: './admin.html',
  styleUrl: './admin.css'
})
export class Admin {

}
