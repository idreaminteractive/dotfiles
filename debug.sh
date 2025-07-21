#!/bin/bash -e 

git add . && git commit -am "chore: iterating..." && git push 
cd ~/.dotfiles

git pull
./install.sh
cd /workspace/dotfiles

echo "🚀 🚀 🚀 🚀 🚀 🚀 🚀 🚀 🚀 🚀 🚀 🚀 🚀 🚀 🚀 🚀 🚀"
