#!/bin/bash
#
# - Base - 
# Création du dossier webdav si inexistant
# Copie du fichier de conf webdav de base
#
clear

log_msg_green() {
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    NORMAL=$(tput sgr0)
    MSG="$1"
    let COL=$(tput cols)-${#MSG}+${#GREEN}+${#NORMAL}

    printf "%s%${COL}s" "$MSG" "$GREEN[OK]$NORMAL"
}

log_msg_red() {
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    NORMAL=$(tput sgr0)
    MSG="$1"
    let COL=$(tput cols)-${#MSG}+${#RED}+${#NORMAL}

    printf "%s%${COL}s" "$MSG" "$RED[NOK]$NORMAL"
}

INPUT=compte_webdav.csv
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

rm /etc/apache2/sites-available/webdav
rm /var/www/webdav/.passwd-base.dav
while read user_login password
do
		log_msg_green " * Suppression du compte WebDAV : $user_login ..."
		rm /var/www/webdav/$user_login
		rm /home/$user_login/.passwd.dav
		site="webdav-"$user_login
		a2dissite $site
		rm /etc/apache2/sites-available/webdav-$user_login
done < $INPUT
IFS=$OLDIFS
a2dissite webdav
rmdir /var/www/webdav/
log_msg_green "WebDAV desactive..."
service apache2 reload