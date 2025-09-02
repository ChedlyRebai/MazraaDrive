import { MessageService } from 'primeng/api';
import { Component } from '@angular/core';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { PasswordModule } from 'primeng/password';
import { CheckboxModule } from 'primeng/checkbox';
import { CardModule } from 'primeng/card';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../core/services/auth-service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [
    ButtonModule,
    InputTextModule,
    PasswordModule,
    CheckboxModule,
    CardModule,
    FormsModule,
  ],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css',
})
export class LoginComponent {
  email: string = '';
  password: string = '';
  cin: string = '';
  rememberMe: boolean = false;
  constructor(
    private authService: AuthService,
    private messageService: MessageService
  ) {}
  onSubmit() {
    this.authService
      .login({ Password: this.password, Cin: this.cin })
      .subscribe(
        (res: any) => {
          // To access cookies from response headers
          const cookies =
            res.headers?.get('set-cookie') || res.headers?.get('Set-Cookie');
          console.log('Cookies:', cookies);
          console.log('Login successful:');
          console.log(res);
          this.messageService.add({
            severity: 'success',
            summary: 'Success',
            detail: 'Login successful',
          });
          window.location.href = '/home/accueil';
        },
        (error) => {
          this.messageService.add({
            severity: 'error',
            summary: 'Error',
            detail: 'Login failed',
          });
          console.error('Login failed:', error);
        }
      );
  }
}
