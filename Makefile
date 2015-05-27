all : install
install :
	sudo cp aziz.sh /usr/bin/aziz
	sudo chmod 755 /usr/bin/aziz
uninstall :
	sudo rm -f /usr/bin/aziz
