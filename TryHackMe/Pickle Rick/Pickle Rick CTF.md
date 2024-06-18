# Pickle Rick CTF

> **Link to room**: https://tryhackme.com/r/room/picklerick
> **Difficulty**: Easy
> **Date complete**: June 15, 2024

### Instructions

This Rick and Morty-themed challenge requires you to exploit a web server and find three ingredients to help Rick make his potion and transform himself back into a human from a pickle.

## Port Scan

As per usual, I begin by performing an `nmap` scan on the target system to identify any open ports and the software running on them.

![[nmap-scan.png]]

### SSH Auth Type

Knowing port 22 was open, I ran a quick check to see what authentication method the SSH service used, which I found to be public key authentication. This means that, at least for now, utilizing SSH to gain entry is impossible.

![[ssh-auth-method.png]]

## Web Investigation

With SSH being a dead end, I looked at the website. After sifting through the website using the inspector tool, I noticed a comment made within the HTML:

![[html-username-comment.png]]

Great, I now had a username; whether it was for SSH or another service was still unknown.

## Web Directory Scan

Now, I enumerate the website to identify existing pages or directories that aren't readily visible. As a result, I'm 

![[gobuster-part-1.png]]

![[Screenshot 2024-06-15 at 7.34.26 PM.png]]

### robots.txt

Checking out the contents of the `robots.txt` file, the contents are `Wubbalubbadubdub`.

![[Screenshot 2024-06-15 at 6.38.35 PM.png]]


CONTINUE FROM HERE
# Login Page

![[Screenshot 2024-06-15 at 6.40.47 PM.png]]

Using the following, I logged into the console:
- Username: R1ckRul3s
- Password: Wubbalubbadubdub

![[Screenshot 2024-06-15 at 6.42.04 PM.png]]

## Command Panel

![[Screenshot 2024-06-15 at 6.47.00 PM.png]]

Time to check what kind of permissions I have:

![[Screenshot 2024-06-15 at 6.52.01 PM.png]]

```
1 jerry tear
```

![[Screenshot 2024-06-15 at 6.59.47 PM.png]]

```
3rd ingredients: fleeb juice
```

![[Screenshot 2024-06-15 at 7.01.25 PM.png]]