echo -e "${COLOR_ORANGE}Setting Hostname to ${new_hostname}${FORMAT_END}"
h=$(hostname)
sudo hostname -b ${new_hostname}
sudo sed -i "s/$h/$new_hostname/g" /etc/hosts