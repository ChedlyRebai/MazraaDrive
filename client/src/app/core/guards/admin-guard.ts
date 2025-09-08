import { CanActivateFn } from '@angular/router';
import { AuthService } from '../services/auth-service';
import { inject } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import { jwtDecode } from 'jwt-decode';
export const adminGuard: CanActivateFn = (route, state) => {
  const authService = inject(AuthService);
  const cookiesService = inject(CookieService);
  const token = cookiesService.get('token');
  const decodedToken = jwtDecode(token)
  console.log("decode:",decodedToken);
  console.log(token);
  if (!token) return false;
  return authService
    .validateToken(token)
    .toPromise()
    .then((res) => res.valid);
};
