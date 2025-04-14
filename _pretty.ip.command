#!/bin/bash
command="$1"
column="$2"
AWKPATH=~/SYNCHRO/lib/ _pretty.ip.command.awk  -f awk -v column="$column" -v command="$command"
