#!/bin/sh
# chmod +x alpine.vscode.sh
USERNAME="brianlewyn"
GITHUB=$USERNAME

# Update & Upgrade
apk update && apk upgrade

# Git
apk add git
git config --global user.name $GITHUB
git config --global user.email $GITHUB@gmail.com
git config --global init.defaultBranch main
git config --global credential.helper store
git config --global core.editor vi
git config --global core.pager cat

# Bash
apk add bash

# Oh-My-Bash
git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
cd ~/.oh-my-bash/themes && mv rr .rr && rm -rf * && mv .rr rr
sed -i "18s/}.*\${/}$USERNAME\${/" ~/.oh-my-bash/themes/rr/rr.theme.sh
sed -i '27s/\(${.*} \) \(${.*} \)\$/\2\1$/' ~/.oh-my-bash/themes/rr/rr.theme.sh
sed -i '36s/}/  PS1+="\\n$ "\n}/' ~/.oh-my-bash/themes/rr/rr.theme.sh
cp ~/.oh-my-bash/templates/bashrc.osh-template ~/.bashrc
sed -i '12s/font/rr/' ~/.bashrc
