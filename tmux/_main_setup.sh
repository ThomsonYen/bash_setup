#!/bin/bash

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo "tmux could not be found"
    echo "Please install tmux and rerun this script."
    exit 1
else
    echo "Confirm tmux is installed."
fi

# Change executation location to script's directory
cd "$(dirname "$0")" || exit 1

echo "Setting up tmux configuration..."
mkdir ~/.shell_setup
cp tmux_setup.sh ~/.shell_setup/tmux_setup.sh
echo "source ~/.shell_setup/tmux_setup.sh" >> ~/.zshrc

# Avoid collision with existing .tmux.conf
if [ -f ~/.tmux.conf ]; then
    echo "Backing up existing .tmux.conf to .tmux.conf.bak"
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi

echo "Copying .tmux.conf to home directory..."
cp ./.tmux.conf ~/.tmux.conf
