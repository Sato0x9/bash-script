#!/bin/bash

# 1. check arguments
if [ $# -ne 2 ]; then
    echo "error: missing arguments"
    echo "usage: ./script.sh <name> <domain>"
    exit 1
fi

name=$1
domain=$2

# 2. ping domain
if ping -c 1 $domain &> /dev/null; then
    echo "ping successful"
    status="success"
else
    echo "ping failed"
    status="failed"
fi

# 3. csv file
echo "name,domain,date,status" > output.csv
echo "$name,$domain,$(date +"%d/%m/%Y %H:%M:%S"),$status" >> output.csv

cat output.csv
