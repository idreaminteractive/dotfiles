#!/bin/bash

sudo apt install -y exa

# download and install starship prompt
curl -sS https://starship.rs/install.sh --output starship.sh

# make it runnable
chmod u+x starship.sh

# install starship without a prompt
./starship.sh -y >/dev/null

# use our thing
cat ~/.dotfiles/bashrc | tee -a ~/.bashrc >/dev/null

# goto home
cd $HOME

# load our starship stuff
cp $HOME/.dotfiles/starship.toml $HOME/.config/starship.toml
starship preset bracketed-segments -o ~/.config/starship.toml

