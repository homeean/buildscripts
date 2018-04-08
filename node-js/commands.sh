if [ $(uname -m) == "armv7l" ]; then
    echo "Paketquellen anpassen"
	curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
	sudo apt-get install -y nodejs
	sudo apt-get install -y build-essential
elif [ $(uname -m) == "armv6l" ]; then
    wget https://nodejs.org/dist/v8.9.4/node-v8.9.4-linux-armv6l.tar.xz
	tar -xvf node-v8.9.4-linux-armv6l.tar.xz
	cd node-v8.9.4-linux-armv6l
	sudo cp -R * /usr/
	cd -
else
    echo "could not detect arm version"
    exit 1
fi