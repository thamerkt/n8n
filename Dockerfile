FROM n8nio/n8n:latest

# Environment variables (simple, not secure)
ENV NODE_ENV=production \
    DB_TYPE=postgresdb \
    DB_POSTGRESDB_HOST=postgres \
    DB_POSTGRESDB_PORT=5432 \
    DB_POSTGRESDB_DATABASE=n8n \
    DB_POSTGRESDB_USER=n8n \
    DB_POSTGRESDB_PASSWORD=n8n_pass \
    N8N_HOST=0.0.0.0 \
    N8N_PORT=5678 \
    N8N_PROTOCOL=http \
    WEBHOOK_URL=http://localhost:5678/ \
    GENERIC_TIMEZONE=UTC \
    N8N_SECURE_COOKIE=false \
    N8N_BASIC_AUTH_ACTIVE=false

# ensure correct permissions
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

USER node

EXPOSE 5678

# DO NOT add CMD or ENTRYPOINT
# Let the base image handle startup
