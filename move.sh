#!/bin/bash
cd /root/faceswap
mv /root/faceswap/files/* /root/faceswap/.
./faceswap.py head.jpg face.jpg
mv /root/faceswap/*.jpg /root/faceswap/files/.
