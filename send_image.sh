#!/usr/bin/env bash

IMAGECOUNT=-1
OUTFOLDER=./img
source bot.conf

echo $TELEGRAM_CHAT_ID

PHOTOJSON=$(curl -s "https://api.unsplash.com/photos/random?client_id=$CLIENT_ID") 

echo $PHOTOJSON

PHOTOURL=$(echo $PHOTOJSON | jq -r '.urls.raw')

wget -O tmp ${PHOTOURL}

for chat_id in ${TELEGRAM_CHAT_ID[*]}
do
        curl -F chat_id="${chat_id}" -F photo=@"tmp" -X POST "https://api.telegram.org/bot${APITOKEN}/sendPhoto"
done