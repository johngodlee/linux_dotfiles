# New machine installation

## Notes 

I like `tmux`, but dwm isn't really compatible with tmux. Can I possibly just use tmux for scrollback and copying in every terminal, but not use panes?

Do these also need to be installed for dwm to work?:  `libx11-dev` `libxft-dev` `libxinerama-dev` `xinit` `x11-xserver-utils`

## Install 

Install Debian latest stable: [URL]()

Update apt:

```
su
apt upgrade 
apt update
```

Install sudo:

```
su
apt install sudo
```

Configure sudo for user

```
su -
usermod -aG sudo johngodlee
exit
```

`logout` and log back in

Install some basics to get the xserver running:

```
sudo apt install\
	wget\
	git\
	ssh\
	stow\
	cc\
	xorg\
	feh
```

Deploy shell config:

```
cd 
git clone https://github.com/johngodlee/linux_dotfiles.git
cd ~/linux_dotfiles
stow shell
```

Install dwm and dmenu

```
cd ~/linux_dotfiles/dwm/dwm
sudo make clean install

cd ~/linux_dotfiles/dwm/dmenu
sudo make clean install

cd ~/linux_dotfiles/dwm/st
sudo make clean install
```

Run X:

```
startx
```

Install some other programs:

```
sudo apt install\
	bat\
	cmus\
	curl\
	drawio\
	fd\
	ffmpeg\
	fzf\
	gimp\
	graphicsmagick\
	htop\
	inkscape\
	isync\
	ledger\
	libreoffice\
	lynx\
	msmtp\
	neomutt\
	neovim\
	newsboat\
	nnn\
	pandoc\
	pass\
	qutebrowser\
	ripgrep\
	tmux\
	tree\
	vlc\
	w3m\
	xclip\
	youtube-dl\
	zathura
```







	



