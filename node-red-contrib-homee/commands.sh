echo -e "${COLOR_ORANGE}Installiere Node-RED Plugin node-red-contrib-homee${FORMAT_END}"

cd ~/.node-red
npm install node-red-contrib-homee
sudo systemctl restart node-red
cd ~