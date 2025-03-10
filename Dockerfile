# Use a build argument for the n8n version (default: latest)
ARG N8N_VERSION="latest"
FROM n8nio/n8n:${N8N_VERSION}

# Switch to root to install additional packages
USER root

# Install global-agent into n8n's package directory and fix permissions
RUN cd /usr/local/lib/node_modules/n8n \
    && npm install --no-save --no-package-lock --no-audit --no-fund global-agent \
    && chown -R node:node .

# Switch back to node user
USER node
