echo -e "${COLOR_ORANGE}Installiere WiringPi${FORMAT_END}"

cd ~
if [ ! -e wiringPi ]; then
    git clone git://git.drogon.net/wiringPi
    cd wiringPi
else
    cd wiringPi
    git pull origin
fi
./build
cd ~