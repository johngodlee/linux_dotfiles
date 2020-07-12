# Define editor
export EDITOR=vim

# Set vi mode
set -o vi

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
PS1=$'\u250c'
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
PS1+=$'\u2514'	# Space
PS1+='$'	# $
PS1+=' '	# Space

# Alias ls
alias ls='ls -AFGghl --group-directories-first --color'

alias v="vim"

