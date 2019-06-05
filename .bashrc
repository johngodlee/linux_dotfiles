# Put this in .bashrc for linux, mac is unique in sourcing terminal from source every window

# Add ~/bin to path for custom scripts
export PATH=/usr/local/bin:$HOME/bin:$PATH

# append to history, don't overwrite each session
shopt -s histappend

# Set history length (lines)
HISTSIZE=1000
HISTFILESIZE=2000

# Customise bash prompt:
## Function to check if previous command fails/succeeds
function __stat() { 
    if [ $? -eq 0 ]; then 
        echo -en "\e[32m[✔]\e[m " 
    else 
        echo -en "\e[31m[✘]\e[m " 
    fi 
}

## source script to have git branch in prompt
source ~/.git-prompt.sh

## Options for git-prompt
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_STATESEPARATOR=" "

## Bash prompt
PS1='┏'	# Elbow
PS1+='[\T]'	# Time
PS1+=' '	# Space 
PS1+='\u@\h'	# User@hostname
PS1+=' ' 	# Space
PS1+='\[\e[31m\]\w\[\e[m\]'	# current dir
PS1+=' '	# Space
PS1+='\[\e[96m\]$(__git_ps1 "[%s]")'	# git branch
PS1+=' '	# Space
PS1+='\[\e[m\]$(__stat)'	# Previous command success
PS1+='\n'	# New line
PS1+='┗'	# Elbow
PS1+='$'	# $
PS1+=' '	# Space

# Open to root as default
cd ~ 

# Alias `ls -G` as `ls` to force colours in `ls`
alias ls='ls -lG -A -F'

# Use gpg key as default
export GPGKEY=E79A8F461D9BC674 

# Use vim as default $EDITOR
export EDITOR=vim
