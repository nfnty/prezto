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

_rsync_base='rsync --verbose --progress --human-readable --recursive'
_rsyncp_cmd="${_rsync_base} --hard-links --links --devices --specials --times --perms"
_rsync_cmd="${_rsyncp_cmd} --owner --group --acls --xattrs"

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
