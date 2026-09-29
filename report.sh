#!/bin/bash
log="$1"
total=$(grep -i "failed password" "$log"| wc -l)
echo  "total fails:$total"
ips=$(grep -i "failed password"  "$log" | awk '{print $(NF-3)}' | sort | uniq -c| sort -rn | head -5)
echo "top 5 ips:$ips"

