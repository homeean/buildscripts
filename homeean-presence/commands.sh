echo "Installiere homeean-presence"
sudo apt-get install bluetooth bluez libbluetooth-dev libudev-dev
sudo setcap cap_net_raw+eip $(eval readlink -f `which node`)
sudo npm install -g homeean-presence --unsafe-perm
mkdir -p ~/.homeean-presence
cat > ~/.homeean-presence/config.json << EOF
{
    "interval": 30,
    "threshold": 180,
    "port": 3000,
    "webhooks": {
        "absent": "",
        "present": ""
    },
    "persons": [
        {
            "name": "firstname",
            "uuid": "",
            "ip": ""
        }
    ]
}

EOF
cat > homeean-presence.service << EOF
[Unit]
Description=homeean presence detection
After=syslog.target network-online.target

[Service]
Type=simple
User=pi
ExecStart=$(which homeean-presence)
Restart=on-failure
RestartSec=10
KillMode=process

[Install]
WantedBy=multi-user.target
EOF
sudo mv homeean-presence.service /etc/systemd/system/homeean-presence.service
sudo systemctl daemon-reload
sudo systemctl enable homeean-presence
sudo systemctl start homeean-presence