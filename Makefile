SHELL        := /bin/bash
DOTFILESDIR   = ~/.files
DOTFILESREPO  = ssh://git@github.com/imiric/dotfiles.git
PYTHON        = $(shell which python2.7)
EASY_INSTALL  = $(shell which easy_install-2.7)
VIM           = $(shell which vim)
REQUIREMENTS  = zsh git hg vim python2.7 easy_install-2.7 ruby

.PHONY: install system base python zsh tmux powerline vim mercurial git wmfs

all: python zsh tmux powerline vim mercurial git misc wmfs


ifneq (,$(findstring Arch,$(shell cat /etc/issue)))
 DISTRO := arch
else
ifneq (,$(findstring Ubuntu,$(shell cat /etc/issue)))
 DISTRO := ubuntu
endif
endif

define arch_install
	pacman -Sy git mercurial zsh vim tmux ruby python2 python2-distribute
endef

define ubuntu_install
	$(info Remember to activate the universe repository)
	apt-get update
	apt-get install git mercurial zsh vim tmux ruby python-setuptools ruby1.9.1-dev build-essential
endef


define REQ_template
 $(1)_exists: ; @which $(1) > /dev/null
endef

$(foreach req, $(REQUIREMENTS), $(eval $(call REQ_template, $(req))))


define link
	test -L $2 || ln -s $1 $2 ;
endef


install:
	$(info This needs superuser privileges!)
	$(call $(DISTRO)_install)

system: install python2.7_exists vim_exists easy_install-2.7_exists
	$(info This needs superuser privileges!)
	$(call link, $(PYTHON), /usr/bin/python)
	$(call link, $(VIM), /usr/bin/vi)
	$(EASY_INSTALL) pip
	pip install virtualenv virtualenvwrapper pyflakes
	# Installs keyboard layout
	# FIXME: $(DOTFILESDIR) equals /root/.files here. Use absolute path above?
	#test -d /usr/share/X11/xkb/symbols && $(call link, $(DOTFILESDIR)/xkb/us-intl-gajscript, /usr/share/X11/xkb/symbols/us-intl-gajscript)
	#test -f /usr/share/X11/xkb/rules/evdev.xml && patch -p0 < $(DOTFILESDIR)/xkb/evdev.xml.patch
	#test -f /usr/share/X11/xkb/rules/evdev.lst && patch -p0 < $(DOTFILESDIR)/xkb/evdev.lst.patch

base: $(DOTFILESDIR)

$(DOTFILESDIR): git_exists
	test -d $(DOTFILESDIR) || git clone $(DOTFILESREPO) $(DOTFILESDIR)

python: base python2.7_exists
	mkdir -p ~/.pythonlib
	for f in $(DOTFILESDIR)/python/*.py; do \
		test -L ~/.pythonlib/`basename $$f` || ln -s "$$f" ~/.pythonlib/ ; \
	done

zsh: base zsh_exists
	test -d ~/.oh-my-zsh || git clone git://github.com/sjl/oh-my-zsh.git ~/.oh-my-zsh ; \
	$(call link, $(DOTFILESDIR)/zsh/mns.zsh-theme, ~/.oh-my-zsh/themes/mns.zsh-theme)
	$(call link, $(DOTFILESDIR)/zsh/.zshrc, ~/.zshrc)
	$(call link, $(DOTFILESDIR)/zsh/.zshenv, ~/.zshenv)

tmux: base
	$(call link, $(DOTFILESDIR)/tmux/.tmux.conf, ~/.tmux.conf)

powerline: base
	mkdir -p ~/.config/
	$(call link, $(DOTFILESDIR)/powerline, ~/.config/powerline)

vim: base vim_exists ruby_exists
	$(call link, $(DOTFILESDIR)/vim/.vimrc, ~/.vimrc)
	test -d ~/.vim/bundle/vundle || (mkdir -p ~/.vim/bundle && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle)
	test -f ~/.vim/colors/xoria256.vim || (mkdir -p ~/.vim/colors && wget -O ~/.vim/colors/xoria256.vim "http://www.vim.org/scripts/download_script.php?src_id=15762")
	$(call link, $(DOTFILESDIR)/vim/snippets, ~/.vim/snippets)
	test `ls ~/.vim/bundle/ | wc -l` -gt 5 || vim +BundleInstall +qall!
	# Command-T setup
	test -f ~/.vim/bundle/Command-T/ruby/command-t/ext.so || (cd ~/.vim/bundle/Command-T/ruby/command-t/ && ruby extconf.rb && make)

mercurial: base hg_exists
	test -d ~/.hgext/hgshelve || (mkdir -p ~/.hgext && hg clone https://bitbucket.org/astiob/hgshelve ~/.hgext/hgshelve)
	test -d ~/.hgext/hg-prompt || hg clone https://bitbucket.org/sjl/hg-prompt ~/.hgext/hg-prompt
	test -d ~/.hgext/hg-contains || hg clone https://bitbucket.org/resi/hg-contains ~/.hgext/hg-contains
	test -d ~/.hgext/mercurial-cli-templates || hg clone https://bitbucket.org/sjl/mercurial-cli-templates ~/.hgext/mercurial-cli-templates
	$(call link, $(DOTFILESDIR)/mercurial/.hgrc, ~/.hgrc)

git: base
	$(call link, $(DOTFILESDIR)/git/.gitconfig, ~/.gitconfig)

teamocil: base ruby_exists
	gem install teamocil
	$(call link, $(DOTFILESDIR)/.teamocil, ~/.teamocil)

wmfs: base
	test -d ~/.config/wmfs || (mkdir -p ~/.config/wmfs)
	$(call link, $(DOTFILESDIR)/wmfs2/wmfsrc, ~/.config/wmfs/wmfsrc)
	$(call link, $(DOTFILESDIR)/wmfs2/conkyrc, ~/.config/wmfs/conkyrc)

misc: base
	$(call link, $(DOTFILESDIR)/.xbindkeysrc, ~/.xbindkeysrc)
