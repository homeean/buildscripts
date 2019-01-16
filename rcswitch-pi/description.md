RCSwitch Pi dient zur Steuerung von Funksteckdosen mit einem 433Mhz Sender über die Kommandozeile.

Mit dem Befehl `sudo ./send 10101 1 1` kann z.B. die Steckdose 1 (oder A) mit dem Hauscode 10101 eingeschaltet werden.

Das Installationsprogramm geht davon aus, dass der 433Mhz Sender an den GPIO 0 (Pin 17) angeschlossen wird. Bei einem anderen Pin muss die Datei `~/rcswitch-pi/send.cpp` editiert und das Programm anschließend mit `make` neu kompliliert werden.

Weitere Informationen gibt es z.B. hier in einem Beitrag: [https://himpler.com/blog/433mhz-steckdosen-mit-dem-raspberry-pi-steuern](https://himpler.com/blog/433mhz-steckdosen-mit-dem-raspberry-pi-steuern)

Das Paket ist updatefähig.