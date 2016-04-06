autoload -U compinit
compinit

setopt AUTO_CD
setopt CORRECT
setopt completealiases
setopt append_history
setopt share_history
setopt hist_verify
setopt hist_ignore_all_dups
export HISTFILE="${HOME}"/.zsh-history
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

# {{{ Functions 
function ex () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.xz)    tar xvJf $1    ;;
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via ex()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

function b() {
    str=""
    count=0
    while [ "$count" -lt "$1" ];
    do
        str=$str"../"
        let count=count+1
    done
    cd $str
}

function conf() {
    case $1 in
        conky)       vim ~/.config/conky/conky.conf ;;
        mpd)         sudo vim /etc/mpd.conf ;;
        ncmpcpp)     vim ~/.ncmpcpp/config ;;
        pacman)      sudo vim /etc/pacman.conf ;;
        ranger)      vim ~/.config/ranger/rc.conf ;;
        rifle)       vim ~/.config/ranger/rifle.conf ;;
        syslinux)    vim /boot/syslinux/syslinux.cfg ;;
        vim)         vim ~/.vimrc ;;
        xinit)       vim ~/.xinitrc ;;
        xresources)  vim ~/.Xresources && xrdb ~/.Xresources ;;
        zsh)         vim ~/.zshrc && source ~/.zshrc ;;
        userChrome)  vim ~/.mozilla/firefox/80450d7f.default/chrome/userChrome.css ;;
        userContent) vim ~/.mozilla/firefox/80450d7f.default/chrome/userContent.css ;;
        phaullus)    vim ~/.vimperator/colors/phallus.vimp ;;
        awerc)       vim ~/.config/awesome/rc.lua ;;
        awetheme)    vim ~/.config/awesome/themes/default/theme.lua ;;
        openrc)      vim ~/.config/openbox/rc.xml ;;
        openauto)    vim ~/.config/openbox/autostart ;;
        openmenu)    vim ~/.config/openbox/menu.xml ;;
        bspwm)       vim ~/.config/bspwm/bspwmrc ;;
        sxhkd)       vim ~/.config/sxhkd/sxhkdrc ;;
        panel2)      vim ~/.config/bspwm/panel2 ;;
        panel)       vim ~/.config/bspwm/panel ;;
        paneld)      vim ~/.config/bspwm/panel_dzen2 ;;
        *)  echo "Unknown application: $1" ;;
esac
}

function cdl() {
    cd $1
    clear
}

#Killall tab completion
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'


# }}}

# {{{ Aliases
alias android-connect='go-mtpfs /media/nexus &'
alias android-disconnect='fusermount -u /media/nexus'
alias playdvd='mplayer dvd:// -dvd-device /dev/sr0 &'
alias btooth='sudo hidd --search'
alias cl='clear'
alias compton-opengl='compton --opengl --vsync opengl-swc --paint-on-overlay -b'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias log='journalctl'

alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -Alh'
alias svim='sudo vim'
alias pingg='ping -c 3 www.google.com'
alias '#'='sudo'
alias x='exit'
alias archey='cl && archey'
alias wine32='WINEARCH=win32'
alias panel='~/.config/bspwm/panel &'
alias panel2='~/.config/bspwm/panel2 &'
alias bat='cat /sys/class/power_supply/BAT0/capacity'
alias rtorrent='tmux-script rtorrent'
alias bspwm-update='git clone https://github.com/baskerville/bspwm.git'
alias sxhkd-update='git clone https://github.com/baskerville/sxhkd.git'
alias recadds='recadd && recadd2'

alias -s conf=vim
alias -s txt=vim
# }}}

# URxvt* Title

case $TERM in
    rxvt*)
         precmd() { print -Pn "\e]0;%m:%~\a" }
         preexec() { print -Pn "\e]0;%m:%~\a" }
         ;;
esac
# {{{ Prompt
function precmd {
  exit_status=$?
  prompt="┌"
  col=""

  if [ $exit_status = 0 ]; then
    prompt+="─╼"
    b_prompt="└────╼"
    #col="green"

  else
    prompt+="─╼"
    b_prompt="└╼"
    #col="red"
  fi

  PROMPT="%F{blue}$prompt%f %B%F{white}%b[%~]%f
%F{blue}$b_prompt%f "

#RPROMPT="%F{$col}%t%f"
}

# }}}
