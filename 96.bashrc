# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
if [ -f ~/git-prompt.sh ]; then
	. ~/git-prompt.sh
fi
if [ -f ~/git-completion.bash ]; then
	. ~/git-completion.bash
fi

# set env.PATH
export PATH=$PATH:~/bashscriptlet;

# set terminal
TERM=screen-256color-bce

# set PS1 prompt
red=$(tput    setaf  1)
green=$(tput  setaf  2)
blue=$(tput   setaf  4)
cyan=$(tput   setaf  6)
bold=$(tput   bold)
reset=$(tput  sgr0)
#PS1="\[\e[1;32m\][\u@\H \w]\t\[\e[0m\]$ "
PS1='\[$green\][\u@\H:\[$bold\]\W]\[$reset\]\[$cyan\]$(__git_ps1)\[$reset\] \$ '


# User specific aliases and functions

# set aliases
alias l='ls -halF'
alias +='pushd'
alias -- -='popd'
=(){ dirs -v; }
# git aliases
alias ga='git add'
alias gl='git log'
alias gs='git status'
alias gd='git diff -w'
alias gcm='git commit -m'
alias gam='git commit -am'
alias gb='git branch'
alias gck='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gps='git push'
alias gpl='git pull'
alias gcl='git clone'

# make it compatible with 256 color for colorschemes
alias tmux='tmux -2'
#alias vim='TERM=screen-256color-bce vim' # set in TERM
#alias vimdiff='TERM=screen-256color-bce vimdiff'

