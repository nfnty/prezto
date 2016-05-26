#
# Defines Rsync aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[rsync] )); then
  return 1
fi

#
# Aliases
#

_rsync_base='rsync --verbose --progress --human-readable --hard-links'

if grep -q 'xattrs' <(rsync --help 2>&1); then
  _rsync_base="${_rsync_base} --acls --xattrs"
fi

# macOS and HFS+ Enhancements
# https://bombich.com/kb/ccc5/credits
if [[ "$OSTYPE" == darwin* ]] && grep -q 'file-flags' <(rsync --help 2>&1); then
  _rsync_base="${_rsync_base} --crtimes --fileflags --protect-decmpfs --force-change"
fi

_rsync_cmd="${_rsync_base} --archive"
_rsyncp_cmd="${_rsync_base} --recursive --links --perms --times -D"

alias rsync-base="${_rsync_base}"

alias rsync-copy="${_rsync_cmd}"
alias rsyncp-copy="${_rsyncp_cmd}"

alias rsync-move="${_rsync_cmd} --remove-source-files"
alias rsyncp-move="${_rsyncp_cmd} --remove-source-files"

alias rsync-update="${_rsync_cmd} --update"
alias rsyncp-update="${_rsyncp_cmd} --update"

alias rsync-delete="${_rsync_cmd} --delete"
alias rsyncp-delete="${_rsyncp_cmd} --delete"

alias rsync-synchronize="${_rsync_cmd} --update --delete"
alias rsyncp-synchronize="${_rsyncp_cmd} --update --delete"

unset _rsync_cmd
unset _rsyncp_cmd
unset _rsync_base
