#!/bin/bash

noir='\e[0;30m'
gris='\e[1;30m'
rougefonce='\e[0;31m'
rose='\e[1;31m'
vertfonce='\e[0;32m'
vertclair='\e[1;32m'
orange='\e[0;33m'
jaune='\e[1;33m'
bleufonce='\e[0;34m'
bleuclair='\e[1;34m'
violetfonce='\e[0;35m'
violetclair='\e[1;35m'
cyanfonce='\e[0;36m'
cyanclair='\e[1;36m'
grisclair='\e[0;37m'
blanc='\e[1;37m'
neutre='\e[0;m'

currentAction=0
function action() {
    if [[ $currentAction -eq $1 ]]; then
        nombreAction=$RANDOM
        let "nombreAction %= 7"
        action $nombreAction $2
    else
        currentAction=$1
        case $currentAction in
        1 ) echo "Je vais mettre à jour le système via APT"
            zenity --notification --window-icon="info" --text="Aziz va mettre à jour le système via APT"
            zenity --question --title="Aziz" --window-icon="info" --text="Voulez-vous vraiment continuer ?"
            if [[ $? -eq 0 ]]; then
                xterm -e "sudo apt-get update;sudo apt-get upgrade;sudo apt-get dist-upgrade"
            fi
        ;;
        2 ) echo "Je vais supprimer les paquets inutilisés de APT"
            zenity --notification --window-icon="info" --text="Aziz va supprimer les paquets inutilisés de APT"
            zenity --question --title="Aziz" --window-icon="info" --text="Voulez-vous vraiment continuer ?"
            if [[ $? -eq 0 ]]; then
                xterm -e sudo apt-get autoremove
            fi
        ;;
        3 ) echo "Je vais nettoyer APT"
            zenity --notification --window-icon="info" --text="Aziz va nettoyer APT"
            zenity --question --title="Aziz" --window-icon="info" --text="Voulez-vous vraiment continuer ?"
            if [[ $? -eq 0 ]]; then
                xterm -e "sudo apt-get autoclean;sudo apt-get clean"
            fi
        ;;
        4 ) echo "Je vais vider la corbeille"
            zenity --notification --window-icon="info" --text="Aziz va vider la corbeille"
            zenity --question --title="Aziz" --window-icon="info" --text="Voulez-vous vraiment continuer ?"
            if [[ $? -eq 0 ]]; then
                xterm -e "rm -r -f ~/.local/share/Trash/files/*"
            fi
        ;;
        5 ) echo "Je vais supprimer les miniatures des images"
            zenity --notification --window-icon="info" --text="Aziz va supprimer les miniatures des images"
            zenity --question --title="Aziz" --window-icon="info" --text="Voulez-vous vraiment continuer ?"
            if [[ $? -eq 0 ]]; then
                xterm -e "find ~/.thumbnails -type f -atime +7 -delete"
            fi
        ;;
        6 ) echo "Je vais supprimer les fichiers de sauvegarde"
            zenity --notification --window-icon="info" --text="Aziz va supprimer les fichiers de sauvegarde"
            zenity --question --title="Aziz" --window-icon="info" --text="Voulez-vous vraiment continuer ?"
            if [[ $? -eq 0 ]]; then
                xterm -e "find ~/ -name '*~' -print0 | xargs -0 rm"
            fi
        ;;
        7 ) echo "Je vais supprimer les fichiers temporaires d'Adobe Flash Player"
            zenity --notification --window-icon="info" --text="Aziz va supprimer les fichiers temporaires d'Adobe Flash Player"
            zenity --question --title="Aziz" --window-icon="info" --text="Voulez-vous vraiment continuer ?"
            if [[ $? -eq 0 ]]; then
                xterm -e "rm -r ~/.adobe/Flash_Player;rm -r ~/.macromedia/Flash_Player"
            fi
        ;;
        esac
        
        sleep $2
        nombreAction=$RANDOM
        let "nombreAction %= 7"
        action $nombreAction $2
    fi
}

echo -e "${jaune}Aziz Lumière !!${neutre}"
echo -e "Bonjour ${cyanclair}$USER${neutre}"
echo -e "Nous somme le ${cyanclair}`date +'%A %d %B %Y'`${neutre}"
echo -e "Il est ${cyanclair}`date +'%H:%M:%S'`${neutre}"
nombreAction=$RANDOM
let "nombreAction %= 7"
if [[ $1 != "" ]];then
    tim=$1
else
    tim=300 #5sec par défaut
fi
action $nombreAction $tim
exit
