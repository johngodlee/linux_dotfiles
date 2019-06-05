#!/bin/bash

# Setup for a minimal linux installation using Ubuntu Minimal Server as the base
echo "Run as sudo"

# Install packages via apt
apt-get update
apt-get upgrade

apt -y install \
	git \
	ssh \
	wget \
	vim-gtk \
	w3m \
	mutt \
	pandoc \
	zathura \
	htop \
	aria2 \
	offlineimap \
	tmux \
	msmtp \
	vifm \
	pass \
	fzf \
	tree \
	xclip \
	youtube-dl \
	dmenu \
	ledger \
	urxvt \
	golang-go \
	drive \
	wicd \
	i3 \
	xclip \
	
# Install packages via pip
pip3 install \
	pirate-get \


# Dotfiles installation
git clone https://github.com/johngodlee/dotfiles_linux_min.git ~/dotfiles

~/dotfiles/dotfiles_install.sh


# Install vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall


# Install cron jobs
crontab ~/dotfiles/cron_jobs

# Install LaTeX
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

tar -xzf install-tl-unx.tar.gz

install-tl-unx-2*/./install-tl --profile=~/dotfiles/texlive.profile

rm install-tl-unx.tar.gz

