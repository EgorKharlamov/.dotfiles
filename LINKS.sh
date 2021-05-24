#!/bin/bash

# mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/alacritty
DOTFILES_DIR="$HOME/.dotfiles"

### links ###

# vim & ideavim
ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/.ideavimrc ~/.ideavimrc

# zsh
ln -sf $DOTFILES_DIR/zsh/.zshrc ~/.zshrc
ln -sf $DOTFILES_DIR/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

# neovim
ln -s $DOTFILES_DIR/nvim ~/.config
# ln -sf $DOTFILES_DIR/nvim/.nvimrc ~/.config/nvim/init.vim
# ln -sf $DOTFILES_DIR/nvim/.mapnvimrc ~/.config/nvim/.mapnvimrc
# ln -sf $DOTFILES_DIR/nvim/.settingsnvimrc ~/.config/nvim/.settingsnvimrc

ln -sf $DOTFILES_DIR/git/.gitconfig ~/.gitconfig
ln -sf $DOTFILES_DIR/tmux/.tmux.conf ~/.tmux.conf
ln -sf $DOTFILES_DIR/coc-settings.json ~/.config/nvim/coc-settings.json

# terminals
ln -sf $DOTFILES_DIR/terminals/.terminatorrc ~/.config/terminator/config
ln -sf $DOTFILES_DIR/terminals/kitty.conf ~/.config/kitty/kitty.conf
ln -sf $DOTFILES_DIR/terminals/alacritty.yml ~/.config/alacritty/alacritty.yml
