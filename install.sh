#!/bin/bash

# download and install starship prompt
# curl -sS https://starship.rs/install.sh --output starship.sh

# make it runnable
# chmod u+x starship.sh

# install starship without a prompt
# ./starship.sh -y

# use our thing
cat ~/.dotfiles/bashrc | tee -a ~/.bashrc >/dev/null
# ripgrep

sudo apt update
# sudo apt install -y make gcc ripgrep unzip xclip exa
sudo apt install -y exa

# Now we install nvim
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
# sudo rm -rf /opt/nvim-linux64
# sudo mkdir -p /opt/nvim-linux64
# sudo chmod a+rX /opt/nvim-linux64
# sudo tar -C /opt -xzf nvim-linux64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
# sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/

# mkdir -p /home/gitpod/.config/nvim
# git clone https://github.com/idreaminteractive/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
# cp -r /home/gitpod/.dotfiles/kickstart ~/.config/nvim

# goto home
cd $HOME

# load our starship stuff
# cp /home/gitpod/.dotfiles/starship.toml ~/.config/starship.toml
# starship preset bracketed-segments -o ~/.config/starship.toml

# nvim --headless +"Lazy! sync" +qa
 # nvim --headless +"TSInstall templ" +qa

# nvim --headless +"MasonInstall gopls" +q
# nvim --headless +"MasonInstall lua-language-server stylua" +q

# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# run tmux
# copy our bindings.
# cp -r $HOME/.dotfiles/tmux.conf ~/.tmux.conf


# Auto start tmux on SSH or xtermjs
# cat >>"$HOME/.bashrc" <<'EOF'
# if test ! -v TMUX && (test -v SSH_CONNECTION || test "$PPID" == "$(pgrep -f '/ide/xterm/bin/node /ide/xterm/index.cjs' | head -n1)"); then {
#   if ! tmux has-session 2>/dev/null; then {
#     tmux new-session -n "editor" -ds "gitpod"
##   } fi
#     exec tmux attach
# } fi
# EOF
