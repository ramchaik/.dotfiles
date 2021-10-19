#!/bin/bash

echo "*** start [setup config sys link] ***"

# zsh
[ -e ~/.zshrc ] && rm ~/.zshrc
[ -e ~/.fzf.zsh ] && rm ~/.fzf.zsh
[ -e ~/.p10k.zsh ] && rm ~/.p10k.zsh
ln -s ~/.dotfiles/.zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.zsh/.fzf.zsh ~/.fzf.zsh
ln -s ~/.dotfiles/.zsh/.p10k.zsh ~/.p10k.zsh

# fish
rm ~/.config/fish/conf.d/omf.fish
ln -s ~/.dotfiles/.fish/.omf.fish ~/.config/fish/conf.d/omf.fish

# yabai
[ -e ~/.config/yabai/yabairc ] && rm ~/.config/yabai/yabairc
[ -e ~/.config/skhd/skhdrc ] && rm ~/.config/skhd/skhdrc
[ -e ~/.config/limelight/limelightrc ] && rm ~/.config/limelight/limelightrc
ln -s ~/.dotfiles/.yabai/yabairc ~/.config/yabai/yabairc
ln -s ~/.dotfiles/.yabai/skhdrc ~/.config/skhd/skhdrc
ln -s ~/.dotfiles/.yabai/limelightrc ~/.config/limelight/limelightrc

# git
[ -e ~/.gitconfig ] && rm ~/.gitconfig
[ -e ~/.gitmessage ] && rm ~/.gitmessage
[ -e ~/.gitignore ] && rm ~/.gitignore
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/.gitmessage ~/.gitmessage
ln -s ~/.dotfiles/git/.gitignore ~/.gitignore

# alias
[ -e ~/.config/aliasrc ] && rm ~/.config/aliasrc
ln -s ~/.dotfiles/.alias/aliasrc ~/.config/aliasrc

# tmux
[ -e ~/.tmux.conf ] && rm ~/.tmux.conf
ln -s ~/.dotfiles/.tmux/.tmux.conf ~/.tmux.conf

# curl
[ -e ~/.curlrc ] && rm ~/.curlrc
ln -s ~/.dotfiles/.curl/.curlrc ~/.curlrc

# docker
[ -e ~/docker-compose.yml ] && rm ~/docker-compose.yml
ln -s ~/.dotfiles/.docker/docker-compose.yml ~/docker-compose.yml

echo "*** done [setup config sys link] ***"
