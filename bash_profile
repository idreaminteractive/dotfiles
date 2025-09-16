
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# the last commands here.
cd /workspace

# if zellij is enabled, run it with the appropriate config and layout
# but only if we're not already in a zellij shell
# if [[ -z "$ZELLIJ" ]]; then
#    zellij
# fi


# git config --global core.editor "vim"
