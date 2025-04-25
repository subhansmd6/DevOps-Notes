### Date:25-04-2025

## 📊 Monitor Disk Usage
- Use `du -sh` → Disk usage summary (human-readable)

---

## 🧭 Navigation Commands
- `ls` → List files
- `ls -a` → List all including hidden
- `ls -l` → Detailed list
- `cd` → Change directory
- `cd /etc/nginx` → Move to nginx config folder# Linux Basics Notes

## Navigation Commands

- `cd ~` → go to home directory  
- `cd ..` → one step back (one level up)  
- `cd -` → switch to previous directory  
- `pwd` → print working directory (shows current directory)  
- `ls` → list out files  
- `ls -lah` → list files with structure and sizes  
- `tree` → shows directory structure as tree  

---

## File Handling

### Creating and Editing Files

- `touch index.html` → creates an empty file  
- `cat` → to read the data  
- `echo` → to print text  
- `echo "welcome" > index.html` → override  
- `echo "data" >> index.html` → append  

---

## Viewing Commands

- `less` → opens large files page by page  
- `less /etc/passwd`  
- `q` → to exit  

### Head and Tail

- `head -n 20` → first 20 lines  
- `tail -n 10` → last 10 lines  
- `tail -f /var/log/syslog` → live monitor of log  

---

## File Searching

- `find` → to find files  
- `find /var -name "*.log"` → search for *.log files anywhere  
- Files over 1MB:  
  ```bash
  find /home -type f -size +1M
  ```

---

## Modified Files in 1 Day

```bash
find /home -mtime -1
```

---

## Text Search Inside Files

- `grep "warning" /var/log/syslog`  
- `grep "failed" /var/log/syslog`  

---

## Networking Utilities in Linux (Troubleshooting)

- `ping` → test network connectivity to a host  
- `ping google.com` (Ctrl+C to stop)  
- `curl` → fetch web content or check public IP  
- `curl http://ip:port` → open ports & services  

### Useful Commands

- `netstat -tulpn` → show open ports, listening services  
- `ss` → socket statistics  
- `ss -lntp`  

---

## User and Permission Management

### Creating Users and Groups

- To create user:  
  ```bash
  adduser <username>
  ```  
- Supports password, full name  
- Creates home directory  
- Adds user entry in `/etc/passwd`  
- Sets up default shell  
- UID/ID is set

---

### Group Add (Creating New Group)

```bash
sudo groupadd <groupname>
```

- Adds entry in `/etc/group`

---

### useradd Command (Low-Level)

```bash
sudo useradd <username>
sudo passwd <username>
```

- Does not create home directory or setup defaults  

---

### adduser (High-Level)

```bash
sudo adduser <username>
```

- Automatically creates home dir  
- Prompts for password  
- Supports fewer systems

---

### Modify Permissions

- Add to group:  
  ```bash
  sudo usermod -aG <group> <user>
  ```
- List user groups:  
  ```bash
  groups <user>
  ```

---

## File Permissions

- Commands: `chmod`, `chown`, `umask`  
- UGO → User, Group, Others  
- Example:  
  ```
  drwxr-xr-x  root devteam 4096 /project
  ```

### umask

- Default permissions for new files  
- Common value: `0022 → 0027`  
- New file → 644 (`rw-r--r--`)


## What is `sudo`?

- `sudo` = **Super User DO**
- Grants temporary **root privileges**
  - Safer than logging in to the root account directly

## How to Add User to `sudo` Group?

### On Debian/Ubuntu:
```bash
usermod -aG sudo <username>
```

### On RHEL/CentOS:
```bash
usermod -aG wheel <username>
```

## Edit `sudoers` File

```bash
sudo visudo
```

- This opens `/etc/sudoers`
- **Important:** Always check the syntax before saving to prevent lockouts.

## Log Files for Tracking `sudo` Activity

- **Ubuntu/Debian:**
  ```
  /var/log/auth.log
  ```

- **RHEL/CentOS:**
  ```
  /var/log/secure
  ```

---

## File Permissions

- **Creating a New Directory with Permissions:**
  ```
  mkdir <dir_name> && chmod 755 <dir_name>
  ```
  - `755` = rwxr-xr-x (Owner: read/write/execute, Group: read/execute, Others: read/execute)

---
