#!/bin/bash

echo "*** start [setup config sys link] ***"

# zsh
[ -e ~/.zshrc ] && rm ~/.zshrc && echo -e "zsh removed"
[ -e ~/.fzf.zsh ] && rm ~/.fzf.zsh && echo -e "fzf removed"
[ -e ~/.p10k.zsh ] && rm ~/.p10k.zsh && echo -e "p10k removed"
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc && echo -e "zsh link created"
ln -s ~/.dotfiles/zsh/.fzf.zsh ~/.fzf.zsh && echo -e "fzf link created"
ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh && echo -e "p10k link created \n"

# fish
rm ~/.config/fish/conf.d/omf.fish && echo -e "omf removed"
ln -s ~/.dotfiles/fish/.config/fish/.omf.fish ~/.config/fish/conf.d/omf.fish && echo -e "omf link created \n"

# yabai
[ -e ~/.config/yabai/yabairc ] && rm ~/.config/yabai/yabairc && echo -e "yabai removed"
[ -e ~/.config/skhd/skhdrc ] && rm ~/.config/skhd/skhdrc && echo -e "skhd removed"
[ -e ~/.config/limelight/limelightrc ] && rm ~/.config/limelight/limelightrc && echo -e "limelight removed"
ln -s ~/.dotfiles/yabai/.config/yabai/yabairc ~/.config/yabai/yabairc && echo -e "yabai link created"
ln -s ~/.dotfiles/yabai/.config/skhd/skhdrc ~/.config/skhd/skhdrc && echo -e "skhd link created"
ln -s ~/.dotfiles/yabai/.config/limelight/limelightrc ~/.config/limelight/limelightrc && echo -e "limelight link created \n"

# git
[ -e ~/.gitconfig ] && rm ~/.gitconfig && echo -e "git conf removed"
[ -e ~/.gitmessage ] && rm ~/.gitmessage && echo -e "git msg removed"
[ -e ~/.gitignore ] && rm ~/.gitignore && echo -e "git ignore removed"
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig && echo -e "git conf link created"
ln -s ~/.dotfiles/git/.gitmessage ~/.gitmessage && echo -e "git msg link created"
ln -s ~/.dotfiles/git/.gitignore ~/.gitignore && echo -e "git ignore link created\n"

# alias
[ -e ~/.config/aliasrc ] && rm ~/.config/aliasrc && echo "alias removed"
ln -s ~/.dotfiles/alias/.config/aliasrc ~/.config/aliasrc && echo -e "alias link created \n"

# tmux
[ -e ~/.tmux.conf ] && rm ~/.tmux.conf && echo "tmux conf removed"
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf && echo -e "tmux conf link created \n"

# curl
[ -e ~/.curlrc ] && rm ~/.curlrc && echo "curl removed" 
ln -s ~/.dotfiles/curl/.curlrc ~/.curlrc && echo -e "curl link created \n"

# docker
[ -e ~/docker-compose.yml ] && rm ~/docker-compose.yml && echo "docker-compose removed"
ln -s ~/.dotfiles/docker/docker-compose.yml ~/docker-compose.yml && echo -e "docker-compose link created \n"

# nvim
[ -e ~/.config/nvim/init.vim ] && rm ~/.config/nvim/init.vim && echo "nvim removed"
[ -d ~/.config/nvim/plugin ] && rm -rf ~/.config/nvim/plugin && echo "nvim plugin removed"
[ -d ~/.config/nvim/lua ] && rm -rf ~/.config/nvim/lua && echo "nvim lua files removed"
ln -s ~/.dotfiles/nvim/.config/nvim/init.vim ~/.config/nvim/init.vim && echo "nvim link created"
ln -s ~/.dotfiles/nvim/.config/nvim/plugin ~/.config/nvim/plugin && echo -e "nvim plugin link created"
ln -s ~/.dotfiles/nvim/.config/nvim/lua ~/.config/nvim/lua && echo -e "nvim lua files link created \n"

echo "*** done [setup config sys link] ***"