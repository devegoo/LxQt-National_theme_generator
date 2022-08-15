#!/bin/sh
Xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)

Yaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)


country=$(./country.sh $(printenv "LANG" | cut -d "_" -f2- | cut -d "." -f1 | tr "[:upper:]" "[:lower:]"))

X=$(( Xaxis / 2 ))
Y=$(( Yaxis / 2 ))
TZ=$( timedatectl show | awk 'NR==1{print $1}' | cut -d "=" -f2- )
X1=$(( X + 350 ))
Y1=$(( Y + 150 ))
 
convert "background.png" -pointsize $(identify -format "%[fx:int(w*0.05)]" "background.png") -fill white -stroke black -strokewidth 35 -annotate +$X+$Y "$country" -stroke white -strokewidth  30 -annotate +$X+$Y "$country" -stroke black -strokewidth 25 -annotate +$X+$Y "$country" -stroke white -strokewidth 20 -annotate +$X+$Y "$country" -stroke black -strokewidth 15 -annotate +$X+$Y "$country" -stroke none -annotate +$X+$Y "$country" "background.png"

convert "background.png" -pointsize $(identify -format "%[fx:int(w*0.03)]" "background.png") -fill white -stroke black -strokewidth 20 -annotate +$X1+$Y1 "$TZ" -stroke white -strokewidth  15 -annotate +$X1+$Y1 "$TZ" -stroke black -strokewidth 10 -annotate +$X1+$Y1 "$TZ" -stroke white -strokewidth 5 -annotate +$X1+$Y1 "$TZ" -stroke black -strokewidth 2 -annotate +$X1+$Y1 "$TZ" -stroke none -annotate +$X1+$Y1 "$TZ" "background.png"

convert "background.png" "systemlogo.png" -gravity center -compose over -composite "background.png"

convert -bordercolor silver -border 20 "background.png" "background.png"     
            
            
            
           

