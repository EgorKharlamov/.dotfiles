#!/bin/bash

mkdir -p $HOME/.config/nvim
DOTFILES_DIR="$HOME/.dotfiles"

### links ###
ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/.ideavimrc ~/.ideavimrc
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc
ln -sf $DOTFILES_DIR/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
ln -sf $DOTFILES_DIR/nvim/.nvimrc ~/.config/nvim/init.vim
ln -sf $DOTFILES_DIR/nvim/.mapnvimrc ~/.config/nvim/.mapnvimrc
ln -sf $DOTFILES_DIR/nvim/.settingsnvimrc ~/.config/nvim/.settingsnvimrc
ln -sf $DOTFILES_DIR/.gitconfig ~/.gitconfig
ln -sf $DOTFILES_DIR/tmux/.tmux.conf ~/.tmux.conf
ln -sf $DOTFILES_DIR/.terminatorrc ~/.config/terminator/config
ln -sf $DOTFILES_DIR/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sf $DOTFILES_DIR/kitty.conf ~/.config/kitty/kitty.conf
