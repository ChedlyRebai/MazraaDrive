import { CanActivateFn } from '@angular/router';
import { AuthService } from '../services/auth-service';
import { inject } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import { jwtDecode } from 'jwt-decode';
import { AdminsRoles } from '../../shared/Utils';

interface MyJwtPayload {
  role: string;
  id: string;
  departmentId: number;
  name: string;
  exp: number;
  iat: number;
}

export const adminGuard: CanActivateFn = (route, state) => {
  const authService = inject(AuthService);
  const cookiesService = inject(CookieService);
  const token = cookiesService.get('token');
  const decodedToken = jwtDecode<MyJwtPayload>(token);
  console.log("decode:",decodedToken);
  console.log(token);
  if (!token) return false;
  if( AdminsRoles.includes(decodedToken.role) ) return true;
  return authService
    .validateToken(token)
    .toPromise()
    .then((res) => res.valid);
};
