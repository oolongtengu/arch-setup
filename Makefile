default: install-packages link-config set-shell

install-packages: add-repositories
	yaourt -Sy
	yaourt -S --needed termite
	yaourt -S --needed --noconfirm `cat packages.txt`

add-repositories: add-infinality-key
	sudo cat repositories.txt >> /etc/pacman.conf

add-infinality-key:
	sudo dirmngr &
	sleep 1
	killall dirmngr
	sudo pacman-key -r 962DDE58
	sudo pacman-key --lsign-key 962DDE58

link-config:
	stow --restow `ls -d */`

set-shell:
	chsh -s `which fish`