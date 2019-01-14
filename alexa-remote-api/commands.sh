echo -e "${COLOR_ORANGE}Installiere alexa-remote-api${FORMAT_END}"
sudo npm install -g alexa-remote-api
mkdir -p ~/.alexa-remote-api
cat > ~/.alexa-remote-api/config.json << EOF
{
    "email": "foo@bar.com",
    "password": "supersecret",
    "bluetooth": false
}
EOF
cat > alexa-remote-api.service << EOF
[Unit]
Description="Control your Alexa device via API"
After=syslog.target network-online.target

[Service]
Type=simple
User=pi
Environment=PORT=3030
ExecStart=$(which alexa-remote-api)
Restart=on-failure
RestartSec=10
KillMode=process

[Install]
WantedBy=multi-user.target
EOF
sudo mv alexa-remote-api.service /etc/systemd/system/alexa-remote-api.service
sudo systemctl daemon-reload
sudo systemctl enable alexa-remote-api
sudo systemctl start alexa-remote-api