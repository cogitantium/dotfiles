#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -laph --color=auto'
PS1='[\u@\h \W]\$ '

# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit -m '
alias gd='git diff'
alias gch='git checkout'
alias gr='git remote'
