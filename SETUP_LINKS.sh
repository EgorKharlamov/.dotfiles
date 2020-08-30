#!/bin/bash

DOTFILES_DIR="/home/nightmare/Egor/.dotfiles"

ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/.ideavimrc ~/.ideavimrc
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc
ln -sf $DOTFILES_DIR/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
