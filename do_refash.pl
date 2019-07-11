#!/usr/bin/perl
$inp=$ARGV[0];
chomp($inp);
@sites = split / /, `./get_site.pl`;
$a=0;
foreach $site (@sites) {
        $a=$a+1;
        if($site =~  $inp){
               last;
       }
}
$do = "curl -X GET 'https://api.greypanel.com/api/cache/clear-site-uid?uid=".$sites[$a]."' -H 'Content-Type:application/x-www-form-urlencoded' -H 'Cookie:sid=".$sites[0]."' 2> /dev/null";
$ret = `$do`;
print $ret;
