#!/bin/bash

dir=$1
output=$2

declare -a zerohosts=(
"jmd_cloudflare"
"jmd_facebook"
"jmd_google"
"jmd_microsoft"
"jmd_pinterest"
"malwaredomainlist"
"nsablocklist"
"osxparanoia"
"someonewhocares"
"winhelp2002"
"yoyo_adservers"
)

declare -a hosts=(
"jmd_cloudflare"
"jmd_facebook"
"jmd_google"
"jmd_microsoft"
"jmd_pinterest"
"malwaredomainlist"
"nsablocklist"
"osxparanoia"
"someonewhocares"
"winhelp2002"
"yoyo_adservers"
)

declare -a domains=(
"jmd_cloudflare"
"jmd_facebook"
"jmd_google"
"jmd_microsoft"
"jmd_pinterest"
"malwaredomainlist"
"nsablocklist"
"osxparanoia"
"someonewhocares"
"winhelp2002"
"yoyo_adservers"
)

declare -a cidr=(
"nsablocklist"
)

declare -a ip_list=(
"malwaredomainlist"
"yoyo_adservers"
)

declare -a ranges=(
"nsablocklist"
)

case "$dir" in
"0hosts")
    for ((i = 0; i < ${#zerohosts[@]}; i++))
    do
      cat built/0hosts/${zerohosts[$i]}.txt >> concat/$output.txt
    done
    ;;
"hosts")
    for ((i = 0; i < ${#hosts[@]}; i++))
    do
      cat built/hosts/${hosts[$i]}.txt >> concat/$output.txt
    done
    ;;
"domains")
    for ((i = 0; i < ${#domains[@]}; i++))
    do
      cat built/domains/${domains[$i]}.txt >> concat/$output.txt
    done
    ;;
"cidr")
    for ((i = 0; i < ${#cidr[@]}; i++))
    do
      cat built/cidr/${cidr[$i]}.txt >> concat/$output.txt
    done
    ;;
"ip_list")
    for ((i = 0; i < ${#ip_list[@]}; i++))
    do
      cat built/ip_list/${ip_list[$i]}.txt >> concat/$output.txt
    done
    ;;
"ranges")
    for ((i = 0; i < ${#ranges[@]}; i++))
    do
      cat built/ranges/${ranges[$i]}.txt >> concat/$output.txt
    done
    ;;
esac
