

export interface Environment {
  API_URL: string;
  AUTH_URL: string;
}

export const environment = {
  production: false,
    apiUrl: 'http://localhost:7000/api',
  authUrl: 'http://localhost:7000/auth'
};


