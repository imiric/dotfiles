export C=/media/c
export D=/media/d
export DESKTOP=/media/c/Users/Ivan/Desktop
export JAVA_HOME=/opt/java
export PATH=${HOME}/node_modules/.bin:${PATH}:${JAVA_HOME}/bin:${HOME}/.gem/ruby/2.0.0/bin:${HOME}/.gem/ruby/1.9.1/bin:${HOME}/perl5/bin:${HOME}/.local/bin
export CDPATH="$CDPATH:~:/media/c/Users/Ivan"
export PYTHONPATH=$PYTHONPATH:~/.pythonlib
#export VIRTUAL_ENV_DISABLE_PROMPT=1
export CHROMIUM_USER_FLAGS="--disk-cache-dir=/tmp --disk-cache-size=52428800"

export EDITOR=/usr/bin/vim

eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"
alias v='f -e vim'
