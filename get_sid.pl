#!/usr/bin/perl
$do="curl -X POST https://api.greypanel.com/api/login -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=test%40gmail.com&password=echochio'"."  2> /dev/null";
$ret=`$do`;
$f_ret='{"result":"';
$l_ret='","response":"success","message":""}';
$o_ret='';
if($ret =~  "success") {
        $ret =~ s/$f_ret/$o_ret/;
        $ret =~ s/$l_ret/$o_ret/;
        print $ret;
}
