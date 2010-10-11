# zshrc - stefan@arentz.ca

bindkey -e							# Use emacs command line editing
bindkey ' ' magic-space				# Expand history items on space

setopt ignore_eof					# Don't exit shell on ^D
setopt auto_cd						# Change directories without using cd
setopt append_history				# Append history (for multiple sessions)
setopt hist_ignore_dups				# Ignore duplicate commands
setopt extended_history				# Save timestamps in history file
setopt no_beep						# No beeping. I hate beeping shells.
setopt complete_in_word				# Complete inside words

watch=(notme)						# Watch others

# Aliases

alias si='sudo su -'

alias ll='ls -l'
alias la='ls -la'

alias -g m='more'
alias -g h='head'
alias -g t='tail'

alias slime='emacs -f slime'
alias news='emacs -f gnus'

# History

HISTFILE=~/.zhistory				# History file
HISTSIZE=1000						# Number of lines rememberd
SAVEHIST=1000						# Number of lines stored in the file

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
  if [ -d "$1/share/info" ]; then
    export INFOPATH="$INFOPATH:$1/share/info"
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

zstyle '*' hosts wopr.local pegasus.local galactica.local \
	appletv.local satelefoon.local \
	82.94.255.141 keizer.soze.com \
	wopr.norad.org

# Setup the VCS Module

autoload -Uz vcs_info
 
zstyle ':vcs_info:*' stagedstr '%F{28}●'
zstyle ':vcs_info:*' unstagedstr '%F{11}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn hg
precmd () {
    zstyle ':vcs_info:*' formats ' [%F{green}%b%u%F{blue}]'
    vcs_info
}
 
#PROMPT='%F{blue}%n@%m %c${vcs_info_msg_0_}%F{blue} %(?/%F{blue}/%F{red})%% %{$reset_color%}'

# Set a prompt. Only show the hostname if we are not local.

setopt prompt_subst

if [ -n "$SSH_TTY" ]; then
  PS1=$'%{\e[33m%}%*%{\e[0m%} %m %4~${vcs_info_msg_0_} %{\e[31m%}%#%{\e[0m%} '
else
  PS1=$'%{\e[33m%}%*%{\e[0m%} %4~${vcs_info_msg_0_} %{\e[31m%}%#%{\e[0m%} '
fi


# Source in local setup

if [ -f ".zshrc.local" ]; then
  source .zshrc.local
fi

