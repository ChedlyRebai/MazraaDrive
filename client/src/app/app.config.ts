import { ApplicationConfig } from '@angular/core';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';
import { providePrimeNG } from 'primeng/config';
import Aura from '@primeuix/themes/aura';
import { bootstrapApplication } from '@angular/platform-browser';
//import { TableProductsDemo } from './app/table-products-demo';
import { HTTP_INTERCEPTORS, provideHttpClient, withFetch, withInterceptors } from '@angular/common/http';
import { authInterceptor } from './core/interceptors/auth-interceptor';

export const appConfig: ApplicationConfig = {
    providers: [
         provideHttpClient(withFetch()),
        provideHttpClient(
            withInterceptors([
                authInterceptor
            ]),
            withFetch() 
        ),
        provideAnimationsAsync(),
        providePrimeNG({
            theme: {
                preset: Aura,
                options: {
                    prefix: 'p',
                    darkModeSelector: 'system',
                    cssLayer: false
                }
            }
        })
    ]
};

//  bootstrapApplication(TableProductsDemo, appConfig).catch((err) =>
//     console.error(err));