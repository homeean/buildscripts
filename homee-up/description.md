homeeUp erlaubt es Euch virtuelle Geräte in homee anzulegen. Für homee wird dafür eine Homematic CCU mit frei konfigurierbaren virtuellen Geräten simuliert.

Diese simulierten Geräte lassen sich wie Homematic-Geräte in homee importieren und werden dort wie diese behandelt, inkl. der Möglichkeit diese innerhalb homees schalten zu können und der Abbildung ihrer Schaltzustände in homee, was diese auch in Homegrammen nutzbar macht.

Initial werden ein Homematic Unterputzschalter (HM-LC-Sw1-FM) und ein Homematic Funkhandsender (HM-RC-4-2) simuliert.

Diese können über ein Plugin-System als HTTP-Switch (der für EIn- und Ausschaltungen beliebige HTTP-Aufrufe absetzen kann - damit lassen sich beispielsweise Geräte An- und Abschalten, die eine REST-API anbieten, z.B. einige Fernseher oder Staubsaugerroboter), als Command-Switch (der direkt Kommandozeilenbefehle auf Eurem RaspBerry PI absetzen kann - womit man z.B. Programme starten und stoppen kann), ein MQTT-Switch (mit dem einem MQTT-Broker wie Mosquitto und damit verbundenen Drittprogrammen Schaltzustände vorgegaukelt werden können) und ein FritzBox-Switch (mit dem das Gäste-WLAN ein- und ausgeschalten werden kann) konfiguriert werden.

Durch das offene Pluginsystem von homeeUp ist das jedoch sicherlich nur der Anfang.

Die Originaldokumentation und die Quellen findet sich hier:
[https://github.com/kdietrich/homeeup](https://github.com/kdietrich/homeeup)

Link zum Thread des Autoren in der homee Community: 
[https://community.hom.ee/t/homeeup-virtuelle-geraete-in-homee/11352](https://community.hom.ee/t/homeeup-virtuelle-geraete-in-homee/11352)

Weitere Informationen im homeepedia Wiki: [https://www.homeepedia.de/books/homeean/page/homeeup](https://www.homeepedia.de/books/homeean/page/homeeup)
