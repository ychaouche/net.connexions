#-*- shell-script -*-

export INTERFACE=eth4 # CHANGEME
export TERM=xterm

alias pretty.ip.geo='_pretty.ip.command net.ip.geo'
alias pretty.ip.reputation='_pretty.ip.command net.ip.reputation'
declare -x _tcpdump_default_args="-i $INTERFACE -q -l -n"
declare -x _tcpdump_filter_default="host $(net.ip.private) and (tcp[13]==2 or icmp or udp)"
declare -x _tcpdump_filter_outside="net not (192.168.0.0/16 or 172.16.0.0/16 or 10.0.0.0/8)"

function string.word.first {
    echo "${1%% *}"
}

function string.word.first.remove {    
    echo "${1#* }"
}

function string.word.last {
    echo "${1##* }"
}

function string.word.last.remove {    
    echo "${1% *}"
}

function string.isnumber {
    [[ $1 =~ [0-9]+ ]]
    return $?
}

