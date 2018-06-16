#!/usr/bin/env bash

IMAGECOUNT=-1
OUTFOLDER=./img
source bot.conf

for chat_id in $TELEGRAM_CHAT_ID
do
    number=$(( ( RANDOM % $IMAGECOUNT ) + 1 ))
    IMAGEFILE=$(find ${OUTFOLDER}/${number}.*)
    echo "$IMAGEFILE to $chat_id"

    curl -F chat_id="${chat_id}" -F photo=@"$IMAGEFILE" https://api.telegram.org/bot${APITOKEN}/sendPhoto
done