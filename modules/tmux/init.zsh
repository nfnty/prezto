#
# Defines tmux aliases and provides for auto launching it at start-up.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Colin Hebert <hebert.colin@gmail.com>
#   Georges Discry <georges@discry.be>
#   Xavier Cambar <xcambar@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[tmux] )); then
  return 1
fi

#
# Auto Start
#

if ([[ "$TERM_PROGRAM" = 'iTerm.app' ]] && \
  zstyle -t ':prezto:module:tmux:iterm' integrate \
); then
  _tmux_iterm_integration='-CC'
fi

if [[ -z "$TMUX" && -z "$EMACS" && -z "$VIM" ]] && ( \
  ( [[ -n "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' remote ) ||
  ( [[ -z "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' local ) \
); then
  tmux -f "${XDG_CONFIG_HOME}/tmux/config" start-server

  # Create a 'prezto' session if no session has been defined in tmux.conf.
  if ! tmux has-session; then
    tmux -f "${XDG_CONFIG_HOME}/tmux/config" \
      new-session -d -s prezto \
      ';' set-option -t prezto destroy-unattached off
  fi

  # Attach to the 'prezto' session or to the last session used.
  exec tmux -f "${XDG_CONFIG_HOME}/tmux/config" \
    $_tmux_iterm_integration \
    new-session -t prezto \
    ';' set-option destroy-unattached on
fi

#
# Aliases
#

alias tmux="tmux -f ${XDG_CONFIG_HOME}/tmux/config"
alias tmuxa="tmux $_tmux_iterm_integration new-session -A"
alias tmuxl='tmux list-sessions'
