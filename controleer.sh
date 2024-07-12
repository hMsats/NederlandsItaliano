cat data.html | grep -v br | grep -v "," | grep -v aantal_voorbeelden | grep -v begin | grep -v einde | grep -v "data=" | grep -v "zinnen en los" | grep -v "\[" | grep -v "\]" | grep -v "DATA EINDIGT HIER" | grep -v "DATA BEGINT HIER"

# controleer dat elke regel (op uitzonderingen na) een backslash heeft
cat data.html | grep -v "\\\\" | grep -v "data." | grep -v "]]);" | grep -v "]];" | grep -v "//" | grep -v "]);" | grep -v "\"]"

# controleer dat nieuwe_pagina goed geschreven is
cat data.html | grep "_" | grep -v nieuwe_pagina | grep -v aantal_voorbeelden
