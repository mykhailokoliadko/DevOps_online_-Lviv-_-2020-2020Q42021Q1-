#!/bin/bash

exlog=/home/mike/BashTaskLinux/example_log.log

echo "From which ip were the most request"
awk '{print $1}' $exlog | sort -n -t. -k1,1 -k2,2 -k3,3 -k4,4 | uniq -c | sort -n -r -s | head -n5
echo "what is the most request page"
awk '{print $7}' $exlog | sort -n -t. -k1,1 -k2,2 -k3,3 -k4,4 | uniq -c | sort -n -r -s | head -n5
echo "how many request were there from each ip"
grep -ao '\(http\|ftp\|https\)\://[0-9A-Za-z\-\.]\+/' $exlog | sort | uniq -c | sort -rn | head -n5
echo "what time did site get the most requests" 
grep "20*" $exlog | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $2":00"}' | sort -n | uniq -c

