eval "$(starship init bash)"

alias ll="exa -l -g --icons"
alias llt="exa -1 --icons --tree"
alias lla="exa -l -g --icons --all"

alias vim="nvim"

# Git config
if [ ! -e ~/.gitconfigured ]; then
    touch ~/.gitconfigured
    git config --global push.default simple \
    && git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" \
    && git config --global alias.l "log --pretty=format:'%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --date=short" \
    && git config --global alias.a "add" \
    && git config --global alias.ap "add -p" \
    && git config --global alias.c "commit --verbose" \
    && git config --global alias.ca "commit -a --verbose" \
    && git config --global alias.cm "commit -m" \
    && git config --global alias.cam "commit -am" \
    && git config --global alias.m "commit --amend --verbose" \
    && git config --global alias.d "diff" \
    && git commit --global alias.ds "diff --stat" \
    && git commit --global alias.dc "diff --cached" \
    
    d = diff
    ds = diff --stat
    dc = diff --cached

    s = status -s
    co = checkout
    cob = checkout -b
    # list branches sorted by last modified
    b = "!git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"

    # list aliases
    la = "!git config -l | grep alias | cut -c 7-"
    || rm -f ~/.gitconfigured
fi


export PATH=$PATH:/home/gitpod/.local/bin
