#!/bin/bash

# get tmux
sudo apt-get -y install tmux

# don't run zsh automatically
export RUNZSH=no
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended --keep-zshrc

# download and install starship prompt
curl -sS https://starship.rs/install.sh --output starship.sh

# make it runnable
chmod u+x starship.sh

# install starship without a prompt
./starship.sh -y

# use our thing
cp /home/gitpod/.dotfiles/.zshrc ~

# install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
# install lvim
# curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh -o lunar.sh
# chmod u+x lunar.sh
# LV_BRANCH='release-1.3/neovim-0.9' bash ./lunar.sh -y --no-install-dependencies

# how do we do our OWN nvim setup?
# git clone from our own thing into config
# git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
# cp /home/gitpod/.dotfiles/community.lua ~/.config/nvim/lua/plugins/community.lua


cd $GITPOD_REPO_ROOT
# init our tmux 
tmux 

