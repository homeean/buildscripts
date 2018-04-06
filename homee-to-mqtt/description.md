homeeToMQTT meldet sich an Deinem homee an und publiziert alle unterstützten Statusänderungen an einen MQTT Server/Broker (idealerweise Mosquito, das Ihr gleich mit installieren solltet). Der Server abboniert (subscribed) alle sinnvollen Attribute des homee als Topic und speichert diese auf einem frei konfigurierbaren MQTT Server/Broker. Somit lassen sich Lichter und Schaltsteckdosen, Temperatur, Intensität und Farbtemperatur von homee-inkludierten Geräten via MQTT speichern und steuern. MQTT kann hiebei als Middleware angesehen werden, welche es ermöglicht homee einfach an die gängigen Heimautomatisierunslösungen wie Node-RED, Home Assistant, iobroker, FHEM, openHAB, usw. anzubinden, welche ebenfalls einen MQTT-Support bieten.

Noch interessanter ist es, via MQTT die Daten in eine Datenbank (z.B. influxdb) zu speichern und damit eine Langzeitdatenspeicherung (Log) zu haben. Diese Daten lassen sich dann wiederum einfach mit Tools wie Grafana auswerten.

Die Dokumentation findet sich hier: [https://github.com/odig/homeeToMqtt/tree/master](https://github.com/odig/homeeToMqtt/tree/master)

Mehr Infos zu homeeToMQTT gibt es hier: [https://community.hom.ee/t/homee-in-verbindung-mit-mqtt-homeetomqtt/11095](https://community.hom.ee/t/homee-in-verbindung-mit-mqtt-homeetomqtt/11095)

Einen guten Einstieg in die MQTT Konzepte findet sich hier: [https://www.hivemq.com/mqtt-essentials](https://www.hivemq.com/mqtt-essentials)

Ein empfehlenswerter MQTT Client für Eure Tests findet sich hier: [http://mqttfx.jensd.de](http://mqttfx.jensd.de)