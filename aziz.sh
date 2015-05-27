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

function action() {
    case $1 in
    1 ) echo -e "Il est ${cyanclair}`date +'%H:%M:%S'`${neutre}" ;;
    2 ) echo "Je met à jour le système"
        zenity --notification --window-icon="info" --text="Aziz met à jour le système"
        sudo apt-get update
        sudo apt-get upgrade
        sudo apt-get dist-update
    ;;
    3 ) echo "Je nettoie APT"
        zenity --notification --window-icon="info" --text="Aziz nettoie APT"
        sudo apt-get autoclean
        sudo apt-get clean
        sudo apt-get autoremove
    ;;
    4 ) echo "Je vide la corbeille"
        zenity --notification --window-icon="info" --text="Aziz vide la corbeille"
        rm -r -f ~/.local/share/Trash/files/*
    ;;
    5 ) echo "Je supprime les miniatures des images"
        zenity --notification --window-icon="info" --text="Aziz supprime les miniatures des images"
        find ~/.thumbnails -type f -atime +7 -delete
    ;;
    6 ) echo "Je supprime les fichiers de sauvegarde"
        zenity --notification --window-icon="info" --text="Aziz supprime les fichiers de sauvegarde"
        find ~/ -name '*~' -print0 | xargs -0 rm
    ;;
    7 ) echo "Je supprime les fichiers temporaires d'Adobe Flash Player"
        zenity --notification --window-icon="info" --text="Aziz supprime les fichiers temporaires d'Adobe Flash Player"
        rm -r ~/.adobe/Flash_Player;rm -r ~/.macromedia/Flash_Player
    ;;
    esac
    
    sleep 60
    nombreAction=$RANDOM
    let "nombreAction %= 11"
    action $nombreAction
}
echo -e "${jaune}Aziz Lumière !!${neutre}"
echo -e "Bonjour ${cyanclair}$USER${neutre}"
echo -e "Nous somme le ${cyanclair}`date +'%A %d %B %Y'`${neutre}"
nombreAction=$RANDOM
let "nombreAction %= 7"
action $nombreAction
