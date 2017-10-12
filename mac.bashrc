
# set PS1 prompt
PS1="\[\e[0;32m\][\u@\h \w]\t\[\e[0m\]$ "

# set aliases
#alias l='ls -halF'
alias l='ls -halFG'
alias +='pushd'
alias -- -='popd'
=(){ dirs -v; }

