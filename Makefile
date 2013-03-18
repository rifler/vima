VIMA_DIR = ~/.vima
VIMRC = .vimrc
VUNDLE_DIR = bundle/vundle
BACKUP_PREFIX = .vimi.bak
DOT_VIM = .vim

vima: echostart bundle-install
	@echo "\nSuccess"

echostart:
	@echo "Start installing vima\n"

bundle-install: symlinks vundle
	-vim +BundleInstall +quitall

symlinks: backup
	@ln -s $(VIMA_DIR)/$(VIMRC) ~/$(VIMRC) && \
	ln -s $(VIMA_DIR)/$(DOT_VIM) ~/$(DOT_VIM) && \
	echo "Create symlinks\n~/$(VIMRC) -> $(VIMA_DIR)/$(VIMRC)\n~/$(DOT_VIM) -> $(VIMA_DIR)/$(DOT_VIM)"

backup: remove-prev-backup
	@test ! -e ~/$(DOT_VIM) || \
	(\
		mv ~/$(DOT_VIM) ~/$(DOT_VIM)$(BACKUP_PREFIX); \
		echo "Vima makes backup of your current ~/$(DOT_VIM) directory to ~/$(DOT_VIM)$(BACKUP_PREFIX)\n" \
	)

	@test ! -e ~/.vimrc || \
	( \
		mv ~/$(VIMRC) ~/$(VIMRC)$(BACKUP_PREFIX); \
		echo "Vima makes backup of your current ~/$(VIMRC) to ~/$(VIMRC)$(BACKUP_PREFIX)\n" \
	)

remove-prev-backup:
	@test ! -e ~/$(DOT_VIM)$(BACKUP_PREFIX) || \
	rm -fr ~/$(DOT_VIM)$(BACKUP_PREFIX)

	@test ! -e ~/$(VIMRC)$(BACKUP_PREFIX) || \
	rm -f ~/$(VIMRC)$(BACKUP_PREFIX)

vundle:
	@test ! -e $(VIMA_DIR)/$(DOT_VIM)/$(VUNDLE_DIR) || \
	rm -rf $(VIMA_DIR)/$(DOT_VIM)/$(VUNDLE_DIR)

	@echo "Clone Vundle from github.com..."
	@git clone git://github.com/gmarik/vundle.git $(VIMA_DIR)/$(DOT_VIM)/$(VUNDLE_DIR) > /dev/null
	@echo "Done.\n"
