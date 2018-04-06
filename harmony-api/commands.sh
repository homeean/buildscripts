echo "Forever installieren"
sudo npm install -g forever
echo "Harmony-Api laden und installieren"
if [ ! -e harmony-api ]; then
    git clone https://github.com/maddox/harmony-api.git
fi
cd harmony-api
mkdir -p log
npm install
cp config/config.sample.json config/config.json
cat > config/config.json <<EOF
{
  "enableHTTPserver": true,
  "mqtt_host": "mqtt://127.0.0.1",
  "topic_namespace": "harmony-api",
  "mqtt_options": {
      "port": 1883,
      "username": "mqtt",
      "password": "mqtt",
      "rejectUnauthorized": false
  }
}
EOF
cd -
echo "Autostart einrichten"
cat > harmony-api.service <<EOF
[Unit]
Description=A simple server allowing you to query/control multiple local Harmony Home Hubs$
After=network.target

[Service]
ExecStart=/home/pi/harmony-api/script/server
SyslogIdentifier=harmony-api
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF
sudo mv harmony-api.service /etc/systemd/system/harmony-api.service
sudo systemctl daemon-reload
sudo systemctl enable harmony-api
sudo systemctl start harmony-api