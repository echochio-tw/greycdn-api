#!/usr/bin/perl
use JSON;
$ret = `./get_sid.pl`;
$do="curl -X GET 'https://api.greypanel.com/api/site/find-sites?keyWord=&page=1&pageSize=200' -H 'Content-Type:application/x-www-form-urlencoded' -H 'Cookie:sid=".$ret."'"."  2> /dev/null";
$ret_data=`$do`;
$ret_data = substr($ret_data, index($ret_data,"["));
$ret_data = substr($ret_data, 0, index($ret_data,"]")+1);
$obj = from_json($ret_data);
print $ret;
foreach $item( @$obj ) {
	print " ".$item->{name};
	print " ".$item->{uid};
}
