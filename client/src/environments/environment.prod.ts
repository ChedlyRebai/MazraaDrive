export interface Environment {
  API_URL: string;
  AUTH_URL: string;
}
export const environment = {
  production: true,
  apiUrl: '__API_URL__',
  authUrl: '__AUTH_URL__',
};
