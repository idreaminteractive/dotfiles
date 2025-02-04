#!/bin/bash

# sudo apt update
# sudo apt install -y lsd

curl -LO https://github.com/lsd-rs/lsd/releases/download/v1.1.5/lsd_1.1.5_amd64.deb
sudo apt update
sudo apt install ./lsd_1.1.5_amd64.deb
rm lsd_1.1.5_amd64.deb



# download and install starship prompt
curl -sS https://starship.rs/install.sh --output starship.sh

# make it runnable
chmod u+x starship.sh

# install starship without a prompt
./starship.sh -y >/dev/null

# use our thing
cat ~/.dotfiles/bashrc | tee  ~/.bash_aliases >/dev/null

# goto home
cd $HOME

# load our starship stuff
cp $HOME/.dotfiles/starship.toml $HOME/.config/starship.toml
starship preset bracketed-segments -o ~/.config/starship.toml

