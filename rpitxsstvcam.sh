#!/bin/bash
# sstv camera, Gerrit Polder, PA3BYA
# shell script to test SSTV camera
raspistill -t 1 --width 320 --height 256 -e png -o /tmp/image.png
# add callsign
mogrify -pointsize 24 -draw "text 10,40 'MYCALL'" /tmp/image.png
./pisstvpp -pm1 /tmp/image.png
sudo rpitx -m RF -i /tmp/image.png.m1.rf -f 144550
rm /tmp/image.png*
