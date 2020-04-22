#!/usr/bin/perl
#
# turns publications.html into publication_by_year.html
# i.e., type of publication => year of publication ordered 
# 
# assumes a specific structure in the publication.html file 
# (see hardcoded stuff below)

$no = -1; ### publications now start from 0 ... N-1
$ign = 0;
$fin = 0;
$sta = 1;
$header = "";
$footer = "";
foreach (<>){
  if ($sta == 1){ $header .= "$_";}
  if ($fin == 1){ $footer .= "$_";}
  chomp; unless ((/"$/) || (/>$/)){ $_ .= " ";}
  if (/Finish Main Content/){ $fin = 1;} # hardcoded
  if (/Started Main Content/){ $sta = 0;} # hardcoded
  if (/<!--/){ $ign = 1;}
  unless (($ign == 1) || ($fin == 1) || ($sta == 1)){ ## ignore html comments and header/sidebar/footer
    if (/(<li>|<LI>)/){ # hardcoded
      $in = 1;
      $no++;
    }
    if ($in == 1){
      $publ{$no} .= $_;
    }
    if (/(<\/li>|<\/LI>)/){ # hardcoded
      $in = 0;
    }
  }
  if (/-->/){ $ign = 0;}
}
$total_no = $no;

$mny = 3000;
$mxy = 0;
foreach (keys %publ){
  if ($publ{$_} =~ /(19[89][0-9]|20[01234][0-9])/){
    $year = $1;
  } else { die("No year found in $publ{$_}\n");}
  $year{$_} = $year;
  if ($year < $mny) { $mny = $year;}
  if ($year > $mxy) { $mxy = $year;}
  #print $year,"\n";
  #print  $publ{$_},"\n";
}
 
print $header;
for ($i = $mxy; $i >=$mny; $i--){ 
  unless ($i == 1992){ print '<h2> ', $i,' </h2>',"\n", '<ul>',"\n";}
#  foreach (keys %publ){
   for ($no=0; $no <= $total_no; $no++){ ### follow the same order as in publications.html (books,jour,conf in order of appearence for same year)
     if ($year{$no} == $i){
       print $publ{$no},"\n";
     }
  }
  unless ($i == 1992){ print "\n", '</ul>',"\n";}
}
print $footer;

