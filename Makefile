all: vim zsh tmux inputrc

submodule:
	git submodule init
	git submodule update

vim: submodule
	ln -s -f ${PWD}/.vimrc ${HOME}/.vimrc
	ln -s -f ${PWD}/.vim ${HOME}/.vim
	if [ ! -d ${HOME}/.vim-backup ]; then\
		mkdir ${HOME}/.vim-backup; \
	fi

zsh: submodule
	ln -s -f ${PWD}/.zshenv ${HOME}/.zshenv
	ln -s -f ${PWD}/.zshrc ${HOME}/.zshrc
	ln -s -f ${PWD}/.zsh ${HOME}/.zsh

tmux: submodule
	ln -s -f ${PWD}/.tmux.conf ${HOME}/.tmux.conf

inputrc:
	ln -s -f ${PWD}/.inputrc ${HOME}/.inputrc
