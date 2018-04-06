h=$(hostname)
sudo hostname -b homeean
sudo sed -i "s/$h/homeean/g" /etc/hosts