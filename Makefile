all : install
install :
	sudo cp aziz.sh /usr/bin/aziz
	sudo cp aziz.desktop /usr/share/applications/aziz.desktop
	sudo chmod 755 /usr/bin/aziz
	sudo chmod 755 /usr/share/applications/aziz.desktop
uninstall :
	sudo rm -f /usr/bin/aziz
	sudo rm -f /usr/share/applications/aziz.desktop
