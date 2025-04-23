
# Linux Filesystem and Commands Notes

## 1. Important Directories in Linux

**Linux file system hierarchy --> FHS (File System Hierarchy Standard)**

### `/` - Root directory
### `/home` - Contains personal folder for individual login  
    - `ls -a` - Lists all files including hidden files

### `/etc` - Configuration files
- System-wide config files and settings
- `/etc/hostname` - System hostname
- `/etc/passwd` - User account info
- `/etc/ssh/sshd_config` - SSH server configuration

### `/var/log` - System log files
- `/var/log/messages` - General log messages
- `/var/log/secure` - Authentication logs
- `/var/log/httpd` - Web server logs (Apache)

### `/opt` - Optional software (usually third-party)
- Used by OS package managers like APT (Ubuntu)

### `/tmp` - Temporary files
- Used for testing scripts, shared temp data, and user temp files

### `/dev` - Hardware device files
- Interface for hardware devices (disks, USB, etc.)
- `/dev/sda` - First hard disk
- `/dev/ttyUSB0` - USB device
- `/dev/null` - 'Black hole' to discard output

### `/proc` - Virtual system files (pseudo filesystem)
- Used for accessing hardware and software info
- `cat /proc/cpuinfo` - CPU information
- `cat /proc/meminfo` - RAM information
- `ps -ef | grep 1` - Find the init process (PID 1)

## 2. Directory Descriptions

- `/` - Root directory of the entire Linux filesystem
- `/home` - Personal folder for individual users
- `/etc` - System-wide configuration files
- `/var/log` - System logs (application, user logs, etc.)
- `/opt` - Optional software
- `/tmp` - Temporary files
- `/dev` - Hardware device files
- `/proc` - Virtual system files

## 3. Path in Linux

- Path refers to where a file or directory is located
- **Absolute path** - Complete path from root (`/`), useful in scripts
- **Relative path** - Path from current directory (`./`, `../`)
  - `.` - Current directory
  - `..` - Parent directory (one level up)

## 4. File Types in Linux

- `-` - Regular file (text or binary)
- `d` - Directory (folder)
- `l` - Symbolic link (shortcut to another file)
- `c` - Character device (handles data by character)
- `b` - Block device (handles data in blocks, e.g., hard disk)
- `s` - Socket (inter-process communication endpoint)
- `p` - Named pipe (another IPC method for one-way data flow)

## What is Mount Point?

Mounting means making a file system accessible through the Linux directory tree.

- Example command: `mount` or `column -t`
