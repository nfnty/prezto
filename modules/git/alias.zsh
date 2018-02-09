#
# Defines Git aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Settings
#
#
_git_log_format_long='%H [%G?% GS% GK]%d%n%ci <%cn %ce> %ai <%an %ae>%n%s%n%+b'
_git_log_format_medium='%H [%G?% GS]%d%n%cr <%cn %ce> %ar <%an %ae>%n%s%n%+b'
_git_log_format_oneline='%h %s%d%n'
_git_log_format_brief='%h [%G?] %s%d%n%cr <%cn %ce> %ar <%an %ae>%n'

# Status
zstyle -s ':prezto:module:git:status:ignore' submodules '_git_status_ignore_submodules' \
  || _git_status_ignore_submodules='none'

#
# Aliases
#

# Git
alias g='git'

# Branch (b)
alias gb='git --no-pager branch'
alias gbc='git checkout -b'
alias gbl='git --no-pager branch --verbose --verbose'
alias gbL='git --no-pager branch --verbose --verbose -a'
alias gbx='git --no-pager branch --delete'
alias gbX='git --no-pager branch -D'
alias gbm='git --no-pager branch --move'
alias gbs='git show-branch'
alias gbS='git show-branch -a'

# Commit (c)
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcO='git checkout --patch'
alias gcf='git commit --amend --reuse-message HEAD'
alias gcF='git commit --verbose --amend'
alias gcp='git cherry-pick --ff'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcP='git cherry-pick --no-commit'
alias gcr='git revert'
alias gcR='git reset "HEAD^"'
alias gcs='git show --no-color --pretty=format:"${_git_log_format_medium}"'
alias gcl='git-commit-lost'

# Conflict (C)
alias gCl='git status | sed -n "s/^.*both [a-z]*ed: *//p"'
alias gCa='git add $(gCl)'
alias gCe='git mergetool $(gCl)'
alias gCo='git checkout --ours --'
alias gCO='gCo $(gCl)'
alias gCt='git checkout --theirs --'
alias gCT='gCt $(gCl)'

# Data (d)
alias gd='git ls-files'
alias gdc='git ls-files --cached'
alias gdx='git ls-files --deleted'
alias gdm='git ls-files --modified'
alias gdu='git ls-files --other --exclude-standard'
alias gdk='git ls-files --killed'
alias gdi='git status --porcelain --short --ignored | sed -n "s/^!! //p"'

# Fetch (f)
alias gf='git fetch'
alias gfc='git clone'
alias gfcr='git clone --recursive'
alias gfm='git pull'
alias gfr='git pull --rebase'

# Grep (g)
alias gg='git grep'
alias ggi='git grep --ignore-case'
alias ggl='git grep --files-with-matches'
alias ggL='git grep --files-without-matches'
alias ggv='git grep --invert-match'
alias ggw='git grep --word-regexp'

# Index (i)
alias gia='git add'
alias giA='git add --patch'
alias giu='git add --update'
alias gid='git difftool --cached'
alias giD='git diff --no-ext-diff --cached'
alias gir='git reset'
alias giR='git reset --patch'
alias gix='git rm -r --cached'
alias giX='git rm -r --force --cached'

# Log limited (l)
alias gl='git log --max-count=128 --topo-order --no-color --pretty=format:"${_git_log_format_medium}"'
alias gll='git log --max-count=128 --topo-order --no-color --pretty=format:"${_git_log_format_long}"'
alias gls='git log --max-count=128 --topo-order --no-color --pretty=format:"${_git_log_format_medium}" --stat'
alias glsl='git log --max-count=128 --topo-order --no-color --pretty=format:"${_git_log_format_long}" --stat'
alias gld='git log --max-count=128 --topo-order --no-color --pretty=format:"${_git_log_format_medium}" --stat --patch'
alias gldl='git log --max-count=128 --topo-order --no-color --pretty=format:"${_git_log_format_long}" --stat --patch'
alias glD='git log --max-count=128 --topo-order --no-color --pretty=format:"${_git_log_format_medium}" --stat --patch --full-diff'
alias glDl='git log --max-count=128 --topo-order --no-color --pretty=format:"${_git_log_format_long}" --stat --patch --full-diff'
alias glo='git log --max-count=128 --topo-order --no-color --pretty=format:"${_git_log_format_oneline}"'
alias glg='git log --max-count=128 --topo-order --no-color --pretty=format:"${_git_log_format_oneline}" --graph'
alias glb='git log --max-count=128 --topo-order --no-color --pretty=format:"${_git_log_format_brief}"'
alias glr='git reflog --no-color'
alias glc='git shortlog --summary --numbered'
alias glcl='git shortlog --numbered'

# Log full (L)
alias gL='git log --topo-order --no-color --pretty=format:"${_git_log_format_medium}"'
alias gLl='git log --topo-order --no-color --pretty=format:"${_git_log_format_long}"'
alias gLs='git log --topo-order --no-color --pretty=format:"${_git_log_format_medium}" --stat'
alias gLsl='git log --topo-order --no-color --pretty=format:"${_git_log_format_long}" --stat'
alias gLd='git log --topo-order --no-color --pretty=format:"${_git_log_format_medium}" --stat --patch'
alias gLdl='git log --topo-order --no-color --pretty=format:"${_git_log_format_long}" --stat --patch'
alias gLD='git log --topo-order --no-color --pretty=format:"${_git_log_format_medium}" --stat --patch --full-diff'
alias gLDl='git log --topo-order --no-color --pretty=format:"${_git_log_format_long}" --stat --patch --full-diff'
alias gLo='git log --topo-order --no-color --pretty=format:"${_git_log_format_oneline}"'
alias gLg='git log --topo-order --no-color --pretty=format:"${_git_log_format_oneline}" --graph'
alias gLb='git log --topo-order --no-color --pretty=format:"${_git_log_format_brief}"'

# Merge (m)
alias gm='git merge'
alias gmC='git merge --no-commit'
alias gmF='git merge --no-ff'
alias gma='git merge --abort'
alias gmt='git mergetool'

# Push (p)
alias gp='git push'
alias gpx='git push --delete'
alias gpf='git push --force'
alias gpa='git push --all'
alias gpA='git push --all && git push --tags'
alias gpt='git push --tags'
alias gpc='git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
alias gpC='git push --set-upstream'
alias gpp='git pull origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'

# Rebase (r)
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
alias grs='git rebase --skip'

# Remote (R)
alias gR='git remote'
alias gRl='git remote --verbose'
alias gRa='git remote add'
alias gRx='git remote rm'
alias gRm='git remote rename'
alias gRu='git remote update'
alias gRp='git remote prune'
alias gRs='git remote show'
alias gRb='git-hub-browse'

# Stash (s)
alias gs='git stash'
alias gsa='git stash apply'
alias gsx='git stash drop'
alias gsX='git-stash-clear-interactive'
alias gsl='git stash list'
alias gsL='git-stash-dropped'
alias gsd='git stash show --patch --stat'
alias gsp='git stash pop'
alias gsr='git-stash-recover'
alias gss='git stash save --include-untracked'
alias gsS='git stash save --patch --no-keep-index'
alias gsw='git stash save --include-untracked --keep-index'

# Submodule (S)
alias gS='git submodule'
alias gSa='git submodule add'
alias gSf='git submodule foreach'
alias gSi='git submodule init'
alias gSI='git submodule update --init --recursive'
alias gSl='git submodule status'
alias gSm='git-submodule-move'
alias gSs='git submodule sync'
alias gSu='git submodule foreach git pull origin master'
alias gSx='git-submodule-remove'

# Tag (t)
alias gt='git tag'
alias gtl='git tag --list -n99'
alias gtm='git tag --message'
alias gtx='git tag --delete'
alias gtf='git tag --force'
alias gtv='git tag --verify'

# Working Copy (w)
alias gws='git status --ignore-submodules=${_git_status_ignore_submodules} --short'
alias gwS='git status --ignore-submodules=${_git_status_ignore_submodules}'
alias gwd='git difftool'
alias gwD='git diff --no-ext-diff'
alias gwr='git reset --soft'
alias gwR='git reset --hard'
alias gwc='git clean --dry-run'
alias gwcd='git clean --dry-run -d'
alias gwC='git clean --force'
alias gwCd='git clean --force -d'
alias gwx='git rm -r'
alias gwX='git rm -r --force'
alias gwm='git mv'
