Homebridge emuliert in Deinem Heimnetzwerk mit Hilfe von NodeJS eine sogenannte Bridge (eine Verbindung zwischen verschiedenen Softwarewelten) mit deren Hilfe Du viele verschiedene Geräte , die eigentlich (noch) nicht zu Apple HomeKit kompatibel sind, mit HomeKit verbinden kannst.

Homebridge ermöglicht diese Funktionalität über Plugins - das sind von der Homebridge Community bereitgestellte Zusatzmodule (knapp 1000 an der Zahl), die bestimmte Gerätetypen (z.B. den homee mit den meisten darin integrierten Geräten) damit in HomeKit, respektive der Apple Home App auf Deinem iPhone oder Deiner Apple Watch, zugänglich machen.

Mit der Homebridge installiert das Skript automatisch auch bereits das Plugin [homebridge-config-ui](https://www.npmjs.com/package/homebridge-config-ui). Dieses stellt unter http://[IP des Raspberry]:8080 eine Weboberfläche zur einfachen Steuerung von Homebridge bereit. (Der voreingestellte Defauluser ist admin und das Defaultpasswort lautet ebenfalls admin und sollte nach dem ersten Login im geändert werden).

Mehr Infos zur Homebridge findet sich auf dieser Webseite [https://github.com/nfarina/homebridge](https://github.com/nfarina/homebridge) - die knapp 1000 Homebridge Plugins sind auf der nachfolgenden Seite zu finden [https://www.npmjs.com/search?q=homebridge-plugin](https://www.npmjs.com/search?q=homebridge-plugin)
