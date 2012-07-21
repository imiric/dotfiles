SHELL        := /bin/bash
DOTFILESDIR   = ~/.files
DOTFILESREPO  = https://imiric@bitbucket.org/imiric/dotfiles.git
PYTHON        = $(shell which python2.7)
EASY_INSTALL  = $(shell which easy_install-2.7)
VIM           = $(shell which vim)

$(info To install the required packages on Ubuntu (enable universe), run:)
$(info sudo apt-get install git mercurial zsh vim tmux ruby python-setuptools ruby1.8-dev build-essential)

.PHONY: python zsh tmux vim mercurial git ssh

all: python zsh tmux vim mercurial git ssh

zsh_exists:          ; @which zsh > /dev/null
git_exists:          ; @which git > /dev/null
hg_exists:           ; @which hg > /dev/null
vim_exists:          ; @which vim > /dev/null
python_exists:       ; @which python2.7 > /dev/null
ruby_exists:         ; @which ruby > /dev/null
easy_install_exists: ; @which easy_install-2.7 > /dev/null

define link
	test -L $2 || ln -s $1 $2 ;
endef

system: python_exists vim_exists easy_install_exists
	$(info This needs superuser privileges!)
	$(call link, $(PYTHON), /usr/bin/python)
	$(call link, $(VIM), /usr/bin/vi)
	$(EASY_INSTALL) pip
	pip install virtualenv virtualenvwrapper

base: $(DOTFILESDIR)

$(DOTFILESDIR): git_exists
	test -d $(DOTFILESDIR) || git clone $(DOTFILESREPO) $(DOTFILESDIR)

python: base python_exists
	mkdir -p ~/.pythonlib
	for f in $(DOTFILESDIR)/python/*.py; do \
		test -L ~/.pythonlib/`basename $$f` || ln -s "$$f" ~/.pythonlib/ ; \
	done

zsh: base zsh_exists
	test -d ~/.oh-my-zsh || git clone git://github.com/sjl/oh-my-zsh.git ~/.oh-my-zsh ; \
	$(call link, $(DOTFILESDIR)/zsh/mns.zsh-theme, ~/.oh-my-zsh/themes/mns.zsh-theme)
	$(call link, $(DOTFILESDIR)/zsh/.zshrc, ~/.zshrc)

tmux: base
	$(call link, $(DOTFILESDIR)/tmux/.tmux.conf, ~/.tmux.conf)

vim: base vim_exists ruby_exists
	$(call link, $(DOTFILESDIR)/vim/.vimrc, ~/.vimrc)
	test -d ~/.vim/bundle/vundle || (mkdir -p ~/.vim/bundle && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle)
	test -f ~/.vim/colors/xoria256.vim || (mkdir -p ~/.vim/colors && wget -O ~/.vim/colors/xoria256.vim "http://www.vim.org/scripts/download_script.php?src_id=15762")
	$(call link, $(DOTFILESDIR)/vim/snippets, ~/.vim/snippets)
	test `ls ~/.vim/bundle/ | wc -l` -gt 5 || vim +BundleInstall +qall!
	# Command-T setup
	test -f ~/.vim/bundle/Command-T/ruby/command-t/ext.so || (cd ~/.vim/bundle/Command-T/ruby/command-t/ && ruby extconf.rb && make)

mercurial: base hg_exists
	test -d ~/.hgext/hgshelve || (mkdir -p ~/.hgext && hg clone https://bitbucket.org/tksoh/hgshelve ~/.hgext/hgshelve)
	test -d ~/.hgext/hg-prompt || hg clone https://bitbucket.org/sjl/hg-prompt ~/.hgext/hg-prompt
	test -d ~/.hgext/hg-contains || hg clone https://bitbucket.org/resi/hg-contains ~/.hgext/hg-contains
	test -d ~/.hgext/mercurial-cli-templates || hg clone https://bitbucket.org/sjl/mercurial-cli-templates ~/.hgext/mercurial-cli-templates
	$(call link, $(DOTFILESDIR)/mercurial/.hgrc, ~/.hgrc)

git: base
	$(call link, $(DOTFILESDIR)/git/.gitconfig, ~/.gitconfig)

ssh: base
	mkdir -p ~/.ssh
	$(call link, $(DOTFILESDIR)/ssh/config, ~/.ssh/config)
