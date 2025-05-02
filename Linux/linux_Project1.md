
# Date : 30/4/2025

**OS:** Linux  
**IP Address:** `ip-172-31-16-208`  
**Kernel Version:** `6.8.0-1034 aws`  
- Max, Min kernel version mentioned.

# Project Title: Department-Based Secure File Sharing Server

## Objective:
Set up a secure multi-user Linux environment with the following capabilities:

- **User-based access control**
- **Department-level data isolation**
- **Basic service management** (e.g., Apache)
- **File system navigation & understanding**
- **Automation using cron** (without scripting)

---

## Topics Covered:

1. **Introduction to Linux OS & File System**
2. **Basic Linux Commands & Navigation**
3. **User & Permission Management**
4. **Package Management & System Services**
5. **Automating Tasks with Cron & At**


---

## Creating Directories

```bash
sudo mkdir -p /dept/hr /dept/it /dept/sales
```

- This will create directories simultaneously.

## Displaying Subdirectories

```bash
ls -ld /dept/*
```

- Displays all subdirectories in `/dept`.

---

## Adding Groups

```bash
sudo groupadd hr
sudo groupadd it
sudo groupadd sales
```

## Check whether groups are created or not by using command:

```bash
getent group
```

## Changing Group Ownership for Directories

```bash
sudo chown :hr /dept/hr
sudo chown :it /dept/it
sudo chown :sales /dept/sales
```

## Now check whether the groups are assigned by using command:

```bash
ls ld /dept/hr
ls -ld /dept/it
ls -ld /dept/sales
```

## Changing Permissions

```bash
sudo chmod 770 /dept/hr /dept/it /dept/sales
```

---

## Adding Users

```bash
sudo useradd -m -G hr user_hr
sudo useradd -m -G it user_it
sudo useradd -m -G sales user_sales
```

## Changing Passwords

```bash
sudo passwd user_hr
sudo passwd user_it
sudo passwd user_sales
```

## Verifying User Creation

```bash
sudo su - user_it
sudo su - user_hr
sudo su - user_sales
```

After logging in, check whether the user can access other directories or not.

---

## Adding Sudo Group to Users

```bash
sudo usermod -aG sudo user_hr
sudo usermod -aG sudo user_it
sudo usermod -aG sudo user_sales
```

## Verifying Sudo Group Membership

```bash
groups user_hr
groups user_it
groups user_sales
```

---

## Switch User

```bash
su - user_it
```

## Set Password (when prompted)

## Install Apache

```bash
sudo apt install apache2
```

## Manage Apache Service

```bash
sudo systemctl status apache2    # Check status (should show 'running')
sudo systemctl enable apache2    # Enable on boot
sudo systemctl restart apache2   # Restart the service
sudo systemctl status apache2    # Check status again
```

## Create Shared Directory with Special Permissions

```bash
sudo mkdir /dept/shared
sudo chmod 1777 /dept/shared     # Sticky bit: only file owner can delete
```

## List Directories

```bash
ls -ld /dept/*
```

## Crontab Commands

```bash
crontab -e       # Edit crontab
crontab -l       # List crontab
crontab -r       # Remove crontab (use with caution)
```

## Schedule a Weekly Backup Using Crontab

```bash
# This runs every Sunday at 3:00 AM
0 3 * * 0 tar -czf /dept/backup_$(date +\%Y-\%m-\%d).tar.gz /dept
```


