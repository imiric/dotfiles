# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="mns"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"
compctl -g '~/.teamocil/*(:t:r)' teamocil

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git django ruby npm pip node command-coloring)

setopt autocd

source $ZSH/oh-my-zsh.sh

#eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
alias boar='nocorrect boar'
alias npm='nocorrect npm'
alias pip='nocorrect pip'
alias cram='nocorrect cram'
[ -r `which virtualenvwrapper.sh` ] && source `which virtualenvwrapper.sh`

# general
alias man='LC_ALL=C LANG=C man'
alias f=finger
alias ls='ls --color --group-directories-first'
alias ll='ls -al'
alias l='ls -alh'

alias t="python ~/.virtualenvs/t-fork/src/t-fork/t.py --task-dir $D/Users/Ivan/Dropbox/Work/tasks --list tasks"

alias tmc="teamocil --here"

alias md='mkdir -p'
alias rd=rmdir
alias ..='cd ..'
alias ...='cd ../..'
alias pu='pushd .'
alias po='popd'
alias dt='date +"%Y%m%d"'
alias da='date +"%Y-%m-%d"'
alias dux='du -sk ./* | sort -n | awk '\''BEGIN{ pref[1]="K"; pref[2]="M"; pref[3]="G";} { total = total + $1; x = $1; y = 1;           while( x > 1024 ) { x = (x + 1023)/1024; y++; } printf("%g%s\t%s\n",int(x*10)/10,pref[y],$2); } END { y = 1; while( total > 1024 )      { total = (total + 1023)/1024; y++; } printf("Total: %g%s\n",int(total*10)/10,pref[y]); }'\'''
alias psu='ps -fu $USER'

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
alias hb='hg branches'
alias qs='hg qser'
alias qt='hg qtop'
alias qd='hg qdiff --color=always | less -R'
alias qds='hg qdiff --stat'
alias q-='hg qpop'
alias q+='hg qpush'
function mqp() { test -d '.hg/patches/.hg' && hg push -R .hg/patches }

# Arch
alias packs='sudo /usr/bin/pacman -Sy linux-pae-headers linux-pae pacman --needed 2>/dev/null && packer'
alias pai='packs -S'
alias pas='packer -Ss'
alias pau='packs -Su'

alias 'pipcheck'="pip freeze --local | cut -d = -f 1 | xargs -n 1 pip search | grep -B2 'LATEST:'"

source ${HOME}/.zshenv

bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
#source /usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
