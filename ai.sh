#!/bin/bash


for log_file in logs/*.log; do
    
    [ -e "$log_file" ] || continue

    
    host=$(basename "$log_file" | cut -d'.' -f1)

   
    grep "Failed password" "$log_file" | awk '{print $(NF-3)}' | sort | uniq -c | sort -rn | while read count ip; do
        echo "Host: $host | IP: $ip | Count: $count"
    done
done
