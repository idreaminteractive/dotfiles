#!/bin/bash

# get tmux
sudo apt-get -y install tmux


# download and install starship prompt
curl -sS https://starship.rs/install.sh --output starship.sh

# make it runnable
chmod u+x starship.sh

# install starship without a prompt
./starship.sh -y

# use our thing
cat /home/gitpod/.dotfiles/bashrc | tee -a ~/.bashrc >/dev/null
# ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

# install nvim
 curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
 chmod u+x nvim.appimage
 ./nvim.appimage --appimage-extract
 ./squashfs-root/AppRun --version
 sudo mv squashfs-root /
 sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

cp -r /home/gitpod/.dotfiles/kickstart ~/.config/nvim

# goto home
cd $GITPOD_REPO_ROOT


# load our starship stuff
cp /home/gitpod/.dotfiles/starship.toml ~/.config/starship.toml
starship preset bracketed-segments -o ~/.config/starship.toml

nvim --headless +"Lazy! sync" +qa
 # nvim --headless +"TSInstall templ" +qa

nvim --headless +"MasonInstall gopls" +q
# nvim --headless +"MasonInstall lua-language-server stylua" +q

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# add some other bits
#go install github.com/a-h/templ/cmd/templ@latest

# run tmux
# copy our bindings.
cp -r /home/gitpod/.dotfiles/tmux.conf ~/.tmux.conf


# Auto start tmux on SSH or xtermjs
# cat >>"$HOME/.bashrc" <<'EOF'
# if test ! -v TMUX && (test -v SSH_CONNECTION || test "$PPID" == "$(pgrep -f '/ide/xterm/bin/node /ide/xterm/index.cjs' | head -n1)"); then {
#   if ! tmux has-session 2>/dev/null; then {
#     tmux new-session -n "editor" -ds "gitpod"
##   } fi
#     exec tmux attach
# } fi
# EOF
