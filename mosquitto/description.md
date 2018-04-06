Mosquitto ist ein MQTT (Message Queuing Telemetry Transport) Broker / Server für das Internet der Dinge.

MQTT ist ein offenes Nachrichtenprotokoll für Machine-to-Machine-Kommunikation oder Internet of Things (M2M/IoT), das die Übertragung von Daten in Form von einfachen Nachrichten zwischen Geräten ermöglicht, unabhängig von Verzögerungen (Latenz) oder beschränkten Netzwerken (z.B. hinsichtlich Bandbreiten). Ein MQTT-Server wie Mosquito hält die gesamte Datenlage seiner Kommunikationspartner und kann so als Zustands-Datenbank genutzt werden, auch für solche Geräte, welche Ihre Daten oder Zustände nicht langfristig vorhalten. Durch diese Eigenschaft eignet sich MQTT sehr gut für Smart-Home-Automatisierungslösungen und findet im Bereich IoT große Verbreitung.

Mosquito wird benötigt um alle Daten des homeeToMQTT-Servers speichern zu können. Optional lässt sich Mosquito noch so konfigurieren, dass alle Daten in Datenbanken (z.B. einer influx db) langfristig gespeichert werden, was z.B. Logdateien oder die grafische Aufbereitung der Dasten (z.B. mit Grafana) ermöglicht.

In Verbindung mit homee2MQTT wird Mosquito so zu einer Art Middleware, über die sich viele andere Hausautomatisierungslösungen (wie Node-RED, Home Assistant, iobroker, FHEM, openHAB) , welche MQTT unterstützen, integrieren lassen.

Mehr Infos zu Mosquito gibt es hier: [https://mosquitto.org](https://mosquitto.org)

Mehr Infos zu homeeToMQTT gibt es hier: [https://community.hom.ee/t/homee-in-verbindung-mit-mqtt-homeetomqtt/11095](https://community.hom.ee/t/homee-in-verbindung-mit-mqtt-homeetomqtt/11095)

Einen guten Einstieg in die MQTT Konzepte findet sich hier: [https://www.hivemq.com/mqtt-essentials](https://www.hivemq.com/mqtt-essentials)

Ein empfehlenswerter MQTT Client für Eure Tests findet sich hier: [http://mqttfx.jensd.de](http://mqttfx.jensd.de)