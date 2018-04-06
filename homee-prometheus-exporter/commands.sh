curl "https://bintray.com/user/downloadSubjectPublicKey?username=xenji" | sudo apt-key add -
echo "deb [arch=noarch] https://dl.bintray.com/xenji/homee-exporter stable main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install homee-exporter