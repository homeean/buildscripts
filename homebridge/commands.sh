echo "Homebridge mit config-ui installieren"
sudo apt-get install -y libavahi-compat-libdnssd-dev
sudo npm install -g homebridge homebridge-config-ui --unsafe-perm
echo "Autostart einrichten"
cat > homebridge.service << EOF
[Unit]
Description=homebridge server
After=syslog.target network-online.target

[Service]
Type=simple
User=pi
ExecStart=/usr/bin/homebridge -U ~/.homebridge
Restart=on-failure
RestartSec=10
KillMode=process

[Install]
WantedBy=multi-user.target
EOF
sudo mv homebridge.service /etc/systemd/system/homebridge.service
echo "config.json erstellen"
cat > config.json << EOF
{
  "bridge": {
    "name": "Homebridge",
    "username": "CC:22:3D:E3:CE:51",
    "port": 51826,
    "pin": "031-45-154"
  },
  "description": "This is an example configuration file for the homebridge-homee plugin",
  "hint": "Always paste into jsonlint.com validation page before starting your homebridge, saves a lot of frustration",
  "platforms": [
    {
      "platform": "config",
      "name": "Config",
      "port": 8080,
      "log": "/var/log/daemon.log",
      "restart": "sudo systemctl restart homebridge.service"
    }
  ]
}
EOF
mkdir -p ~/.homebridge
mv config.json ~/.homebridge/config.json
sudo chown pi:pi ~/.homebridge -R
echo "Autostart aktivieren"
sudo systemctl daemon-reload
sudo systemctl enable homebridge
sudo systemctl start homebridge