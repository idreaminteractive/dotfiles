#!/bin/bash

# get tmux
sudo apt-get -y install tmux

sudo apt install exa
# don't run zsh automatically
# export RUNZSH=no
# # install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended --keep-zshrc

# download and install starship prompt
curl -sS https://starship.rs/install.sh --output starship.sh

# make it runnable
chmod u+x starship.sh

# install starship without a prompt
./starship.sh -y

# use our thing
cat /home/gitpod/.dotfiles/.bashrc | tee -a ~/.bashrc >/dev/null
# ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb


cp -r /home/gitpod/.dotfiles/kickstart ~/.config/nvim

# goto home
cd $GITPOD_REPO_ROOT


# load our starship stuff
cp /home/gitpod/.dotfiles/starship.toml ~/.config/starship.toml
starship preset bracketed-segments -o ~/.config/starship.toml


nvim --headless "+Lazy! sync" +qa
nvim --headless "+TSInstall templ" +qa

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# add some other bits
#go install github.com/a-h/templ/cmd/templ@latest

# run tmux
# copy our bindings.
cp -r /home/gitpod/.dotfiles/.tmux.conf ~/.tmux.conf



