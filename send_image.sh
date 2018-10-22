
#!/usr/bin/env bash

IMAGECOUNT=-1
OUTFOLDER=./img
source bot.conf

echo $TELEGRAM_CHAT_ID

PHOTOJSON=$(curl -s "https://api.unsplash.com/photos/random?client_id=$CLIENT_ID") 

echo $PHOTOJSON

PHOTOURL=$(echo $PHOTOJSON | jq -r '.urls.raw' | python3 -c "import urllib.parse; print(urllib.parse.quote_plus(input()))")

echo $PHOTOURL

for chat_id in ${TELEGRAM_CHAT_ID[*]}
do
        curl -s "https://api.telegram.org/bot${APITOKEN}/sendPhoto?chat_id=$chat_id&photo=$PHOTOURL"
done