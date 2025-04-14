#!/usr/bin/gawk -f
# call with -v column=n -v command=net.ip.geo|net.ip.info
# where n is the column containing the IP

    {
	IP=$column
	match(IP,regex_IP,A);
	command_full = command  " " A[0] " | pretty.ellipsis 33" ;
	geo=exec_command(command_full);
	$column=sprintf("%24s ",IP);
	if ($column) {
	    $column=sprintf("%s %-32s",$column,geo);
	}
	print;
    }
    
