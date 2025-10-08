#!/bin/bash

# Download uv if not already installed
if ! command -v uv &> /dev/null; then
    echo "uv could not be found, installing..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
else
    echo "uv is already installed."
fi

# Download gpustat
echo "Installing gpustat..."
uv tool install gpustat

# Change executation location to script's directory
cd "$(dirname "$0")" || exit 1

mkdir ~/.shell_setup

cp uv_setup.sh ~/.shell_setup/uv_setup.sh
echo "source ~/.shell_setup/uv_setup.sh" >> ~/.zshrc