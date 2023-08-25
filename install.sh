#!/bin/bash

# get tmux
sudo apt-get -y install tmux

sudo apt install exa
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
cat /home/gitpod/.dotfiles/.zshrc | tee -a ~/.zshrc >/dev/null
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

# install lvim
# curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh -o lunar.sh
# chmod u+x lunar.sh
# LV_BRANCH='release-1.3/neovim-0.9' bash ./lunar.sh -y --no-install-dependencies

# cp /home/gitpod/.dotfiles/config.go.lua ~/.config/lvim/config.lua


# we're doing a custom nvim lesgo.
cp -r /home/gitpod/.dotfiles/nvim ~/.config/nvim

# goto home
cd $GITPOD_REPO_ROOT

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# run any mason installs
# are there additional _local_ scripts to run in the root.
# add this as a per repo init (not in gitpod.yml as it may not be there)
# echo "Installing go stuff for lvim"
# lvim --headless -c "MasonInstall gopls golangci-lint-langserver delve goimports gofumpt gomodifytags gotests impl" -c qall
# lvim --headless -c "MasonInstall golangci-lint-langserver" -c qall

# go install stuff
 # go install github.com/go-delve/delve/cmd/dlv@latest
#go install github.com/a-h/templ/cmd/templ@latest

# run tmux
#tmux 


