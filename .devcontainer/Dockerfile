# Use a base Python image
FROM mcr.microsoft.com/devcontainers/python:3.9

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspaces/galactic-whale

