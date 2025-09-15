#!/bin/bash

# Change execution location to script's directory
cd "$(dirname "$0")" || exit 1

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set my_zshrc.sh as the main zsh configuration file
if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
    echo "Existing .zshrc file backed up as .zshrc.backup"
fi

ln -s "$(pwd)/my_zshrc.sh" "$HOME/.zshrc"
