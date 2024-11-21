eval "$(starship init bash)"

alias ll="exa -l -g --icons"
alias llt="exa -1 --icons --tree"
alias lla="exa -l -g --icons --all"

alias vim="nvim"

# Git config
alias gs='git status -sb'

alias ga='git add -A'
alias gap='ga -p'

alias gbr='git branch -v'

gc() {
  git diff --cached | grep '\btap[ph]\b' >/dev/null &&
    echo "\e[0;31;29mOops, there's a #tapp or similar in that diff.\e[0m" ||
    git commit -v "$@"
}

alias gch='git cherry-pick'

alias gcm='git commit -v --amend'

alias gco='git checkout'
alias gcob='git checkout -b'

alias gd='git diff -M'
alias gd.='git diff -M --color-words="."'
alias gdc='git diff --cached -M'
alias gdc.='git diff --cached -M --color-words="."'

alias gf='git fetch'

# Helper function.
git_current_branch() {
  cat "$(git rev-parse --git-dir 2>/dev/null)/HEAD" | sed -e 's/^.*refs\/heads\///'
}

alias glog='git log --date-order --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
alias gl='glog --graph'
alias gla='gl --all'

alias gm='git merge --no-ff'
alias gmf='git merge --ff-only'

alias gp='git push'
alias gpthis='gp origin -u $(git_current_branch)'

alias grb='git rebase -p'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'

alias gr='git reset'
alias grh='git reset --hard HEAD'
alias grsh='git reset --soft HEAD~'

alias grv='git remote -v'

alias gst='git stash'
alias gstp='git stash pop'

alias gup='git pull'


export PATH=$PATH:/home/gitpod/.local/bin
