#!/usr/bin/env bash

INFOLDER=./in
OUTFOLDER=./img

if [ ! -d "$OUTFOLDER" ]; then
    mkdir ${OUTFOLDER}
fi

echo "Move all supported image from $INFOLDER to $OUTFOLDER"
i=0
files=$(find ${INFOLDER} -name '*.png' -or -name '*.jpg')

while read -r f; do
    i=$((i+1))
    filename=$(basename -- "$f")
    extension="${filename##*.}"
    mv "$f" ${OUTFOLDER}/${i}.${extension}
done <<< "$files"

echo "IMAGECOUNT=$i" >> bot.conf
echo "OUTFOLDER=$OUTFOLDER" >> bot.conf
echo "Done! Moved $i image files"