#!/bin/bash
source ~/.bash_lib/string

# Variable par défaut pour le format
FORMAT="%s %s"

# Traitement des options
while (( $# > 0 ))
do
    if [[ "$1" =~ ^(-F|--format)$ ]];
    then
        FORMAT="%s %-24s"
        shift
    else
	IP="$1"
    fi
    shift
done

if [[ ($IP =~ ^10\.) || ($IP =~ ^192\.168\.) || ($IP =~ ^172\.16\.) ]]
then
    echo "LAN"
    exit 0
elif out=$(grep -m1 "$IP" /tmp/mygeoip)
then
    echo "$(string.word.first.remove "$out") [c]"
    exit 0
fi

result="$(whois $IP | awk -v IGNORECASE=1 -v format="$FORMAT" '/country:/ {country=$2} /netname:/ {netname=$2} END {printf(format, country, netname)}')"

# without quoting,
# the spaces should disappear
echo $IP $result >> /tmp/mygeoip
echo "$result"
exit 0
