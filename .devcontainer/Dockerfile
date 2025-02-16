# Base Image
FROM mcr.microsoft.com/devcontainers/python:3.9

# Install System Dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Install Python Dependencies
COPY ../requirements.txt /workspace/
RUN pip install --no-cache-dir -r requirements.txt
