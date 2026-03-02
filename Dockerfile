FROM n8nio/n8n:latest

# ----------------------------
# Environment variables
# ----------------------------
ENV NODE_ENV=production \
    DB_TYPE=sqlite \
    DB_SQLITE_DATABASE=/home/node/.n8n/database.sqlite \
    N8N_HOST=0.0.0.0 \
    N8N_PORT=5678 \
    N8N_PROTOCOL=http \
    WEBHOOK_URL=https://your-render-service-name.onrender.com/ \
    GENERIC_TIMEZONE=UTC \
    N8N_SECURE_COOKIE=false \
    N8N_BASIC_AUTH_ACTIVE=false \
    N8N_ENCRYPTION_KEY=my-simple-key-123

# ----------------------------
# Fix permissions
# ----------------------------
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node

# ----------------------------
# Expose port
# ----------------------------
EXPOSE 5678

# ENTRYPOINT is inherited from n8n image
