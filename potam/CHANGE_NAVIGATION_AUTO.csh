foreach i ( `grep Publications *.html | grep href | cut -f1 -d:` )
 sed '1,$s/href..publications.html..Publ/href="publications_by_year.html">Publ/' $i > /tmp/selfy.tmp
 /bin/mv /tmp/selfy.tmp $i
end

