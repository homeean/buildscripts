sudo apt-get install -y fbi
if ! grep -q plymouth.ignore-serial-consoles /boot/cmdline.txt; then
	sudo sed -i '1 s/$/ logo.nologo loglevel=3 quiet splash consoleblank=0 vt.global_cursor_default=0 plymouth.ignore-serial-consoles/' /boot/cmdline.txt
fi
if ! grep -q ^disable_overscan=1 /boot/config.txt; then
    echo "disable_overscan=1" | sudo tee -a /boot/config.txt
fi
wget https://github.com/homeean/buildscripts/raw/master/homeean-boot-screen.png
sudo mv homeean-boot-screen.png /opt/splash.png
cat > splashscreen.service << EOF
[Unit]
Description=Splash screen
DefaultDependencies=no
After=local-fs.target

[Service]
ExecStart=/usr/bin/fbi -d /dev/fb0 --noverbose -a /opt/splash.png
StandardInput=tty
StandardOutput=tty

[Install]
WantedBy=sysinit.target
EOF
sudo mv splashscreen.service /etc/systemd/system/splashscreen.service
sudo systemctl daemon-reload
sudo systemctl enable splashscreen.service 
