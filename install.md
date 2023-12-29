# New machine installation

## Notes 

Launch tmux default session in every new terminal window. Use tmux to allow persistent sessions.  

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

Install some basics:

```
sudo apt install\
	wget\
	git\
	ssh\
	stow\
	gcc\
	make\
	xorg\
	libx11-dev\
	libxft-dev\
	libxinerama-dev\
	feh\
	bspwm\
	sxhkd\
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
	zathura\
	rxvt-unicode
```

Deploy shell config:

```
cd 
git clone https://github.com/johngodlee/linux_dotfiles.git
cd ~/linux_dotfiles
stow shell tmux bspwm git wallpapers zathura
```

Run X:

```
startx
```







	



