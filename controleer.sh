# Controleer dat elke regel (op uitzonderingen na) aan het eind een <br>\ heeft
cat data.html | grep -v "<br/>\\\\$" | grep -v "einde: " | grep -v "begin: " | grep -v '"\],\["\\' | grep -v '","\\' | grep -v 'aantal_voorbeelden' | grep -v 'data=data.concat' | grep -v "\[" | grep -v "\]" | grep -v "DATA EINDIGT HIER" | grep -v "DATA BEGINT HIER"

# controleer dat elke regel (op uitzonderingen na) een backslash heeft
cat data.html | grep -v "\\\\" | grep -v "data." | grep -v "]]);" | grep -v "]];" | grep -v "//" | grep -v "]);" | grep -v "\"]"

# controleer dat nieuwe_pagina goed geschreven is
cat data.html | grep "_" | grep -v '^nieuwe_pagina<br\/>\\' | grep -v aantal_voorbeelden

# controleer dat ieder item een nummer heeft
cat data.html | grep -B 2 '"\],\["\\' | grep '<br/>\\' | sed 's/<br\/>\\//' | sed '/[0-9]/d'
