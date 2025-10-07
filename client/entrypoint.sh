#!bin/bash

if [ -z "$API_URL" ] || [ -z "$AUTH_URL" ]; then
  echo "API_URL environment variable is not set. Using default value."
  export API_URL="http://localhost:5108/api"
  export AUTH_URL="http://localhost:5108/api"
  exit 1
else
  echo "Using API_URL from environment variable: $API_URL"
  echo "Using AUTH_URL from environment variable: $AUTH_URL"
fi

envsubst < src/environments/environment.ts > src/environments/environment.tmp.ts && \
mv src/environments/environment.tmp.ts src/environments/environment.ts

exec "$@"