#!/bin/bash


# Download source host files
find . -name "source" -type d -exec rm -rf {} \;
mkdir source/;
mkdir source/ips;
mkdir source/hosts;

curl -O -g "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&startdate[day]=&startdate[month]=&startdate[year]=&useip=0.0.0.0;showintro=0";
mv serverlist.php\?hostformat\=hosts\&startdate\[day\]\=\&startdate\[month\]\=\&startdate\[year\]\=\&useip\=0.0.0.0\;showintro\=0 yoyo_adservers.txt;
sed -i '' '/<pre>/,$!d' yoyo_adservers.txt; sed -i '' '/<pre>/d' yoyo_adservers.txt; sed -i '' '/<\/pre>/,$d' yoyo_adservers.txt;
mv yoyo_adservers.txt source/hosts/yoyo_adservers.txt;

curl -O "https://raw.githubusercontent.com/l1k/osxparanoia/master/hosts";
mv hosts osxparanoia.txt;
sed -i '' 's/127.0.0.1/0.0.0.0/g' osxparanoia.txt;
sed -i '' '/localhost/d' osxparanoia.txt;
sed -i '' '/broadcasthost/d' osxparanoia.txt;
mv osxparanoia.txt source/hosts/osxparanoia.txt

curl -O "http://winhelp2002.mvps.org/hosts.txt";
mv hosts.txt winhelp2002.txt;
mv winhelp2002.txt source/hosts/winhelp2002.txt;

curl -O "http://someonewhocares.org/hosts/zero/hosts";
mv hosts someonewhocares.txt;
mv someonewhocares.txt source/hosts/someonewhocares.txt;

curl -O "https://www.malwaredomainlist.com/hostslist/hosts.txt";
mv hosts.txt malwaredomainlist.txt;
sed -i '' 's/127.0.0.1/0.0.0.0/g' malwaredomainlist.txt;
sed -i '' '/localhost/d' malwaredomainlist.txt;
sed -i '' '/broadcasthost/d' malwaredomainlist.txt;
mv malwaredomainlist.txt source/hosts/malwaredomainlist.txt;

curl -O "https://raw.githubusercontent.com/CHEF-KOCH/NSABlocklist/master/HOSTS.txt";
mv HOSTS.txt nsablocklist.txt;
mv nsablocklist.txt source/hosts/nsablocklist.txt;

curl -O "https://pgl.yoyo.org/adservers/iplist.php?ipformat=plain&showintro=1&mimetype=plaintext";
mv iplist.php\?ipformat\=plain\&showintro\=1\&mimetype\=plaintext yoyo_adservers.txt;
mv yoyo_adservers.txt source/ips/yoyo_adservers.txt;

curl -O "https://www.malwaredomainlist.com/hostslist/ip.txt";
mv ip.txt source/ips/malwaredomainlist.txt;

curl -O "https://raw.githubusercontent.com/CHEF-KOCH/NSABlocklist/master/Super%20Ranges.txt";
mv Super%20Ranges.txt source/ips/nsablocklist.txt;

curl -O "https://raw.githubusercontent.com/jmdugan/blocklists/master/corporations/pinterest/all";
mv all source/hosts/jmd_pinterest.txt;

curl -O "https://raw.githubusercontent.com/jmdugan/blocklists/master/corporations/cloudflare/all";
mv all source/hosts/jmd_cloudflare.txt;

curl -O "https://raw.githubusercontent.com/jmdugan/blocklists/master/corporations/facebook/all";
mv all source/hosts/jmd_facebook.txt;

curl -O "https://raw.githubusercontent.com/jmdugan/blocklists/master/corporations/google/non_localized";
mv non_localized source/hosts/jmd_google.txt;

curl -O "https://raw.githubusercontent.com/jmdugan/blocklists/master/corporations/microsoft/all";
mv all source/hosts/jmd_microsoft.txt;
