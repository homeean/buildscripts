echo "ioBroker installieren"
sudo mkdir /opt/iobroker
sudo chmod 777 /opt/iobroker
cd /opt/iobroker
sudo npm install -g npm@latest
sudo npm install iobroker --unsafe-perm
cat > iobroker.service << EOF
[Unit]
Description=ioBroker IoT integration platform
Documentation=http://iobroker.net
After=syslog.target network-online.target
[Service]
Type=simple
User=root
ExecStart=/usr/bin/node /opt/iobroker/node_modules/iobroker.js-controller/controller.js
Restart=on-failure
RestartSec=10
KillMode=process
[Install]
WantedBy=multi-user.target
EOF

echo "Autostart für ioBroker einrichten"
sudo mv iobroker.service /etc/systemd/system/iobroker.service
sudo systemctl daemon-reload
sudo systemctl enable iobroker
sudo systemctl start iobroker
