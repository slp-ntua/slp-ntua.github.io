latex myconf.tex
latex myconf.tex
bibtex myconf
latex myconf.tex
latex myconf.tex
latex myconf.tex

latex myjour.tex
latex myjour.tex
bibtex myjour
latex myjour.tex
latex myjour.tex
latex myjour.tex

latex mypat.tex
latex mypat.tex
bibtex mypat
latex mypat.tex
latex mypat.tex
latex mypat.tex

latex mypubl.tex
latex mypubl.tex
bibtex mypubl
latex mypubl.tex
latex mypubl.tex
latex mypubl.tex

dvips myconf.dvi
dvips myjour.dvi
dvips mypat.dvi
dvips mypubl.dvi

dvipdf myconf.dvi
dvipdf myjour.dvi
dvipdf mypat.dvi
dvipdf mypubl.dvi

bbl2html.pl < mypubl.bbl > mypubl.html
bbl2html.pl < myconf.bbl > myconf.html
bbl2html.pl < myjour.bbl > myjour.html
