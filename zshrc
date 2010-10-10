# zshrc - stefan@arentz.ca

bindkey -e							# Use emacs command line editing
bindkey ' ' magic-space				# Expand history items on space

setopt ignore_eof					# Don't exit shell on ^D
setopt auto_cd						# Change directories without using cd
setopt append_history				# Append history (for multiple sessions)
setopt hist_ignore_dups				# Ignore duplicate commands
setopt extended_history				# Save timestamps in history file
setopt no_beep						# No beeping. I hate beeping shells.

# Aliases

alias ll='ls -l'
alias la='ls -la'

alias slime='emacs -f slime'
alias news='emacs -f gnus'

# History

HISTFILE=~/.zhistory				# History file
HISTSIZE=1000						# Number of lines rememberd
SAVEHIST=1000						# Number of lines stored in the file

# Set a prompt. Only show the hostname if we are not local.

if [ -n "$SSH_TTY" ]; then
  PS1=$'%{\e[33m%}%*%{\e[0m%} %m %4~ %{\e[31m%}%#%{\e[0m%} '
else
  PS1=$'%{\e[33m%}%*%{\e[0m%} %4~ %{\e[31m%}%#%{\e[0m%} '
fi

# Setup IRC

export IRCSERVER=irc.xs4all.nl
export IRCNAME="Stefan Arentz"
export IRCNICK=st3fan

# Setup paths from a bunch of known places

setup_paths() {
  if [ -d "$1/bin" ]; then
    export PATH="$PATH:$1/bin"
  fi
  if [ -d "$1/man" ]; then
    export MANPATH="$MANPATH:$1/man"
  fi
}

setup_paths /usr/local
setup_paths /opt/local
setup_paths /usr/local/mysql
setup_paths /usr/local/apache-maven
setup_paths /usr/local/apache-ant
setup_paths /usr/local/AVRMacPack

# If we have less then use that as the pager

if [ -x "`which less`" ]; then
  export PAGER=less
  alias more='less'
fi

# If we have vim then use it as the default editor

if [ -x "`which vim`" ]; then
  export VISUAL=`which vim`
  export EDITOR=`which vim`
else
  export VISUAL=`which vi`
  export EDITOR=`which vi`
fi

# For EC2

if [ -x "`which ec2din`" ]; then
  alias ecc-show-instances=ec2din \
    | grep ^INSTANCE \
    | grep -v terminated \
    | awk '{ printf("%s %s %s %s\n", $2, $4, $5, $9) }'
fi

# Setup completion

autoload -U compinit
compinit

# Source in local setup

if [ -f ".zshrc.local" ]; then
  source .zshrc.local
fi

