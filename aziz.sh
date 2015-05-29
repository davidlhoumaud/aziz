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
currentAction_old=0
function action() {
    if [[ $currentAction -eq $1 || $currentAction_old -eq $1 ]]; then
        echo -e "${rougefonce}Nouvelle action...${neutre}"
        nombreAction=$RANDOM
        let "nombreAction %= 9"
        action $nombreAction $2
    else
        currentAction=$1
        if [[ $currentAction != $currentAction_old ]]; then
            currentAction_old=$currentAction
        fi
        case $currentAction in
        1 ) echo "Je vais mettre à jour le système via APT"
            zenity --question --timeout=$2 --title="Aziz" --window-icon="info" --text="Aziz va mettre à jour le système via APT\nVoulez-vous vraiment continuer ?"
            if [[ $? -eq 0 ]]; then
                xterm -e "sudo apt-get update;sudo apt-get upgrade;sudo apt-get dist-upgrade"
            fi
            sleep $2
        ;;
        2 ) echo "Je vais supprimer les paquets inutilisés de APT"
            zenity --question --timeout=$2 --title="Aziz" --window-icon="info" --text="Aziz va supprimer les paquets inutilisés de APT\nVoulez-vous vraiment continuer ?"
            if [[ $? -eq 0 ]]; then
                xterm -e sudo apt-get autoremove
            fi
            sleep $2
        ;;
        3 ) echo "Je vais nettoyer APT"
            zenity --question --timeout=$2 --title="Aziz" --window-icon="info" --text="Aziz va nettoyer APT\nVoulez-vous vraiment continuer ?"
            if [[ $? -eq 0 ]]; then
                xterm -e "sudo apt-get autoclean;sudo apt-get clean"
            fi
            sleep $2
        ;;
        4 ) echo "Je vais vider la corbeille"
            zenity --question --timeout=$2 --title="Aziz" --window-icon="info" --text="Aziz va vider la corbeille\nVoulez-vous vraiment continuer ?"
            if [[ $? -eq 0 ]]; then
                xterm -e "rm -r -f ~/.local/share/Trash/files/*"
            fi
            sleep $2
        ;;
        5 ) echo "Je vais supprimer les miniatures des images"
            zenity --question --timeout=$2 --title="Aziz" --window-icon="info" --text="Aziz va supprimer les miniatures des images\nVoulez-vous vraiment continuer ?"
            if [[ $? -eq 0 ]]; then
                xterm -e "find ~/.thumbnails -type f -atime +7 -delete"
            fi
            sleep $2
        ;;
        6 ) echo "Je vais supprimer les fichiers de sauvegarde"
            zenity --question --timeout=$2 --title="Aziz" --window-icon="info" --text="Aziz va supprimer les fichiers de sauvegarde\nVoulez-vous vraiment continuer ?"
            if [[ $? -eq 0 ]]; then
                xterm -e "find ~/ -name '*~' -print0 | xargs -0 rm"
            fi
            sleep $2
        ;;
        7 ) echo "Espace disque disponible"
            echo -e "${jaune}`df -h | grep '^/'`${neutre}"
            echo "Mémoire RAM Utilisé"
            echo -e "${jaune}`cat /proc/meminfo`${neutre}"
            df -h | grep '^/' | zenity --text-info --timeout=$2 --title="Espace disque disponible :" --window-icon="info"
            cat /proc/meminfo | zenity --text-info --timeout=$2 --title="Mémoire RAM Utilisé :" --window-icon="info"
            sleep $2
        ;;
        8 ) echo "Nettoyage du cache de la mémoire RAM"
            zenity --question --timeout=$2 --title="Aziz" --window-icon="info" --text="Aziz va nettoyer le cache de la mémoire RAM\nVoulez-vous vraiment continuer ?"
            if [[ $? -eq 0 ]]; then
                xterm -e "sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches"
                cat /proc/meminfo | zenity --text-info --timeout=$2 --title="Mémoire RAM Utilisé :" --window-icon="info"
            fi
            sleep $2
        ;;
        esac
        nombreAction=$RANDOM
        let "nombreAction %= 9"
        action $nombreAction $2
    fi
}

echo -e "${jaune}Aziz Lumière !!${neutre}"
echo -e "Bonjour ${cyanclair}$USER${neutre}"
echo -e "Nous somme le ${cyanclair}`date +'%A %d %B %Y'`${neutre}"
echo -e "Il est ${cyanclair}`date +'%H:%M:%S'`${neutre}"
nombreAction=$RANDOM
let "nombreAction %= 9"
if [[ $1 != "" ]];then
    tim=$1
else
    tim=60 #1 minute par défaut
fi
action $nombreAction $tim
exit
