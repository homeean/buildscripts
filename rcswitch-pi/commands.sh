echo -e "${COLOR_ORANGE}Installiere RCSwitch Pi${FORMAT_END}"
cd ~
if [ ! -e rcswitch-pi ]; then
    git clone https://github.com/r10r/rcswitch-pi.git
    cd rcswitch-pi
else
    cd rcswitch-pi
    git pull origin
fi
make
cd ~