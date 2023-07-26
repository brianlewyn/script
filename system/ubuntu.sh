#!/bin/sh
# Should Be Main Server

GITHUB="brianlewyn"

# Update & Upgrade
sudo apt update && sudo apt upgrade

# GNOME
sudo apt install gnome-tweaks
sudo add-apt-repository universe
sudo apt install gnome-shell-extensions

# Brave
sudo apt install curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# KeePassXC
sudo add-apt-repository ppa:phoerious/keepassxc
sudo apt update
sudo apt install keepassxc

# VSCode
#curl -o ~/Downloads/vscode.deb https://code.visualstudio.com/download
#sudo apt install ~/Downloads/./vscode.deb

# Docker
#sudo apt-get update
#sudo apt-get install ca-certificates gnupg
#sudo install -m 0755 -d /etc/apt/keyrings
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
#sudo chmod a+r /etc/apt/keyrings/docker.gpg
#echo \
#"deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
#sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#curl -o ~/Downloads/docker.deb https://desktop.docker.com/linux/main/amd64/docker-desktop-4.21.1-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64
#sudo apt-get update
#sudo apt-get install ~/Downloads/./docker.deb
#systemctl --user start docker-desktop
#systemctl --user enable docker-desktop

# balenaEtcher
#curl -o ~/Downloads/balena.deb https://github.com/balena-io/etcher/releases/download/v1.18.11/balena-etcher_1.18.11_amd64.deb
#sudo apt install ~/Downloads/./balena.deb

# Snap
sudo snap refresh
snap-store --quit && sudo snap refresh snap-store

# Vim
sudo apt-get update; sudo apt-get install vim
echo "set number" > ~/.vimrc
echo "set tabstop=4" >> ~/.vimrc

# Neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update; sudo apt-get install neovim

# Git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update; sudo apt install git
git config --global user.name $GITHUB
git config --global user.email $GITHUB@gmail.com
git config --global init.defaultBranch main
git config --global credential.helper store
git config --global core.editor nvim
git config --global core.pager cat

# Oh-My-Bash
git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
cd ~/.oh-my-bash/themes && mv rr .rr && rm -rf * && mv .rr rr
sed -i '27s/\(${.*} \) \(${.*} \)\$/\2\1$/' ~/.oh-my-bash/themes/rr/rr.theme.sh
sed -i '36s/}/  PS1+="\\n$ "\n}/' ~/.oh-my-bash/themes/rr/rr.theme.sh
cp ~/.oh-my-bash/templates/bashrc.osh-template ~/.bashrc
sed -i '12s/font/rr/' ~/.bashrc

echo "script done! now run 'source ~/.bashrc'"
