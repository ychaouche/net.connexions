#!/bin/bash
command="$1"
column="$2"
_pretty.ip.command.awk  -f awklib -v column="$column" -v command="$command"
