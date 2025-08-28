import { Injectable } from '@angular/core';
import { jwtDecode } from "jwt-decode";

export interface JwtPayload {
  sub?: string;
  name?: string;
  email?: string;
  RoleId?: string;
  DepartmentId?: string;
  [key: string]: any; // allows other claims
}
@Injectable({
  providedIn: 'root'
})


export class JwtService {
    constructor() { }

 
  // getRoleId(token: string): string | null {
  //   const payload = this.decodeToken(token);
  //   return payload?.RoleId ?? null;
  // }

  // getDepartmentId(token: string): string | null {
  //   const payload = this.decodeToken(token);
  //   return payload?.DepartmentId ?? null;
  // }
}
