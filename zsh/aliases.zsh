alias la="eza --icons -la"
alias workstart="$HOME/Dropbox/.scripts/workcron/workstart.sh"
alias workend="$HOME/Dropbox/.scripts/workcron/workend.sh"
alias btrestart="$HOME/Dropbox/.scripts/bluetooth/btrestart"
alias weather="curl 'https://wttr.in/krasnoyarsk?format=2&lang=ru'"

alias ytdlLA='youtube-dl -wcxi --max-filesize 30m --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata -o "%(title)s.%(ext)s"'

alias instapic="$HOME/.scripts/instagram/pics.sh"
alias showTempRPi="$HOME/.scripts/RPiScripts/cycle.sh '$HOME/.scripts/RPiScripts/showTempRPi.sh -c'"
alias rap="$HOME/Dropbox/.scripts/music/streamRap.sh"
alias showclock="tty-clock -scb"
alias calendar="calcurse"
alias updg='sudo apt-get update && sudo apt-get upgrade -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh'
alias pacyun="sudo pacman -Syyu --noconfirm && yun"
alias clean_cache="rm -rf ~/.cache/* && paccache -r && yay -Sc --noconfirm"
alias speedUp='xset r rate 250 50'
alias chromedev="google-chrome --disable-web-security --user-data-dir=$HOME/chrome"
alias y="yazi"

alias vueDev="echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p"
alias myip="echo 94.73.247.54"
alias mysensors="while true; do sensors | grep Core && echo; sleep 5; done"

alias giteahelp="echo 'git clone ssh://git@gitea.hecate.dev:2221/egorkharlamov/{repos}'"

alias shtd="$HOME/Dropbox/.scripts/autoshutdown.sh"
alias shtdr="$HOME/Dropbox/.scripts/autoshutdown.sh -r"
alias ez="nvim $HOME/.zshrc"
alias ezd="nvim $HOME/.dotfiles/zsh/aliases.zsh"
alias sz="source $HOME/.zshrc"
alias moon="curl 'wttr.in/Moon'"
alias lss="ls -sh | sort -h"
alias duh="du -d 1 -h | sort -h"
alias porn="mpv 'http://www.pornhub.com/random'"

esprint () {
  $1 "$HOME/Dropbox/WORK/ectool/sprints/all_sprints.md"
}

iso () {
  sudo dd bs=4M if="$1" of=/dev/"$2" status=progress && sync
}

vpnu () {
  sudo nmcli connection up "$1"
}
vpnd () {
  sudo nmcli connection down "$1"
}

hg() {
  history | grep "$1"
}

apti() {
  sudo apt-get update && sudo apt-get install "$1" -Vy
}
apdg() {
  sudo apt update && sudo apt upgrade -yV && sudo apt autoremove
}
vpsina_traffic() {
  local do_filter=false
  local server="vpsina"
  
  while [[ $# -gt 0 ]]; do
    case $1 in
      -s)
        do_filter=true
        shift
        ;;
      -k)
        server="vpnks"
        shift
        ;;
      *)
        break
        ;;
    esac
  done

  local output=$(ssh $server "vnstat ens3 -m")
  if [[ "$do_filter" == true ]]; then
    echo "$output" | rg "$(date +%Y-%m)"
  else
    echo "$output"
  fi
}

alias tm="tmux attach || tmux new -s work"
alias tmd="tmux detach"
alias tmk="tmux kill-server"
alias rr="ranger"
alias srr="sudo ranger"
alias h="htop"

alias packey="sudo pacman-key --init && sudo pacman-key --populate && sudo pacman-key --refresh-keys --keyserver hkps://keyserver.ubuntu.com && sudo pacman -Syy"
alias yn="yay -S --noconfirm"
alias yl="yay -S --noconfirm --needed - < ~/.pkglist.txt"
alias ys="yay"
alias ysn="yay --noconfirm"
alias yo="yay -S --overwrite='*'"
alias yU="yay -U"
alias yUo="yay -U --overwrite='*'"
alias yc="yay -Sc"
alias ycc="yay -Scc"
alias yy="yay -Syy"
alias yu="yay -Syyu"
alias yun="yay -Syyu --noconfirm"
alias yr="yay -R"
alias yrs="yay -Rs"
alias yrsn="yay -Rsn"
alias yrn="yay -R --noconfirm"
alias ynskip='yay --noconfirm --mflags "--nocheck --skipchecksums --skippgpcheck"'
alias ygpg='yay --noconfirm --gpgflags "--keyserver keys.gnupg.net"'

# распаковать архив не указывая тип распаковщика
function ex {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Использование: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f "$1" ] ; then
        NAME=${1%.*}
        #mkdir $NAME && cd $NAME
        case "$1" in
          *.tar.bz2)   tar xvjf ./"$1"    ;;
          *.tar.gz)    tar xvzf ./"$1"    ;;
          *.tar.xz)    tar xvJf ./"$1"    ;;
          *.lzma)      unlzma ./"$1"      ;;
          *.bz2)       bunzip2 ./"$1"     ;;
          *.rar)       unrar x -ad ./"$1" ;;
          *.gz)        gunzip ./"$1"      ;;
          *.tar)       tar xvf ./"$1"     ;;
          *.tbz2)      tar xvjf ./"$1"    ;;
          *.tgz)       tar xvzf ./"$1"    ;;
          *.zip)       unzip ./"$1"       ;;
          *.Z)         uncompress ./"$1"  ;;
          *.7z)        7z x ./"$1"        ;;
          *.xz)        unxz ./"$1"        ;;
          *.exe)       cabextract ./"$1"  ;;
          *)           echo "ex: '$1' - Не может быть распакован" ;;
        esac
    else
        echo "'$1' - не является допустимым файлом"
    fi
fi
}

# Упаковка в архив командой pk 7z /что/мы/пакуем имя_файла.7z
function pk () {
  if [ $1 ] ; then
    case $1 in
      tbz)       tar cjvf $2.tar.bz2 $2      ;;
      tgz)       tar czvf $2.tar.gz  $2       ;;
      txz)       tar -caf $2.tar.xz  $2       ;;
      tar)       tar cpvf $2.tar  $2       ;;
      bz2)       bzip $2 ;;
      gz)        gzip -c -9 -n $2 > $2.gz ;;
      zip)       zip -r $2.zip $2   ;;
      7z)        7z a $2.7z $2    ;;
      *)         echo "'$1' не может быть упакован с помощью pk()" ;;
    esac
  else
    echo "'$1' не является допустимым файлом"
  fi
}

