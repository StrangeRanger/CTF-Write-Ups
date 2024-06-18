# Jurassic Park CTF

> **Link to room**: https://tryhackme.com/r/room/jurassicpark
> **Difficulty**: Hard
> **Date completed**: ???

### Instructions

This medium-hard task will require you to enumerate the web application, get credentials to the server, and find four flags hidden around the file system. Oh, _**Dennis**_ Nedry has helped us secure the app, too.  

You'll also want to turn up your device's volume (firefox is recommended). So, deploy the VM and get hacking.

Please [connect to our network](https://tryhackme.com/access) before deploying the machine.

**Answer the questions below:**

- What is the name of the SQL database serving the shop information?  
    - \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
- How many columns does the table have?
    - \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
- What is the system version?
    - \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
- What is Dennis' password?
    - \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
- What are the contents of the first flag?
    - \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
- What are the contents of the second flag? 
    - \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
- What are the contents of the third flag?  
    - \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
- There is no fourth flag.
    - Complete
- What are the contents of the fifth flag?
    - \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

## Port Scanning

Let's perform a port scan to identify open ports and the possible software running on them:

![[Capture The Flag/TryHackMe CTFs/Jurassic Park/images/nmap-scan.png]]

### SSH Auth Method

Let's identify what method the SSH protocol accepts:

![[Capture The Flag/TryHackMe CTFs/Jurassic Park/images/ssh-auth-method.png]]

## Web Enumeration and Investigation

![[Capture The Flag/TryHackMe CTFs/Jurassic Park/images/gobuster-part-1.png]]

![[gobuster-part-2.png]]

### /delete

![[Screenshot 2024-06-18 at 9.35.35 AM.png]]

### robots.txt

![[Capture The Flag/TryHackMe CTFs/Jurassic Park/images/robots.txt.png]]

## SQL Injection

Noticing that the server used both PHP and SQL, I attempted to perform a simple sql injection while waiting for my port scan to complete and was faced with the following screen:

![[sql-injection-attempt.png]]

Towards the bottom, it also said, "Try SqlMap.. I dare you..", so I decided to accept the dare. But first, I'll be going back to my port scan...
