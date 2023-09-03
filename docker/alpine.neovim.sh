#!/bin/sh

# chmod +x alpine.neovim.sh
# run nvim from bash to update

# Update & Upgrade
apk update && apk upgrade

# Global Variables
ROOT="brianlewyn"
GITHUB="brianlewyn"

# Git
GitHub="brianlewyn"
apk add git
git config --global user.name $GitHub
git config --global user.email $GitHub@gmail.com
git config --global init.defaultBranch main
git config --global credential.helper store
git config --global core.editor nvim
git config --global core.pager cat

# Bash
apk add bash

# Oh-My-Bash ~ https://github.com/ohmybash/oh-my-bash
git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
cd ~/.oh-my-bash/themes && mv rr .rr && rm -rf * && mv .rr rr && cd ~
sed -i "18s/}.*\${/}$ROOT\${/" ~/.oh-my-bash/themes/rr/rr.theme.sh
sed -i '27s/\(${.*} \) \(${.*} \)\$/\2\1$/' ~/.oh-my-bash/themes/rr/rr.theme.sh
sed -i '36s/}/  PS1+="\\n$ "\n}/' ~/.oh-my-bash/themes/rr/rr.theme.sh
cp ~/.oh-my-bash/templates/bashrc.osh-template ~/.bashrc
sed -i '12s/font/rr/' ~/.bashrc

# Neovim
apk add neovim

# NvChad ~ https://github.com/NvChad/NvChad
apk add nodejs ripgrep build-base wget --update
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
CodeSnippet = "--@type ChadrcConfig\nlocal M = {}\n\nM.ui = { taheme = 'catppuccin' }\n\nreturn M"
echo -e $CodeSnippet > ~/.config/nvim/lua/custom/chadrc.lua

# EXA
apk add exa
echo "alias exa=\"exa --icons\"" >> ~/.bashrc

# JetBrainsMono NerdFont ~ https://github.com/ryanoasis/nerd-fonts
LinkFont="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures"
DirFont="~/.fonts/JetBrainsMono"
mkdir -p $DirFont
for TypeFont in "Thin" "Light" "Medium" "Regular" "SemiBold"
do
	FontFile="JetBrainsMonoNerdFont-${TypeFont}.tff"
	curl $LinkFont"/"$TypeFont"/"$FontFile -o $DirFont"/"$FontFile -s
done
