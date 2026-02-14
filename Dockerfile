# Use official n8n image
FROM n8nio/n8n:latest

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV NODE_ENV=production
ENV N8N_PROTOCOL=http

# Optional: set timezone
ENV GENERIC_TIMEZONE=Africa/Tunis
ENV TZ=Africa/Tunis

# Create directory for persistent data
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Switch back to node user (required by n8n)
USER node

# Expose port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
