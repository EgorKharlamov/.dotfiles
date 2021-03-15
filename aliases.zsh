alias youtube-dl='/home/nightmare/.local/bin/youtube-dl'
alias speedtest='wget -O - https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3'
alias ytdlLA='youtube-dl -wcxi --max-filesize 30m --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata -o "%(title)s.%(ext)s"'

alias instapic="/home/nightmare/.scripts/instagram/pics.sh"
alias showTempRPi="/home/nightmare/.scripts/RPiScripts/cycle.sh '/home/nightmare/.scripts/RPiScripts/showTempRPi.sh -c'"
alias rap="/home/nightmare/.scripts/music/streamRap.sh"
alias showclock="tty-clock -scb"
alias calendar="calcurse"
alias updg='sudo apt-get update && sudo apt-get upgrade -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh'
alias speedUp='xset r rate 250 50'
alias chromedev="google-chrome --disable-web-security --user-data-dir=/home/nightmare/chrome"
alias r="ranger"

alias vueDev="echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p"
alias myip="echo 94.73.247.54"
