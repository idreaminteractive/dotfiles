#!/bin/bash

# get tmux
sudo apt-get -y install tmuxß

# don't run zsh automatically
export RUNZSH=no
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended --keep-zshrc

# download and install starship prompt
curl -sS https://starship.rs/install.sh 

# install starship without a prompt
./install.sh -y

# use our thing
cp .zshrc ~

# init our tmux 
tmux

