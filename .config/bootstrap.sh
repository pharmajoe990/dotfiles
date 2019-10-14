#!/usr/bin/env bash

# Bootstrap a development machine
# This script will prepare a macbook for development

# Requirements:
# SSH Key generated with public key added to Github

dotfile_repo="git@github.com:pharmajoe990/dotfiles.git"
brew_file_path="${HOME}/.config/Brewfile"

# homebrew and packages/casks
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew 
brew bundle --file="brew_file_path"


# Install YADM and bring down dotfiles
brew install yadm
yadm clone $dotfile_repo

# Move ZSH config into place
mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak"
mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak"

# TODO bootstrap Neovim plugins
vim +'PlugInstall --sync' +qa
