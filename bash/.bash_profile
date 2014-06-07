export PATH=$HOME/bin:$HOME/include:/usr/local/sbin:/usr/local/bin:$PATH:/usr/local/mysql/bin:/usr/local/opt/ruby/bin

source $HOME/bin/bash/colors
source $HOME/bin/bash/functions
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
PS1='
\[${CYAN_FG}\][\[${MAGENTA_FG}\]\u@\h\[${CYAN_FG}\]]\[${RESET}\]
\[${RED_FG}\][\[${GREEN_FG}\]\w\[${RED_FG}\]]
\[${MAGENTA_FG}\]:]\[${RESET}\] \[${CYAN_FG}\]=>\[${RESET}\] \[${MAGENTA_FG}\]$(parse_git_branch)\[${RESET}\]$ '
export CODE=$HOME/dev/code
export NODE_PATH=:/usr/local/lib/node_modules
alias ks="ls"
alias l="ls"
alias ..="cd .."

if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
fi

if [[ -f $HOME/bin/bash/extras ]]; then
	source $HOME/bin/bash/extras
fi

export HISTSIZE=2500
export HISTFILESIZE=10000
