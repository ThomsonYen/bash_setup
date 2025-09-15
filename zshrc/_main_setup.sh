#!/bin/bash

# Change execution location to script's directory
cd "$(dirname "$0")" || exit 1

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set ZSH_CUSTOM to the specific cache directory
echo 'export ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump"' >> $HOME/.zshrc

# Change scheme
bash ./change_theme.sh