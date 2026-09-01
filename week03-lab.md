 What I did
 Enumerated local accounts, groups, members, services, running processes, and SMB shares using PowerShell commands (such as Get-LocalUser, Get-LocalGroupMember, Get-Service, and Get-Process).
 Performed a simulated attack on my own lab machine by creating a sneaky account (backup_svc), granting it administrative privileges, and generating failed logon attempts by locking the screen.
 Investigated security event logs using Event Viewer to trace the simulated attack and successful logins.
 Cleaned up the environment by deleting the test account and removing it from administrative groups.
 Explored and safely created/deleted a test value (LabTest) inside the Windows Registry (HKEY_CURRENT_USER\Control Panel\Desktop).
 Developed, tested, and executed a custom PowerShell investigation script (hunt.ps1) to automate reporting on administrators and failed logons (Event ID 4625).

 The attack I ran on myself, and how I found it
 Events created: 
Event ID 4720: Triggered when creating the new account backup_svc.
Event ID 4732: Triggered when adding backup_svc to the Administrators group.
Event ID 4625: Triggered by entering incorrect passwords after locking the screen (Windows key + L).
Event ID 4624: Recorded successful logins (including checking Logon Type 2 for local keyboard interactive login).
How I found them: Opened Event Viewer, navigated to Windows Logs > Security, and used Filter Current Log... filtered by specific Event IDs to isolate and inspect each malicious or administrative action.

How I built my script
What I searched/asked for: Looked up PowerShell commands to query local group members (Get-LocalGroupMember), filter specific event logs (Get-WinEvent with a hashtable for Security log and ID 4625), and measure object counts (Measure-Object).
What I changed/assembled: Built a structured script that prints a title, lists the local administrators, filters out failed logon events to display their creation time and ID, and finally outputs the total calculated count of those failed login attempts.

The Linux <-> Windows link that stuck
 Registry Run keys vs. Linux cron / startup persistence: Just like attackers use Linux cron jobs, startup scripts, or configuration files in /etc to maintain persistence, Windows malware and attackers target the Windows Registry (such as Run keys) to ensure malicious programs launch automatically at every system boot[span_15](start_span)[span_15](end_span).
 UAC vs. sudo: Windows UAC (User Account Control) serves the exact same purpose as Linux sudo or root permission prompts, managing administrative boundaries and asking for explicit confirmation before elevating privileges.
