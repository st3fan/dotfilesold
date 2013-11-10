
PS1="\[\e[0;30m\]\t\[\e[0m\] "

if [ -n "${SSH_TTY}" -o -n "${SUDO_USER}" ]; then
  if [ "${USER}" != "stefan" ]; then
    PS1="${PS1}\[\e[0;34m\]\u@\[\e[0m\]"
  fi
  PS1="${PS1}\[\e[0;34m\]\h\[\e[0m\] "
fi

PS1="${PS1}\[\e[0;32m\]\w\[\e[0m\] "

if [ -n "${SUDO_USER}" ]; then
  PS1="${PS1}\n[\e[0;31m\]#\[\e[0m\] "
else
  PS1="${PS1}\[\e[0;33m\]$\[\e[0m\] "
fi

export PS1

source ~/Code/dotfiles/bashrc_mercurial_completion


export PATH="/Applications/microchip/xc32/v1.20/bin":$PATH
