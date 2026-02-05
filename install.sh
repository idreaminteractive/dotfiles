#!/bin/bash -e

curl -LO https://github.com/lsd-rs/lsd/releases/download/v1.1.5/lsd_1.1.5_amd64.deb
sudo apt update --allow-releaseinfo-change
sudo apt install -y ./lsd_1.1.5_amd64.deb
sudo apt-get install -y bison
rm lsd_1.1.5_amd64.deb

# download and install starship prompt
curl -sS https://starship.rs/install.sh --output starship.sh

# make it runnable
chmod u+x starship.sh

# install starship without a prompt
./starship.sh -y >/dev/null

# install open code
curl -fsSL https://opencode.ai/install | bash

mkdir -p ~/.local/bin

# use our thing
cat ~/.dotfiles/bash_aliases | tee ~/.bash_aliases >/dev/null
cat ~/.dotfiles/bash_profile | tee ~/.bash_profile >/dev/null

# for now, not customizing zellij
# cp -r ~/.dotfiles/zellij /workspace/data/.config/
# goto home
cd $HOME

# load our starship stuff
cp $HOME/.dotfiles/starship.toml $HOME/.config/starship.toml
starship preset bracketed-segments -o ~/.config/starship.toml

# check if /workspace exists, if so, add the mise toml to the root of workspace

TARGET_DIR="/workspace"
TARGET_FILE="${TARGET_DIR}/mise.toml"

# Check if /workspace exists and is writable
if [ -d "$TARGET_DIR" ] && [ -w "$TARGET_DIR" ]; then
  # Overwrite the file with the new contents
  cat >"$TARGET_FILE" <<'EOF'
[tools]
neovim = "latest"
lazygit = "latest"
zellij = "latest"
EOF
  echo "File written to ${TARGET_FILE}."
else
  echo "Error: Directory ${TARGET_DIR} either does not exist or is not writable." >&2
  exit 1
fi

# for now overwrite EVERY time?
rm -rf ~/.config/nvim
git clone https://github.com/idreaminteractive/lazyvimstarter ~/.config/nvim

# mkdir -p /workspace/data/.local
# mkdir -p /workspace/.config

# TARGET_NVIM_CONFIG_FOLDER="/workspace/.config/nvim"
# # clone out our nvim config  - only if it's not already here
# if [ ! -d "$TARGET_NVIM_CONFIG_FOLDER" ]; then
#   git clone https://github.com/idreaminteractive/kickstart.nvim.git /workspace/.config/nvim
#   # git clone https://github.com/idreaminteractive/lazyvim-config /workspace/.config/nvim
# else
#   cd $TARGET_NVIM_CONFIG_FOLDER && git pull
# fi
