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
# cat /home/gitpod/.dotfiles/.zshrc | tee -a ~/.zshrc >/dev/null
cat /home/gitpod/.dotfiles/.bashrc | tee -a ~/.bashrc >/dev/null
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


# we're doing a custom nvim lesgo.
# cp -r /home/gitpod/.dotfiles/nvim ~/.config/nvim
# we're going to try nvim chad pls 


#cp -r /home/gitpod/.dotfiles/chad ~/.config/nvim
cp -r /home/gitpod/.dotfiles/kickstart ~/.config/nvim
# cp -r /home/gitpod/.dotfiles/lazyvim ~/.config/nvim

# goto home
cd $GITPOD_REPO_ROOT

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash



# load our starship stuff
cp /home/gitpod/.dotfiles/starship.toml ~/.config/starship.toml
starship preset bracketed-segments -o ~/.config/starship.toml


nvim --headless "+Lazy! sync" +qa

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# run tmux
# copy our bindings.
cp -r /home/gitpod/.dotfiles/.tmux.conf ~/.tmux.conf

tmux -u


