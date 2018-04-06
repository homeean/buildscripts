if [ ! -e node-sonos-http-api ]; then
    git clone https://github.com/jishi/node-sonos-http-api.git
fi
cd node-sonos-http-api
npm install --production
cd -
sudo chown -R pi:pi node-sonos-http-api
echo "Autostart einrichten"
cat > sonos-api.service << EOF
[Unit]
Description=sonos api server
After=syslog.target network-online.target

[Service]
Type=simple
User=pi
ExecStart=/usr/bin/npm start --prefix ~/node-sonos-http-api
Restart=on-failure
RestartSec=10
KillMode=process

[Install]
WantedBy=multi-user.target
EOF
if [ ! -e /etc/systemd/system/sonos-api.service ]; then
    sudo mv sonos-api.service /etc/systemd/system/sonos-api.service
fi
echo "Autostart aktivieren"
sudo systemctl daemon-reload
sudo systemctl enable sonos-api
sudo systemctl start sonos-api