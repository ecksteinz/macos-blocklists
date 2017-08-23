declare -a hosts=(
"yoyo_adservers.txt"
"winhelp2002.txt"
"someonewhocares.txt"
"malwaredomainlist.txt"
"nsablocklist.txt"
"osxparanoia.txt"
"jmd_pinterest.txt"
"jmd_cloudflare.txt"
"jmd_facebook.txt"
"jmd_google.txt"
"jmd_microsoft.txt"
)

rm -rf built/;
mkdir built/;
mkdir built/hosts;
mkdir built/0hosts;
mkdir built/domains;
mkdir built/ip_list;
mkdir built/cidr/;
mkdir built/ranges/;

for ((i = 0; i < ${#hosts[@]}; i++))
do

  cp source/hosts/${hosts[$i]} built/0hosts/${hosts[$i]}

  cp source/hosts/${hosts[$i]} built/hosts/${hosts[$i]}

  cp source/hosts/${hosts[$i]} built/domains/${hosts[$i]}

  sed -i '' 's/0.0.0.0/127.0.0.1/g' built/hosts/${hosts[$i]}

  sed -i '' 's/0.0.0.0//g' built/domains/${hosts[$i]}
  sed -i '' '/^#/ d' built/domains/${hosts[$i]}
  sed -i '' '/^$/d;s/[[:blank:]]//g' built/domains/${hosts[$i]}
  sed -i '' '/^[[:space:]]*$/d' built/domains/${hosts[$i]}
  sed -i '' '/localhost/d' built/domains/${hosts[$i]}
  sed -i '' '/127.0.0.1/d' built/domains/${hosts[$i]}
  sed -i '' '/255.255.255.255/d' built/domains/${hosts[$i]}
  sed -i '' '/broadcasthost/d' built/domains/${hosts[$i]}
  sed -i '' 's/#.*//' built/domains/${hosts[$i]}

done

declare -a ips=(
"malwaredomainlist.txt"
"yoyo_adservers.txt"
)

for ((i = 0; i < ${#ips[@]}; i++))
do
  cp source/ips/${ips[$i]} built/ip_list/${ips[$i]}
done

# Exception for NSA Blocklist Super Ranges
cp source/ips/nsablocklist.txt built/cidr/nsablocklist.txt;
cp source/ips/nsablocklist.txt built/ranges/nsablocklist.txt;

LANG=C sed -i '' '/Part/,$!d' built/ranges/nsablocklist.txt;
LANG=C sed -i '' '/Part/d' built/ranges/nsablocklist.txt;
LANG=C sed -i '' '/CIDR/,$d' built/ranges/nsablocklist.txt;
LANG=C sed -i '' '/^$/d;s/[[:blank:]]//g' built/ranges/nsablocklist.txt;
LANG=C sed -i '' '/^[[:space:]]*$/d' built/ranges/nsablocklist.txt;

LANG=C sed -i '' '/CIDR/,$!d' built/cidr/nsablocklist.txt;
LANG=C sed -i '' '/CIDR/d' built/cidr/nsablocklist.txt;
LANG=C sed -i '' '/^$/d;s/[[:blank:]]//g' built/cidr/nsablocklist.txt;
LANG=C sed -i '' '/^[[:space:]]*$/d' built/cidr/nsablocklist.txt;
