import { HttpInterceptorFn } from '@angular/common/http';

export const authInterceptor: HttpInterceptorFn = (req, next) => {

  const token = document.cookie.match('token');
  console.log('token+++++++++++++++++++++++++++++',token);
  if(token){
    req = req.clone({
      setHeaders:{
        Authorization: `Bearer ${token}`
      },
      withCredentials:true
    })
  }else{
    req = req.clone({
      withCredentials:true
    })
  }
  return next(req);
};


