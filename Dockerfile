FROM n8nio/n8n:1.72.1

USER root

# Make sure correct directory permissions
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

USER node

EXPOSE 5678
