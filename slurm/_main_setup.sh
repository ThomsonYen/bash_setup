#!/bin/bash

# Change executation location to script's directory
cd "$(dirname "$0")" || exit 1

# Make shell_setup directory if it doesn't exist
if [ ! -d ~/.shell_setup ]; then
    mkdir ~/.shell_setup
fi

cp slurm_setup.sh ~/.shell_setup/slurm_setup.sh
echo "source ~/.shell_setup/slurm_setup.sh" >> ~/.zshrc
