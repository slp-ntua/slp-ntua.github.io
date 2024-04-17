#!/usr/bin/perl
#
# a simple script that turns .bib into html format
#

# INPUT 
#
#\bibitem{KlPoIo13}
#I.~Klasinas, A.~Potamianos, E.~Iosif, S.~Georgiladakis, and G.~Mameli, ``Web
#  data harvesting for speech understanding grammar induction,'' in {\em Proc.
#  Interspeech}, (Lyon, France), Aug. 2013.

# OUTPUT 
#<LI>E.&nbsp;Sanchez-Soto, A.&nbsp;Potamianos, and K.&nbsp;Daoudi, "
#<a href="preprints/journal/2009_soto_potamianos_daoudi_draft.pdf">
#Unsupervised stream weight computation in classification and recognition tasks
#</a>,'' <EM>IEEE Transactions on Audio, Speech
#  and Language Processing</EM>,  vol. 17, no. 3, pp. 436-445, Mar. 2009.
#<P>
#</LI>

# load labels
open(F,"label2file.txt");
foreach (<F>){
  chomp;
  @F = split;
  $fe{$F[0]} = $F[1];
}
close(F);

foreach (<>){
 if (/bibitem{([a-zA-Z0-9]+)}/){
   $lab = $1;
 }
 s/.*bibitem.*/<LI>/;
 s/\~/\&nbsp;/g;
 s/\(([a-zA-Z ]+,[a-zA-Z ]+)\)/$1/;
if (defined($fe{$lab})){
 s/``/"<a href="$fe{$lab}">/;
 s/,''/<\/a>,"/;
} else { 
 s/``/"/g;
 s/''/"/g;
}
 s/{([^}^\\]*)}/$1/g;
# s/{\\em([^}]*)}/<EM>$1<\/EM>/g;
 s/{\\em/<EM>/;
 s/}/<\/EM>/;
 s/([0-9][0-9][0-9][0-9]\.)/$1 <P> <\/LI>/;
 unless (/thebibliogra/){
  print;
 }
}

#
#"<a href="preprints/journal/2009_iosif_potamianos_PREGALLEY.pdf">
#Unsupervised Semantic Similarity Computation Between Terms Using Web Documents
#</a>,'' <EM>
