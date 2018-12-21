#!/bin/bash
number=2
if [ $1 ]; then
	number=$1

fi
#echo "input is "$number
number=`expr $number + 1`
curl -s -X GET "ipaddress:port/_cat/indices?pretty&index=logstash*"| sort -rk3 | tail +$number | while read line; do 
echo "$line" | cut -d " " -f 3,4 | awk {'print $2" file will be compressed into file "$1".tar\n"'}
done
