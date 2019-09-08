echo -e "${COLOR_ORANGE}Installiere NodeJS und NPM${FORMAT_END}"

if [ $(uname -m) == "armv7l" ]; then
    echo "Paketquellen anpassen"
	# curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
	curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
	sudo apt-get install -y nodejs
elif [ $(uname -m) == "armv6l" ]; then
    # wget https://nodejs.org/dist/v8.9.4/node-v8.9.4-linux-armv6l.tar.xz
	# tar -xvf node-v8.9.4-linux-armv6l.tar.xz
	# cd node-v8.9.4-linux-armv6l
	wget https://nodejs.org/dist/v10.16.0/node-v10.16.0-linux-armv6l.tar.xz
	tar -xvf node-v10.16.0-linux-armv6l.tar.xz
	cd node-v10.16.0-linux-armv6l
	sudo cp -R * /usr/
	cd -
else
    echo "could not detect arm version"
    exit 1
fi