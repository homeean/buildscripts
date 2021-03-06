echo -e "${COLOR_ORANGE}Installiere Mosquitto${FORMAT_END}"

if [ ! -e /etc/mosquitto/conf.d ]; then
    sudo apt-get -y install mosquitto mosquitto-clients
fi

if [ ! -e /etc/mosquitto/conf.d/mosquitto.conf ]; then
    cat > mosquitto.conf << EOF
# Config file for mosquitto
#
# See mosquitto.conf(5) for more information.

user mosquitto
max_queued_messages 200
message_size_limit 0
allow_zero_length_clientid true
allow_duplicate_messages false

listener 1883
autosave_interval 900
autosave_on_changes false
persistence true
persistence_file mosquitto.db

allow_anonymous false
password_file /etc/mosquitto/conf.d/passwd
EOF
    sudo mv mosquitto.conf /etc/mosquitto/conf.d/
fi

#set passwd if file not exist
MQTTUSER=${mqtt_username}
MQTTPASSWD=${mqtt_password}
if [ ! -e /etc/mosquitto/conf.d/passwd ]; then
    sudo touch /etc/mosquitto/conf.d/passwd
    sudo mosquitto_passwd -b /etc/mosquitto/conf.d/passwd ${MQTTUSER} ${MQTTPASSWD}
fi

sudo systemctl restart mosquitto