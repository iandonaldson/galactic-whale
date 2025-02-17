#!/bin/bash

set -e  # Stop on error. 

# Define the workspace directory (GitHub Codespaces workspace location)
WORKSPACE_DIR="/workspaces/galactic-whale"

# Ensure we're in the correct directory
cd $WORKSPACE_DIR || exit

# Update and install system dependencies
echo "Updating package lists and installing required system dependencies..."
sudo apt update && sudo apt install -y \
    wget \
    unzip \
    curl \
    python3-venv \
    python3-pip 

# Set up Python virtual environment
echo "Setting up Python virtual environment..."
python3 -m venv $WORKSPACE_DIR/venv
source $WORKSPACE_DIR/venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install Python dependencies from requirements.txt
if [ -f "$WORKSPACE_DIR/requirements.txt" ]; then
    echo "Installing Python dependencies..."
    pip install -r $WORKSPACE_DIR/requirements.txt
else
    echo "No requirements.txt found, skipping dependency installation."
fi

# Verify installation
echo "Verifying installation..."
python3 --version
pip --version
spacy --version
scispacy --version
transformers --version
pdfminer.six --version
pandas --version
streamlit --version

# Ensure the environment is activated in every new shell session
echo "source $WORKSPACE_DIR/venv/bin/activate" >> ~/.bashrc

echo "Setup complete. You may need to restart the terminal or run:"
echo "source ~/.bashrc"
