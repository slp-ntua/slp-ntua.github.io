#!/usr/bin/perl

$ad = "preprints/";
foreach (<journal/*>){
  print '<a href="',$ad,$_,'"',"\n";
}
