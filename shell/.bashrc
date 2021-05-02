# Define editor
export EDITOR=nvim

# Add ~/bin to path for custom scriptss
export PATH=$HOME/bin:/usr/local/bin:/usr/sbin:$PATH

# append to history, don't overwrite each session
shopt -s histappend

# Set history length (lines)
HISTSIZE=1000 HISTFILESIZE=2000

## Bash prompt
PS1=$'\u250c' # elbow 
PS1+='\u@\h' # User@hostname 
PS1+=' ' # Space 
PS1+='\[\e[31m\]\w\[\e[m\]' # current dir 
PS1+='\n' # New line 
PS1+=$'\u2514' # elbow 
PS1+='$' # $ 
PS1+=' ' # Space

# Aliases
alias ls='ls -AFGghl --group-directories-first --color'

alias v="$EDITOR"

