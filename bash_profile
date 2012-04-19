
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -x /usr/local/bin/brew ]; then
  if [ -x /usr/local/bin/grc ]; then
    source "`brew --prefix grc`/etc/grc.bashrc"
  fi
fi

alias si='sudo bash'
alias ls='ls -GF'
alias ll='ls -l'
alias la='ls -la'
alias ta='tmux attach'
alias em='emacs -nw'

export IRCSERVER=irc.xs4all.nl
export IRCNAME="Stefan Arentz"
export IRCNICK=st3fan

function setup_paths {
  if [ -d "$1/bin" ]; then
    export PATH="$1/bin:$PATH"
  fi
  if [ -d "$1/sbin" ]; then
    export PATH="$1/sbin:$PATH"
  fi
  if [ -d "$1/man" ]; then
    export MANPATH="$1/man:$MANPATH"
  fi
  if [ -d "$1/share/info" ]; then
    export INFOPATH="$1/share/info:$INFOPATH"
  fi
}

export PATH=/bin:/sbin:/usr/bin:/usr/sbin

setup_paths "$HOME"
setup_paths /usr/local
setup_paths /opt/local
setup_paths /usr/local/mysql
setup_paths /usr/local/apache-maven
setup_paths /usr/local/apache-ant
setup_paths /usr/local/CrossPack-AVR

if [ -x "`which vim`" ]; then
  export VISUAL=`which vim`
  export EDITOR=`which vim`
else
  export VISUAL=`which vi`
  export EDITOR=`which vi`
fi

complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

