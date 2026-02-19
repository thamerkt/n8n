FROM n8nio/n8n:latest

# Set environment variables
ENV NODE_ENV=production \
    DB_TYPE=postgresdb \
    DB_POSTGRESDB_HOST=postgres \
    DB_POSTGRESDB_PORT=5432 \
    DB_POSTGRESDB_DATABASE=n8n \
    DB_POSTGRESDB_USER=n8n \
    DB_POSTGRESDB_PASSWORD=n8n_pass \
    QUEUE_BULL_REDIS_HOST=redis \
    QUEUE_BULL_REDIS_PORT=6379 \
    N8N_HOST=localhost \
    N8N_PORT=5678 \
    N8N_PROTOCOL=http \
    WEBHOOK_URL=http://localhost:5678/ \
    GENERIC_TIMEZONE=UTC

# Create data directory
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Switch back to node user
USER node

# Expose port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
