# Week 2 — Lab: Linux fundamentals

## What I did
- Explored file system navigation and checked system accounts (`/etc/passwd`).
- Learned and modified file permissions (`chmod`), broke permissions to test access restrictions, and hunted for SUID (`find / -perm -4000`) and world-writable (`find /etc -perm -0002`) files.
- Analyzed authentication logs (`/var/log/auth.log`) for `sudo` usage and failed login attempts.
- Configured a scheduled cron job (`crontab -e`) to output time to `heartbeat.log` every minute, and checked system-wide cron jobs (`/etc/cron.d/`).
- Generated an Ed25519 SSH key pair, copied the public key to `ubuntu-srv`, verified passwordless login, and hardened the SSH service.

## The command that made something click
- `find / -perm -4000 -type f 2>/dev/null` — It made me understand how elevated permissions work in Linux and how critical SUID binaries are for privilege escalation audits.

## What broke and how I fixed it
- **Issue:** OpenSSH server was not installed/running, and the VMs were configured on an Internal Network, preventing package downloads and SSH connection attempts.
- **Fix:** Temporarily changed the network adapter settings on both `ubuntu-lab` and `ubuntu-srv` in VirtualBox to NAT, installed OpenSSH (`sudo apt install openssh-server`), and then restored the static IP configuration on the Internal Network.

## The hardening I performed
- Disabled SSH password login on `ubuntu-srv` by setting `PasswordAuthentication no` in `/etc/ssh/sshd_config` and restarting the SSH service.
- **Why it matters:** It prevents brute-force login attacks entirely, allowing authentication only via trusted SSH key pairs (`id_ed25519`).
