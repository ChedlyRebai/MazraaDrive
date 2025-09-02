export interface LoginDTO {
 
  Cin:string;
  Password: string;
}

export interface ResetPasswordDTO extends LoginDTO {
  token: string;
}
export interface RegisterDTO extends LoginDTO {
  Username: string;
  DepartmentId: number;
}

export interface ActiveAccountDTO {
  Email: string;
  Token: string;
}
