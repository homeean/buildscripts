Dieses Paket beinhaltet eine _experimentelle_ Alexa Text2Speech (TTS / T2S) Lösung.

Nach der Installation müsst Ihr derzeit (deswegen experimentell) noch ein Cookie-File gem. der nachfolgenden Anleitung auf Eurem Raspberry unter `/var/www/alexa_tts/` ablegen:
[https://www.intelligentes-haus.de/2018/06/26/amazon-alexa-text-to-speech-tts-ubers-smart-home-nutzen](https://www.intelligentes-haus.de/2018/06/26/amazon-alexa-text-to-speech-tts-ubers-smart-home-nutzen)

Die API erreicht Ihr dann unter der nachfolgenden URL:
[http://homeean.local/alexa_tts/alexa.php](http://homeean.local/alexa_tts/alexa.php) oder ohne das Hostname Paket unter `http://[IP Adresse deines Raspberry Pi]/alexa_tts/alexa.php`

Wenn die API fehlerfrei installiert ist und das Cookie-File vorhanden ist, dann erscheint eine Liste mit allen Amazon Echo Geräten, die mit Eurem Account verbunden sind. 
Die Links in der rechten Spalte könnt Ihr Euch rauskopieren und als Webhook (Get) in einem HG von homee aufrufen und damit den Text (alles nach text_tts=) gesprochen auf einem Echo Eurer Wahl ausgeben.

Mehr Infos zum Paket gibt es in der homee Community:
[https://community.hom.ee/t/homeean-alexa-text2speech-tts-experimentell/13042](https://community.hom.ee/t/homeean-alexa-text2speech-tts-experimentell/13042)

