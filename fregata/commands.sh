sudo apt-get install -y golang
mkdir -p ~/.go
export GOPATH=~/.go
if ! grep -q GOPATH ~/.bashrc; then
    echo export GOPATH=~/.go >> ~/.bashrc
fi
go get github.com/xuqingfeng/fregata/cmd/fregata
go get github.com/xuqingfeng/fregata/cmd/fregatad
cp ~/.go/src/github.com/xuqingfeng/fregata/etc/fregata.conf ~/.go/bin/
cat > fregata.service << EOF
[Unit]
Description=Fregata REST API for message delivery
After=syslog.target network-online.target

[Service]
Type=simple
User=pi
ExecStart=~/.go/bin/fregatad -config ~/.go/bin/fregata.conf
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