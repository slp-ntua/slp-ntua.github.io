#!/usr/bin/perl
#
# organize by area and reverse year 
#

@areas = ("Lexical Semantics and Speech Understanding", "Robust Speech Recognition", "Multimodal Dialogue Systems", "AM-FM Speech Model and Energy Operators", "Children Speech Analysis, ASR and HCI", "Emotion Recognition", "Multimedia Processing","Other"); 
#### other parafac, synthesis ???

#### unique mapping from papers to categories for now :-(
$keywords{"valence"} = 5; $keywords{"Valence"} = 5;
$keywords{"similarity"} = 0; $keywords{"Similarity"} = 0;
$keywords{"understanding"} = 0; $keywords{"Understanding"} = 0;
$keywords{"grammar"} = 0; $keywords{"Grammar"} = 0;
$keywords{"harvest"} = 0; $keywords{"Harvest"} = 0;
$keywords{"semantic"} = 0; $keywords{"Semantic"} = 0;
$keywords{"meaning"} = 0; $keywords{"Meaning"} = 0;
$keywords{"policy"} = 0; $keywords{"Policy"} = 0;
$keywords{"ASR "} = 1;
$keywords{"HMM"} = 1;
$keywords{"stream"} = 1; $keywords{"Stream"} = 1;
$keywords{"recognition"} = 1; $keywords{"Recognition"} = 1;
$keywords{"robust"} = 1; $keywords{"Robust"} = 1;
$keywords{"dialogue"} = 2; $keywords{"Dialogue"} = 2;
$keywords{"dialog"} = 2; $keywords{"Dialog"} = 2;
$keywords{"modality"} = 2; $keywords{"Modality"} = 2;
$keywords{"inactivity"} = 2;
$keywords{"DARPA"} = 2;
$keywords{"AGORA"} = 2;
$keywords{"modulation"} = 3; $keywords{"Modulation"} = 3;
$keywords{"AM"} = 3;
$keywords{"operator"} = 3; $keywords{"Operator"} = 3;
$keywords{"instantaneous"} = 3; $keywords{"Instantaneous"} = 3;
$keywords{"Teager"} = 3;
$keywords{"school"} = 4;
$keywords{"child"} = 4; $keywords{"Child"} = 4;
$keywords{"Developmental"} = 4; 
$keywords{"affect"} = 5; $keywords{"Affect"} = 5;
$keywords{"emotion"} = 5; $keywords{"Emotion"} = 5;
$keywords{"movie"} = 6; $keywords{"Movie"} = 6;
$keywords{"salien"} = 6; $keywords{"Salien"} = 6;
$keywords{"Gros"} = 6;
$keywords{"Siltan"} = 6;
$keywords{"Multimedia"} = 6;
$keywords{"sentiment"} = 5; $keywords{"Sentiment"} = 5;
$keywords{"affect"} = 5; $keywords{"Affect"} = 5;
$keywords{"affective"} = 5; $keywords{"Affective"} = 5;
$keywords{"semantic-affective"} = 5; 

$no = 0;
$ign = 0;
$fin = 0;
$sta = 1;
$header = "";
$footer = "";
foreach (<>){
  if ($sta == 1){ $header .= "$_";}
  if ($fin == 1){ $footer .= "$_";}
  chomp; unless ((/"$/) || (/>$/)){ $_ .= " ";}
  if (/Finish Main Content/){ $fin = 1;}
  if (/Started Main Content/){ $sta = 0;}
  if (/<!--/){ $ign = 1;}
  unless (($ign == 1) || ($fin == 1) || ($sta == 1)){ ## ignore html comments and header/sidebar/footer
    if (/(<li>|<LI>)/){
      $in = 1;
      $no++;
    }
    if ($in == 1){
      $publ{$no} .= $_;
    }
    if (/(<\/li>|<\/LI>)/){ 
      $in = 0;
    }
  }
  if (/-->/){ $ign = 0;}
}

open(F,">sort_publ_by_year_and_area.LOG");
# print F "Run on ",system(date),"\n";

$mny = 3000;
$mxy = 0;
foreach $pubid (keys %publ){
  if ($publ{$pubid} =~ /(19[89][0-9]|20[01234][0-9])/){
    $year = $1;
    print F " $year .. ";
  } else { die("No year found in $publ{$_}\n");}
  print F "\n";
  $year{$pubid} = $year;
  if ($year < $mny) { $mny = $year;}
  if ($year > $mxy) { $mxy = $year;}
  #print $year,"\n";
  foreach (keys %keywords){
    if ($publ{$pubid} =~ /$_/){
      $theme{$pubid} = $keywords{$_};
      print F "(",$theme{$pubid},",$year) ..";
    }
  }
  print F "\n";
  unless (defined $theme{$pubid}){
    $theme{$pubid} = $#areas; # i.e., Other
    print F "Warning no theme found in $publ{$pubid}\n";
  }
  #print  $publ{$pubid},"\n";
}

# foreach (keys %publ){ print $theme{$_}, "\t", $publ{$_},"\n"; } die;
 
print $header;
for ($j = 0; $j <= $#areas; $j++){ # by area
 print '<h2 id = "',$j+1,'"> ', $areas[$j],' </h2>',"\n", '<ul>',"\n";
 for ($i = $mxy; $i >=$mny; $i--){ # by reverse year
  foreach (keys %publ){
    if (($year{$_} eq $i) && ($theme{$_} eq $j)){
      print $publ{$_},"\n";
    }
  }
 }
 print "\n", '</ul>',"\n";
} 
print $footer;
print F "\nMAX year: $mxy\nMIN year: $mny\n";
close(F);

