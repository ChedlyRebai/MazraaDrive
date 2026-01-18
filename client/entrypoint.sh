#!/bin/sh

# Set default values if not provided
API_URL=${API_URL:-"http://localhost:5108/api"}
AUTH_URL=${AUTH_URL:-"http://localhost:5108/api"}

echo "Using API_URL: ${API_URL}"
echo "Using AUTH_URL: ${AUTH_URL}"

# Substitute environment variables in built JavaScript files
echo "Substituting environment variables in built files..."
find /usr/share/nginx/html -name "*.js" -exec sed -i "s|__API_URL__|${API_URL}|g" {} \;
find /usr/share/nginx/html -name "*.js" -exec sed -i "s|__AUTH_URL__|${AUTH_URL}|g" {} \;

echo "Environment variables substituted successfully"

# Start nginx
echo "Starting nginx..."
exec nginx -g 'daemon off;'