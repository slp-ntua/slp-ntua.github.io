#!/usr/bin/perl
#
# Using the file ../../biblio/bibl.9.96.bib
# create a chronological list of all pubs, all journal pubs, all conf pubs etc
#

$fl = "../../jour/bibl.bib";

$jour = 1;
$conf = 1;
$pat  = 1;

@mon = ("jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec");
for ($i=0; $i<=$#mon; $i++){
  $mon_num{$mon[$i]} = $i+1;
}

$jourdir = "preprints/journal/";
$confdir = "preprints/conf/";

open(F,"$fl");
$/ = $EOF;
$dt = <F>;
@F = split(/\n\@/,$dt);
foreach (@F){
  if (/article\{([a-zA-Z0-9]+)/){
    $acro = $1;
    if (/POTAM/){
      if (/month *= *([a-z]+)/){ $month = $1; } else {$month = ""; die("MONTH REQUIRED!!!\n$_");}
      if (/year *= *([0-9]+)/){ $year = $1; } else {$year = ""; die("YEAR REQUIRED!!!\n$_");}
      if (/file *= *["{]([^"^}]+)["}]/){$file = $1;} else {$file = "";}
      if ($file ne ""){$fe{$acro} = $jourdir.$file;}
      if ($jour == 1){
         $mo{$acro} = $mon_num{$month};
         $ye{$acro} = $year;
         print "$acro $month $year\n";
      }
    }
    elsif (/Potamianos/){
       print STDERR "\nWARNING: Potamianos found in\n\n $_\n but no POTAM!!!!!!!!!!!\n\n\n";
    }
  }
  elsif (/inproceedings\{([a-zA-Z0-9]+)/){
    $acro = $1;
    if (/POTAM/){
      if (/month *= *([a-z]+)/){ $month = $1; } else {$month = ""; die($_);}
      if (/year *= *([0-9]+)/){ $year = $1; } else {$year = ""; die($_);}
      if (/file *= *["{]([^"^}]+)["}]/){$file = $1;} else {$file = "";}
      if ($file ne ""){$fe{$acro} = $confdir.$file;}
      if (($conf == 1) && (!(/PATENT/))){
         $mo{$acro} = $mon_num{$month};
         $ye{$acro} = $year;
          print "$acro $month $year\n";
      }
      elsif (($pat == 1) && (/PATENT/)){
         $mo{$acro} = $mon_num{$month};
         $ye{$acro} = $year;
          print "$acro $month $year\n";
      }
    }
    elsif (/Potamianos/){
       print STDERR "\nWARNING: Potamianos found in\n\n $_\n but no POTAM!!!!!!!!!!!\n\n\n";
    }
  }
  elsif (/ARTICLE/){ die("Make ARTICLE small caps\n");}
  elsif (/INPROC/){ die("Make INPROCEEDINGS small caps\n");}
}
close(F);


########### SORT in chronological order (reverse)

@tmp = keys %mo;

#for ($y = 1991; $y <=2010; $y++){
for ($y = 2030; $y >=1991; $y--){
#  for ($m = 1; $m <=12; $m++){
   for ($m = 12; $m >=1; $m--){
    @out = ();
    foreach (@tmp){
      if (($mo{$_} eq $m) && ($ye{$_} eq $y)){
          push @out, $_;
#         print "$_ $mo{$_} $ye{$_}\n";
      }
    }
    @res = (@res, sort(@out));
  }
}
print join(",",@res), "\n";

print "\n\nWARNING: two last pubs of 2016 are actually conference publications but listed from arxiv !!!!\n\n";

### 2014 addition :-)
open(F,">label2file.txt");
foreach (keys %fe){
  print F "$_\t$fe{$_}\n";
}
close(F);







