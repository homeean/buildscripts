sudo apt-get install -y golang
mkdir -p /home/pi/.go
export GOPATH=/home/pi/.go
if ! grep -q GOPATH /home/pi/.bashrc; then
    echo export GOPATH=/home/pi/.go >> /home/pi/.bashrc
fi
go get github.com/xuqingfeng/fregata/cmd/fregata
go get github.com/xuqingfeng/fregata/cmd/fregatad
cp /home/pi/.go/src/github.com/xuqingfeng/fregata/etc/fregata.conf /home/pi/.go/bin/
cat > fregata.service << EOF
[Unit]
Description=Fregata REST API for message delivery
After=syslog.target network-online.target

[Service]
Type=simple
User=pi
ExecStart=/home/pi/.go/bin/fregatad -config /home/pi/.go/bin/fregata.conf
Restart=on-failure
RestartSec=10
KillMode=process

[Install]
WantedBy=multi-user.target
EOF
sudo mv fregata.service /etc/systemd/system/fregata.service
sudo systemctl daemon-reload
sudo systemctl enable fregata
sudo systemctl start fregata