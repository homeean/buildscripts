echo -e "${COLOR_ORANGE}Installiere homeeup${FORMAT_END}"
sudo npm install -g homeeup
mkdir -p ~/.homeeup
cat > ~/.homeeup/config.json << EOF
{
        "plugins": [{
                        "deviceName": "HTTPSwitch",
                        "type": "SimpleHTTPPlugin",
                        "pluginParams": {
                                "onUrl": "http://www.google.de/on",
                                "offUrl": "http://www.google.de/off"
                        }
                },
                {
                        "deviceName": "CMDSwitch",
                        "type": "SimpleCMDPlugin",
                        "pluginParams": {
                                "onCmd": "touch /tmp/file",
                                "offCmd": "rm /tmp/file",
                                "statusCmd": "ls /tmp/file >> /dev/null; echo $?",
                                "checkInterval": 2000
                        }
                }
        ],
        "hostAdress": "$(hostname -I)"
}
EOF
cat > homeeup.service << EOF
[Unit]
Description=homeeup device simulator
After=syslog.target network-online.target

[Service]
Type=simple
User=pi
ExecStart=$(which homeeup)
Restart=on-failure
RestartSec=10
KillMode=process

[Install]
WantedBy=multi-user.target
EOF
sudo mv homeeup.service /etc/systemd/system/homeeup.service
sudo systemctl daemon-reload
sudo systemctl enable homeeup
sudo systemctl start homeeup