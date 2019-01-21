echo -e "${COLOR_ORANGE}Installiere Harmony API inklusive Forever${FORMAT_END}"

sudo npm install -g forever

if [ ! -e ~/harmony-api ]; then
    git clone https://github.com/maddox/harmony-api.git ~/harmony-api
    cd ~/harmony-api
else
    cd ~/harmony-api
    git fetch origin master
    git reset --hard origin/master
fi
mkdir -p log
npm install
cp config/config.sample.json config/config.json
cat > config/config.json << EOF
{
  "enableHTTPserver": true,
  "mqtt_host": "mqtt://127.0.0.1",
  "topic_namespace": "harmony-api",
  "mqtt_options": {
      "port": 1883,
      "username": "${mqtt_username}",
      "password": "${mqtt_password}",
      "rejectUnauthorized": false
  }
}
EOF
cd ~
cat > harmony-api.service << EOF
[Unit]
Description=A simple server allowing you to query/control multiple local Harmony Home Hubs
After=network.target

[Service]
ExecStart=/opt/harmony-api/script/server
SyslogIdentifier=harmony-api
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF
if [ -e /opt/harmony-api ]; then
    sudo rm -R /opt/harmony-api
fi
sudo mv harmony-api /opt/harmony-api
sudo mv -f harmony-api.service /etc/systemd/system/harmony-api.service
sudo systemctl daemon-reload
sudo systemctl enable harmony-api
sudo systemctl start harmony-api