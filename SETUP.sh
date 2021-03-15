#!/bin/bash

mkdir -p $HOME/.config/nvim
DOTFILES_DIR="$HOME/.dotfiles"

ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/.ideavimrc ~/.ideavimrc
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc
ln -sf $DOTFILES_DIR/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
ln -sf $DOTFILES_DIR/.nvimrc ~/.config/nvim/init.vim

### vim-plug ###
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
