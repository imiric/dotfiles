DOTFILESDIR="~/.files"
# bootstrap
git clone ssh://imiric@imiric.name/~/repos/dotfiles.git "$DOTFILESDIR"

# system
sudo ln -s /usr/bin/python2 /usr/bin/python
sudo rm /usr/bin/vi && ln -s /usr/bin/vim /usr/bin/vi

# python
sudo easy_install-2.7 pip
sudo pip install virtualenv virtualenvwrapper

# zsh
git clone git://github.com/sjl/oh-my-zsh.git ~/.oh-my-zsh
ln -s "$DOTFILESDIR"/zsh/mns.theme ~/.oh-my-zsh/themes/
ln -s "$DOTFILESDIR"/zsh/.zshrc ~/

# tmux
ln -s "$DOTFILESDIR"/tmux/.tmuxrc ~/

# screen
ln -s "$DOTFILESDIR"/screen/.screenrc ~/

# vim
ln -s "$DOTFILESDIR"/vim/.vimrc ~/
mkdir -p ~/.vim/bundle && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
mkdir -p ~/.vim/colors && wget -O ~/.vim/colors/xoria256.vim "http://www.vim.org/scripts/download_script.php?src_id=15762"
# run inside vim
# :BundleInstall

# mercurial
mkdir -p ~/.hgext && hg clone https://bitbucket.org/tksoh/hgshelve ~/.hgext/hgshelve
hg clone https://bitbucket.org/sjl/hg-prompt ~/.hgext/hg-prompt
hg clone https://bitbucket.org/resi/hg-contains ~/.hgext/hg-contains
hg clone https://bitbucket.org/sjl/mercurial-cli-templates ~/.hgext/mercurial-cli-templates
ln -s "$DOTFILESDIR"/mercurial/.hgrc ~/

# git
ln -s "$DOTFILESDIR"/git/.gitconfig ~/

# ssh
mkdir -p ~/.ssh && ln -s "$DOTFILESDIR"/ssh/config ~/.ssh/
