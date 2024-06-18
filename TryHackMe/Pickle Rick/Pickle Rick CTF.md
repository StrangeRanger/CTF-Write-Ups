# Pickle Rick CTF

> **Link to room**: https://tryhackme.com/r/room/picklerick
>
> **Difficulty**: Easy
>
> **Date completed**: June 14, 2024

### Instructions

This Rick and Morty-themed challenge requires you to exploit a web server and find three ingredients to help Rick make his potion and transform himself back into a human from a pickle.

**Answer the questions below:**

- What is the first ingredient that Rick needs?
  - \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
- What is the second ingredient in Rick’s potion?
  - \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
- What is the last and final ingredient?
  - \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

## Port Scan

As usual, I began by performing an `nmap` scan on the target system to identify any open ports and the software running on them.

![nmap scan](images/nmap-scan.png)

The scan revealed that the following ports were open:

- **22/tcp:** SSH
- **80/tcp:** HTTP

### SSH Authentication Method

Discovering that port 22 was open, I quickly checked the authentication method used by the SSH service. It turned out to be key-based authentication, meaning that utilizing SSH to gain entry was not an option at this point.

![ssh auth method](images/ssh-auth-method.png)

## Web Investigation

With SSH being a dead end, I turned my attention to the website. While inspecting the site using the browser's inspector tool, I found a comment indicating a username.

![html username comment](images/html-username-comment.png)

While I wasn't sure where this username would be used, I made a note of it for future reference.

## Web Enumeration

Next, I performed an enumeration scan on the website to uncover hidden pages or directories. Here are the results of the `gobuster` scans:

![gobuster part 1](images/gobuster-part-1.png)

![gobuster part 2](images/gobuster-part-2.png)

### robots.txt

Noticing the existence of `robots.txt`, I decided to check its contents to see if it contained any useful information.

![robots.txt](images/robots-txt.png)

Similar to the username, I wasn't sure where this string might be used, but I thought it might be a password, which could be used in conjunction with the username found earlier.

## Login Page

`gobuster` had also revealed the existence of a login page. I decided to check it out to see if the username and string from `robots.txt` could be used to log in.

![dashboard](images/dashboard.png)

Awesome! I was able to log in with the credentials I had found. Now, I could explore the new sections that had become available to me.

## Command Panel

The first thing I noticed after logging in was a page called "command panel," which, with some testing, I found allowed me to execute commands on the server. With this newfound ability, I first decided to see if I could check my permissions and who I might be on the server.

![whoami](images/whoami.png)

![sudo -l](images/sudo--l.png)

Despite not having root access, I was able to execute commands as the user `www-data` and even had permissions to execute any command with `sudo`.

### System Investigation

Since I had high level permissions, I decided to investigate the system further. The first step was to orient myself by checking the current directory. Immediately, I noticed a file named `Sup3rS3cretPickl3Ingred.txt`. I decided to read the contents of the file, but I ran into a problem where I was unable to use `cat`, among other commands, to read the file.

![no cat](images/no-cat.png)

After some trial and error, I found that I could use `sed '' <file name>` to read the contents of the file. With this, I was able to read the contents of `Sup3rS3cretPickl3Ingred.txt`, identifying the first ingredient that Rick needed for his potion.

![first ingredient](images/first-ingredient.png)

After a bit more exploring, I located the second ingredient within Rick's home directory.

![second ingredient](images/second-ingredient.png)

The third and final ingredient was located in the root directory. Despite the root's home directory being inaccessible due to permission restrictions, I was easily able to gain access since I had `sudo` permissions. The third ingredient was located in a file named `3rd.txt`.

![third ingredient](images/third-ingredient.png)

This completes the challenge of finding all three ingredients Rick needs for his potion.
