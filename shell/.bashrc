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

# Bash prompt
PS1=''
PS1+='[\T]'
PS1+=' '
PS1+='\u@\h'
PS1+=' '
PS1+='\[\e[31m\]\W\[\e[m\]'
PS1+=' $ '

# Alias ls
alias ls='ls -AFGghl --group-directories-first --color'

