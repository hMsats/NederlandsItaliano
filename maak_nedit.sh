\cp -f index.html index_bew.html

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
echo "Controle    : $res1"

# Het aantal voorbeelden moet gelijk zijn aan aantal "],[" plus het aantal (aan het begin van een regel) [\ 
res2=$(cat data.html | grep '^\["\\' | wc -l)
aux=$(cat data.html | grep '"\],\["\\' | wc -l)
res3=$(echo "scale=0;($aux+$res2)/1" | bc -l)
echo "Controle    : $res3"
