FROM node:22-bookworm-slim

WORKDIR /work

COPY . .

RUN chmod +x build.sh

RUN npm install -g @devcontainers/cli

# Install Docker CLI
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*