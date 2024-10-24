#!/bin/bash

mkdir -p $HOME/.config/nvim
DOTFILES_DIR="$HOME/.dotfiles"

### links ###
bash $DOTFILES_DIR/LINKS.sh
##############

###### tmux ######
cp $DOTFILES_DIR/tmux/.tmux.conf.local ~/.tmux.conf.local
##################

### terminator ###
pip3 install requests
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
##################

### vim-plug ###
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#################

### kitty color themes ###
#clean exists theme
rm ~/.config/kitty/theme.conf

THEME_NAME="OneDark"
THEME=https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/$THEME_NAME.conf
wget "$THEME" -P ~/.config/kitty/kitty-themes/themes
ln -s ~/.config/kitty/kitty-themes/themes/$THEME_NAME.conf ~/.config/kitty/theme.conf
##########################
