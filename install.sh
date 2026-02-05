#!/bin/bash -e

# install open code
curl -fsSL https://opencode.ai/install | bash

mkdir -p ~/.local/bin

# use our thing
cat ~/.dotfiles/bash_aliases | tee ~/.bash_aliases >/dev/null


echo "source ~/.bash_aliases" >> ~/.bashrc


TARGET_DIR="/workspace"
TARGET_FILE="${TARGET_DIR}/mise.toml"

# Check if /workspace exists and is writable
if [ -d "$TARGET_DIR" ] && [ -w "$TARGET_DIR" ]; then
  # Overwrite the file with the new contents
  cat >"$TARGET_FILE" <<'EOF'
[tools]
zellij = "latest"
EOF
  echo "File written to ${TARGET_FILE}."
else
  echo "Error: Directory ${TARGET_DIR} either does not exist or is not writable." >&2
  exit 1
fi

rm -rf ~/.config/nvim
git clone https://github.com/idreaminteractive/lazyvimstarter ~/.config/nvim
