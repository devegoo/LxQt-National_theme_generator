#!/bin/sh
Xaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)

Yaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)


country=$(./country.sh $(printenv "LANG" | cut -c 1-2))

X=$(( Xaxis / 2 ))
Y=$(( Yaxis / 2 ))

F=$[(( X + Y / 2 )) / 10 ] 
 
convert "background.png" -pointsize $(identify -format "%[fx:int(w*0.05)]" "background.png") -fill white -stroke black -strokewidth 35 -annotate +$X+$Y "$country" -stroke white -strokewidth  30 -annotate +$X+$Y "$country" -stroke black -strokewidth 25 -annotate +$X+$Y "$country" -stroke white -strokewidth 20 -annotate +$X+$Y "$country" -stroke black -strokewidth 15 -annotate +$X+$Y "$country" -stroke none -annotate +$X+$Y "$country" "background.png"


convert "background.png" "systemlogo.png" -gravity center -compose over -composite "background.png"

convert -bordercolor silver -border 20 "background.png" "background.png"     
            
            
            
           

