#!/bin/bash
cd /data
for file in *; do mv "$file" `echo $file | tr -cd '.A-Za-z0-9_-'` ; done
CONVERT=`ls /data`
/kcc/kcc-c2e.py --profile=$KCC_DEVICE --hq --output=/data --format=EPUB --upscale --stretch /data/$CONVERT
qemu-i386-static -cpu qemu32 /kcc/kindlegen $CONVERT.epub -c0 -verbose -o $CONVERT.mobi

