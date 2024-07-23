\cp -f index_bew_2.html index_bew_3.html
\cp -f index_bew_1.html index_bew_2.html
\mv -f index.html index_bew_1.html

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

# Het aantal voorbeelden moet gelijk zijn aan aantal "],[" plus het aantal (aan het begin van een regel) [\ 
aux1=$(cat data.html | grep '^\["\\' | wc -l)
aux2=$(cat data.html | grep '"\],\["\\' | wc -l)
res2=$(echo "scale=0;($aux2+$aux1)/1" | bc -l)
echo "Controle          : $res2"

if [ $aw -ne $res1 ]; then
  echo -n "ER IS EEN FOUT OPGETREDEN:"
  echo "  Aantal voorbeelden niet gelijk aan eerste controle"
  echo "Tip: diff index.html index_bew_1.html"
fi
if [ $aw -ne $res2 ]; then
  echo -n "ER IS EEN FOUT OPGETREDEN:"
  echo "  Aantal voorbeelden niet gelijk aan tweede controle"
  echo "Tip: diff index.html index_bew_1.html"
fi
if [ $res1 -ne $res2 ]; then
  echo -n "ER IS EEN FOUT OPGETREDEN:"
  echo "  De controles zijn niet gelijk"
  echo "Tip: diff index.html index_bew_1.html"
fi
