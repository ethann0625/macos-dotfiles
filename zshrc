# prompt
#export PS1=$'%{\e[1;91m%}[%{\e[1;93m%}%n%{\e[1;91m%}] %{\e[34m%}%~%{\e[1;91m%} ::%{\e[95m%}~>%{\e[0m%} '
autoload -U colors && colors
PS1="%B%F{red}[%F{yellow}%n%F{red}]%f %F{blue}%~%F{red} ::%F{magenta}~>%f%b "

# aliases
alias ls='ls --color=auto'
alias prg='tmux new-session \; source-file ~/.config/tmux/programming.conf'
alias sv='source ./venv/bin/activate'
alias vim='nvim'

# vi keybindings
bindkey -v

# Other
setopt AUTO_CD

# Ctrl+L clear
bindkey '^L' clear-screen

# completion system
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# java
export JAVA_HOME="/usr/local/opt/openjdk"
export PATH="$JAVA_HOME/bin:$PATH"

# openjdk include path
export CPPFLAGS="-I/usr/local/opt/openjdk/include"
neofetch

# Created by `pipx` on 2026-04-28 21:21:19
export PATH="$PATH:/Users/ethan/.local/bin"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export PATH="/Library/TeX/texbin:$PATH"
