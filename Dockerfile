# Use a build argument for the n8n version (default: latest)
ARG N8N_VERSION="latest"
FROM n8nio/n8n:${N8N_VERSION}

# Switch to root to install additional packages
USER root

# Set the npm global prefix to /usr/local so that global packages go to /usr/local/lib/node_modules
RUN npm config set prefix /usr/local

# Install global-agent globally with minimal flags
RUN npm install -g global-agent --no-save --no-package-lock --no-audit --no-fund

# Set NODE_PATH & NODE_OPTIONS for global-agent
ENV NODE_PATH=/usr/local/lib/node_modules
ENV NODE_OPTIONS="--require global-agent/bootstrap"

# Switch back to node user
USER node
