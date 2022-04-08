ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

install_mac:
	brew install git
	make symlink

clean_mac:
	brew uninstall git
	make symlink

install_fedora:
	sudo dnf install git
	make symlink

clean_fedora:
	sudo dnf remove git
	make symlink_clean

install_arch:
	sudo pacman -S git
	make symlink

clean_arch:
	sudo pacman -R git
	make symlink_clean

symlink:
	ln -s $(ROOT_DIR)/gitconfig        ~/.gitconfig
	ln -s $(ROOT_DIR)/gitignore_global ~/.gitignore_global

symlink_clean:
	rm ~/.gitconfig
	rm ~/.gitconfig_global
