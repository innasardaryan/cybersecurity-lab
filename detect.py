import csv
import sys
def is_alarm(count):
	return count > 30
file = sys.argv[1]
ip_number = {}
fails = {}
with open(file, mode='r') as f:
	read = csv.DictReader(f)
	for row  in read:
            if row['result'] == "fail":
               ip = row['src_ip']
               fails[ip] = fails.get(ip, 0) + 1
for ip,count in fails.items():
    if is_alarm(count):
       print(f"alarm:{ip} | fails: {count}")

