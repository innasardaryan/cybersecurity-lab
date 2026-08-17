# Week 1 – Lab: building the stand

## What I built
- Three VMs: Ubuntu Desktop, Ubuntu Server (no GUI), Kali Linux, Windows 10
- Configured Internal Network (labnet) and manual IP addresses

## What broke and how I fixed it
- VMs could not ping each other ("Network is unreachable"). Fixed by bringing the interfaces UP with sudo ip link set <interface> up and assigning IP addresses manually.

## What I did not understand yet
- How netplan or persistent network configurations work in Ubuntu compared to temporary ip addr commands.

## Network map
- ubuntu-lab: 192.168.56.10
- ubuntu-srv: 192.168.56.11 (no GUI, SSH installed)
- kali: 192.168.56.20
- win10-lab: 192.168.56.30 (firewall drops ICMP)
