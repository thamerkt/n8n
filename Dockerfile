FROM n8nio/n8n:latest

# Environment variables using your Render PostgreSQL database
ENV NODE_ENV=production \
    DB_TYPE=postgresdb \
    DB_POSTGRESDB_HOST=dpg-d6b453bnv86c73cvadn0-a \
    DB_POSTGRESDB_PORT=5432 \
    DB_POSTGRESDB_DATABASE=database_uzyd \
    DB_POSTGRESDB_USER=database_uzyd_user \
    DB_POSTGRESDB_PASSWORD=um6h8byTSUVPmk3bETljJNmMmT01Rljd \
    N8N_HOST=0.0.0.0 \
    N8N_PORT=5678 \
    N8N_PROTOCOL=http \
    WEBHOOK_URL=https://your-render-service-name.onrender.com/ \
    GENERIC_TIMEZONE=UTC \
    N8N_SECURE_COOKIE=false \
    N8N_BASIC_AUTH_ACTIVE=false

# Fix permissions
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

USER node

EXPOSE 5678
