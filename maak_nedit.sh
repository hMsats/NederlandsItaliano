\cp -f index_bew_2.html index_bew_3.html
\cp -f index_bew_1.html index_bew_2.html
\mv -f index.html index_bew_1.html

cat data_orig.html | sed 's/^  /\&nbsp;\&nbsp;\&nbsp;/g' | sed 's/^ /\&nbsp;/g' > data.html

echo "Hiertussen mag niets komen:"
./controleer.sh
echo "Hiertussen mag niets komen:"

echo "Controleer ook met % in vi: [ en ] plus ( en ) zie begin en einde data.html"

cat nederlandsitaliano_boven.html data.html nederlandsitaliano_onder.html > index.html

aw=$(cat data.html | grep "\[\"" | wc -l)
echo "Aantal voorbeelden: $aw"

# Het aantal "," gedeeld door 2
aux=$(cat data.html | grep "\",\"" | wc -l)
res1=$(echo "scale=0;$aux/2" | bc -l)
echo "Controle          : $res1"

res12=$(echo "scale=0;$aux" | bc -l)
aw2=$(echo "scale=0;$aw*2" | bc -l)

# Het aantal voorbeelden moet gelijk zijn aan aantal "],[" plus het aantal (aan het begin van een regel) [\ 
aux1=$(cat data.html | grep '^\["\\' | wc -l)
aux2=$(cat data.html | grep '"\],\["\\' | wc -l)
res2=$(echo "scale=0;($aux2+$aux1)/1" | bc -l)
echo "Controle          : $res2"

if [ $aw2 -ne $res12 ]; then
  echo -n "ER IS EEN FOUT OPGETREDEN:"
  echo "  Aantal voorbeelden niet gelijk aan eerste controle (aw2:$aw2, res12:$res12)"
  echo "Tip: diff index.html index_bew_1.html"
fi
if [ $aw -ne $res2 ]; then
  echo -n "ER IS EEN FOUT OPGETREDEN:"
  echo "  Aantal voorbeelden niet gelijk aan tweede controle (aw:$aw, res2:$res2)"
  echo "Tip: diff index.html index_bew_1.html"
fi
res22=$(echo "scale=0;$res2*2" | bc -l)
if [ $res12 -ne $res22 ]; then
  echo -n "ER IS EEN FOUT OPGETREDEN:"
  echo "  De controles zijn niet gelijk (res12:$res12, res22:$res22)"
  echo "Tip: diff index.html index_bew_1.html"
fi

\rm -r data.html
