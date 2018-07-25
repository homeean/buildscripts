Das Paket ist ein API-Wrapper um das Paket [Alexa-Remote](https://github.com/Apollon77/alexa-remote)

Darüber lassen sich Alexa-Geräte über das Netzwerk fernsteuern.

Beispiel für den Aufruf:
```
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"device":"echo","text":"hello world"}' \
  http://localhost:3000/speak
```