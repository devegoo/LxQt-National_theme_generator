#!/bin/sh
#Xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)

#Yaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)

F=$(printenv "LANG" | cut -d "_" -f2- | cut -d "." -f1 | tr "[:upper:]" "[:lower:]")

cp /usr/share/sddm/flags/$F.png flag.png

convert "flag.png" -resize $(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)^x$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)^  "background.png"
rm flag.png
