# config for unattended upgrades
sudo dpkg-reconfigure -priority=low unattended-upgrades

# change password after homeean installation
read -p "Aus Sicherheitsgründen sollte das Standard-Passwort geändert werden. Möchtest Du es jetzt ändern? [y/n]: "
[ "$REPLY" != "y" ] || passwd

# done :)
echo "Die Installation ist abgeschlossen."
echo "Besuche https://homeean.de/donate um das Projekt zu unterstützen."