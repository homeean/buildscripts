# config for unattended upgrades
sudo dpkg-reconfigure -priority=low unattended-upgrades

# change password after homeean installation
read -p "Aus Sicherheitsgründen sollte das Standard-Passwort geändert werden. Möchtest Du es jetzt ändern? [y/n]: "
[ "$REPLY" != "y" ] || passwd

# done :)
echo -e "${COLOR_GREEN}Die Installation ist abgeschlossen.${FORMAT_END}"
echo -e "Besuche ${FORMAT_BOLD}${COLOR_ORANGE}https://homeean.de/donate${FORMAT_END} um das Projekt zu unterstützen."