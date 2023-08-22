#!/bin/bash
sudo apt-get -y install tmux & disown

export RUNZSH=no

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended --keep-zshrc
curl -sS https://starship.rs/install.sh | sh -y

# exit
# tmux



# cp .zshrc ~
