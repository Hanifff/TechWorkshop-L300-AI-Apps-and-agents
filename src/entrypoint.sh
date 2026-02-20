#!/bin/sh
set -e

# Write ENV_FILE_CONTENTS to .env at container startup if the variable is set.
# Secrets are never printed to logs.
if [ -n "$ENV_FILE_CONTENTS" ]; then
    printf '%s' "$ENV_FILE_CONTENTS" > /app/.env
    chmod 600 /app/.env
fi

exec "$@"
