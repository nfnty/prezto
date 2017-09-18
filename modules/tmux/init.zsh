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
  local session_detached="$( tmux list-sessions -F '#{session_attached}:#{session_id}' | grep '^0' | cut --delimiter=':' --fields='2' | head --lines='1' )"
  if [[ -n "${session_detached}" ]]; then
      exec tmux -f "${XDG_CONFIG_HOME}/tmux/config" attach-session -t "${session_detached}"
  else
      exec tmux -f "${XDG_CONFIG_HOME}/tmux/config" new-session
  fi
fi

#
# Aliases
#

alias tmux="tmux -f ${XDG_CONFIG_HOME}/tmux/config"
alias tmuxa="tmux $_tmux_iterm_integration new-session -A"
alias tmuxl='tmux list-sessions'
