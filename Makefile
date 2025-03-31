# Default commands to use
APT = /usr/bin/apt
CURL = /usr/bin/curl
VIM = /usr/bin/vim

pyflakes:
	sudo $(APT) install python3-pyflakes

ag:
	sudo $(APT) install silversearcher-ag

vim-plug:
	$(CURL) -fLo ~/.vim/autoload/plug.vim --create-dirs \
	  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

plug-setup:
	$(VIM) -c "PlugInstall | qa!"

