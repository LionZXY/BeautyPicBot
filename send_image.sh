#!/usr/bin/env bash

IMAGECOUNT=-1
OUTFOLDER=./img
source bot.conf

PHOTOURL=$(curl -s "https://api.unsplash.com/photos/random?client_id=$CLIENT_ID" | jq -r '.urls.raw')

for chat_id in ${TELEGRAM_CHAT_ID[*]}
do
    curl -s "https://api.telegram.org/bot${APITOKEN}/sendPhoto?chat_id=$chat_id&photo=$PHOTOURL"
done