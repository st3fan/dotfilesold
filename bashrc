
PS1="\e[0;30m\t\e[m "

if [ -n "${SSH_TTY}" -o -n "${SUDO_USER}" ]; then
  if [ "${USER}" != "stefan" ]; then
    PS1="${PS1}\e[0;34m\u@\e[m"
  fi
  PS1="${PS1}\e[0;34m\h\e[m "
fi

PS1="${PS1}\e[0;32m\w\e[m "

if [ -n "${SUDO_USER}" ]; then
  PS1="${PS1}\e[0;31m#\e[m "
else
  PS1="${PS1}\e[0;33m$\e[m "
fi

export PS1

