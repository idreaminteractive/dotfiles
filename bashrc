eval "$(starship init bash)"

alias ll="exa -l -g --icons"
alias llt="exa -1 --icons --tree"
alias lla="exa -l -g --icons --all"

alias vim="nvim"

# Git config
if [ ! -e ~/.gitconfigured ]; then
    touch ~/.gitconfigured
    git config --global push.default simple \
    && git config --global alias.l "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" \
    && git config --global alias.a "add" \
    && git config --global alias.ap "add -p" \
    && git config --global alias.c "commit --verbose" \
    && git config --global alias.ca "commit -a --verbose" \
    && git config --global alias.cm "commit -m" \
    && git config --global alias.cam "commit -am" \
    && git config --global alias.m "commit --amend --verbose" \
    && git config --global alias.d "diff" \
    && git config --global alias.ds "diff --stat" \
    && git config --global alias.dc "diff --cached" \
    && git config --global alias.s "status -s" \
    && git config --global alias.co "checkout" \
    && git config --global alias.cob "checkout -b" \
    && git config --global alias.b "!git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'" \
    && git config --global alias.la "!git config -l | grep alias | cut -c 7-" \
    && git config --global alias.p "push" \
    && git config --global alias.pu "push -u origin" \
    || rm -f ~/.gitconfigured
fi


export PATH=$PATH:/home/gitpod/.local/bin
