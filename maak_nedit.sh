cd /var/www/html/nic

\cp -f index.html index_bew.html

echo "Hiertussen mag niets komen:"
./controleer.sh
echo "Hiertussen mag niets komen:"

echo "Controleer ook met % in vi: [ en ] plus ( en ) zie begin en einde data.html"

cat nederlandsitaliano_6.0.0_boven.html data.html nederlandsitaliano_6.0.0_onder.html > index.html

aw=$(cat data.html | grep "\[\"" | wc -l)
echo "Aantal items: $aw"
