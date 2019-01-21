echo -e "${COLOR_ORANGE}Installiere homee To Mqtt${FORMAT_END}"
git clone https://github.com/odig/homeeToMqtt.git
cd homeeToMqtt
npm install

cat > config.json <<EOF
{
    "homeeUserName": "${homee_username}",
    "homeePassword": "${homee_password}",
    "homeeServer": "${homee_server}",
    "mqttServer": "${mqtt_server}",
    "mqttUserName": "${mqtt_username}",
    "mqttPassword": "${mqtt_password}",
    "publish": true,
    "subscribe": true
}
EOF

cd ~
if [ -e /opt/homeeToMqtt ]; then
    sudo rm -R /opt/homeeToMqtt
fi
sudo mv homeeToMqtt /opt/homeeToMqtt

cat > homee-to-mqtt.service <<EOF
[Service]
ExecStart=$(which node) /opt/homeeToMqtt/app.js
Restart=always
RestartSec=10                       # Restart service after 10 seconds if node service crashes
StandardOutput=syslog               # Output to syslog
StandardError=syslog                # Output to syslog
SyslogIdentifier=homeeToMqtt
WorkingDirectory=/opt/homeeToMqtt
User=pi
Environment=NODE_ENV=production PORT=8000

[Install]
WantedBy=multi-user.target
EOF

sudo mv -f homee-to-mqtt.service /etc/systemd/system/homee-to-mqtt.service
sudo systemctl daemon-reload
sudo systemctl enable homee-to-mqtt
sudo systemctl start homee-to-mqtt