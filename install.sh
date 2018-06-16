#!/usr/bin/env bash

echo "Install dependecies..."
sudo apt-get install -qq jq unzip

echo "Welcome to PicBot!"
echo "Enter botapi token:"
read APITOKEN

CHECKAPI=$(curl -s "https://api.telegram.org/bot$APITOKEN/getMe" | jq -r '.ok')
echo ${CHECKAPI}
if [[ $CHECKAPI == "true" ]]; then
    echo "Bot token valid!"
else
    echo "Bot token invalid!"
    exit
fi

echo "Enter telegram chat ids:"
read TELEGRAM_CHAT_ID
echo "APITOKEN=$APITOKEN" >> bot.conf
echo "TELEGRAM_CHAT_ID=$TELEGRAM_CHAT_ID" >> bot.conf

echo "Download images..."
wget --output-document=pic.zip https://files.olezh.es/lionzxy/pic.zip
echo "Unzip images..."
unzip -qq pic.zip -d ./in
echo "Prepare images..."
./prepare_image.sh
echo "Remove trash..."
rm -rf ./in
echo "Done!"