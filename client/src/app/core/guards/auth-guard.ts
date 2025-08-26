import { CanActivateFn } from '@angular/router';
import { AuthService } from '../services/auth-service';
import { inject } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
export const authGuard: CanActivateFn = (route, state) => {
  const authService = inject(AuthService);
  const cookiesService = inject(CookieService);
  const token = cookiesService.get('token');
  console.log(token);
  if (!token) return false;
  return authService
    .validateToken(token)
    .toPromise()
    .then((res) => res.valid);
};
