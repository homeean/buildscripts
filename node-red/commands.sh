echo -e "${COLOR_ORANGE}Installiere Node-RED${FORMAT_END}"

sudo npm install node-red -g --unsafe-perm
mkdir -p ~/.node-red
echo "Node-RED Autostart einrichten"
wget https://raw.githubusercontent.com/node-red/raspbian-deb-package/master/resources/nodered.service
sudo mv nodered.service /etc/systemd/system/node-red.service
sudo systemctl daemon-reload
sudo systemctl enable node-red
sudo systemctl start node-red