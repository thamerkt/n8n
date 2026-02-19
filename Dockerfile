FROM n8nio/n8n:latest

# Use DATABASE_URL directly (Render recommended method)
ENV NODE_ENV=production \
    DB_TYPE=postgresdb \
    DATABASE_URL=postgresql://database_uzyd_user:um6h8byTSUVPmk3bETljJNmMmT01Rljd@dpg-d6b453bnv86c73cvadn0-a/database_uzyd \
    DB_POSTGRESDB_SSL_ENABLED=true \
    DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false \
    N8N_HOST=0.0.0.0 \
    N8N_PORT=5678 \
    N8N_PROTOCOL=http \
    WEBHOOK_URL=https://your-render-service-name.onrender.com/ \
    GENERIC_TIMEZONE=UTC \
    N8N_SECURE_COOKIE=false \
    N8N_BASIC_AUTH_ACTIVE=false \
    N8N_ENCRYPTION_KEY=my-simple-key-123

# Fix permissions
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

USER node

EXPOSE 5678
