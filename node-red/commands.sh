echo "Node-RED Installation"
sudo npm install node-red -g --unsafe-perm
mkdir -p ~/.node-red
sudo chown pi:pi ~/.node-red -R
echo "Node-RED Autostart einrichten"
wget https://raw.githubusercontent.com/node-red/raspbian-deb-package/master/resources/nodered.service
sudo mv nodered.service /etc/systemd/system/node-red.service
sudo systemctl daemon-reload
sudo systemctl enable node-red
sudo systemctl start node-red