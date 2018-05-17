h=$(hostname)
sudo hostname -b ${new_hostname}
sudo sed -i "s/$h/$new_hostname/g" /etc/hosts