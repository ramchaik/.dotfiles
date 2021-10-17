#!/bin/bash

echo "*** start [setup config sys link] ***"

# zsh
rm ~/.zshrc
rm ~/.fzf.zsh
rm ~/.p10k.zsh
ln -s ~/.dotfiles/.zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.zsh/.fzf.zsh ~/.fzf.zsh
ln -s ~/.dotfiles/.zsh/.p10k.zsh ~/.p10k.zsh

# fish
rm ~/.config/fish/conf.d/omf.fish
ln -s ~/.dotfiles/.fish/.omf.fish ~/.config/fish/conf.d/omf.fish

# yabai
rm ~/.config/yabai/yabairc
rm ~/.config/skhd/skhdrc
rm ~/.config/limelight/limelightrc
ln -s ~/.dotfiles/.yabai/yabairc ~/.config/yabai/yabairc
ln -s ~/.dotfiles/.yabai/skhdrc ~/.config/skhd/skhdrc
ln -s ~/.dotfiles/.yabai/limelightrc ~/.config/limelight/limelightrc

# git
rm ~/.gitconfig
rm ~/.gitmessage
rm ~/.gitignore
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/.gitmessage ~/.gitmessage
ln -s ~/.dotfiles/git/.gitignore ~/.gitignore

# alias
rm ~/.config/aliasrc
ln -s ~/.dotfiles/.alias/aliasrc ~/.config/aliasrc

# tmux
rm ~/.tmux.conf
ln -s ~/.dotfiles/.tmux/.tmux.conf ~/.tmux.conf

# curl
rm ~/.curlrc
ln -s ~/.dotfiles/.curl/.curlrc ~/.curlrc

# docker
rm ~/docker-compose.yml
ln -s ~/.dotfiles/.docker/docker-compose.yml ~/docker-compose.yml

echo "*** done [setup config sys link] ***"
