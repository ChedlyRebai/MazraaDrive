export interface Environment {
  API_URL: string;
  AUTH_URL: string;
}

export const environment = {
  apiUrl: '${API_URL}',
  authUrl: '${AUTH_URL}',
};


