# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="mns"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/node_modules/.bin:/usr/local/bin:/usr/local/sbin/:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl

export C=/media/c
export D=/media/d
export DESKTOP=/media/d/Users/Ivan/Desktop
export JAVA_HOME=/opt/java
export PATH=${PATH}:${JAVA_HOME}/bin:/opt/ruby1.8/bin/:${HOME}/perl5/bin

eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

alias boar='nocorrect boar'
alias npm='nocorrect npm'
alias pip='nocorrect pip'
source /usr/bin/virtualenvwrapper.sh

# git
alias gl='git log'
alias gpl='git pull'
alias gp='git push'
alias gpom='git push origin master'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias pull='git pull origin master'
alias g='git'

alias psu='ps -fu $USER'

# Mercurial
alias hs='hg st'
alias hd='hg diff --color=always | less -R'
alias hh='hg glog -l 5'
alias hqs='hg qser'
alias hqt='hg qtop'
alias hqd='hg qdiff --color=always | less -R'
alias hq-='hg qpop'
alias hq+='hg qpush'
