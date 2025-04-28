
# Linux Package Management and Process Monitoring

## 📦 Package Management Systems

Linux uses package managers (PM) to install, upgrade, configure, and remove software.

- **APT** → Debian/Ubuntu (`.deb` packages)
- **YUM** → RHEL, CentOS, Amazon Linux (`.rpm` packages)
- **DNF** → RHEL 8+, Fedora (faster successor to YUM)
- **ZYPPER** → openSUSE (SUSE Linux)

### 🔹 Basic APT Commands

```bash
# Update package list
sudo apt update

# Upgrade installed packages
sudo apt upgrade

# Install a package (e.g., nginx)
sudo apt install nginx

# Remove a package
sudo apt remove nginx

# Remove unnecessary packages
sudo apt autoremove
```

### 🔹 DNF and ZYPPER

- `dnf` is faster and more secure than `yum`.
- `zypper` is used for package management in openSUSE.

---

## 🛠️ System Services Management with `systemctl`

Manage system background services (e.g., web servers, ssh servers).

```bash
# Start, stop, restart a service
systemctl start <service-name>
systemctl stop <service-name>
systemctl restart <service-name>

# Service status
systemctl status <service-name>

# Enable/disable service at boot
systemctl enable <service-name>
systemctl disable <service-name>

# Check if active/enabled
systemctl is-active <service-name>
systemctl is-enabled <service-name>
```

---

## 🧠 Process Monitoring

Monitor CPU, memory usage and running processes.

### 🔹 Commands

```bash
# List all processes
ps aux

# Find specific process (e.g., nginx)
ps aux | grep nginx
```

- **Options**:
  - `a` → All users
  - `u` → Show user
  - `x` → Background processes

- **PID**: Process ID

### 🔹 Real-time Monitors

```bash
# Real-time monitoring
top

# Enhanced monitor with better UI
sudo apt install htop
htop
```

- Press `q` to exit both `top` and `htop`.

---

## ⏰ Automating Tasks with `cron`

Schedule commands/scripts to run at specific times.

### 🔹 Crontab Basics

```bash
# Edit crontab
crontab -e
```

### 🔹 Crontab Syntax

```
* * * * * command_to_execute
| | | | |
| | | | └─── Day of Week (0-7)
| | | └───── Month (1-12)
| | └─────── Day of Month (1-31)
| └───────── Hour (0-23)
└─────────── Minute (0-59)
```

### 🔹 Special Cron Keywords

| Keyword    | Description                    |
|------------|---------------------------------|
| `@monthly` | Run once per month              |
| `@yearly`  | Run once per year               |
| `@reboot`  | Run script on system reboot     |
| `@monthly` | Run once per month              |
| `@yearly`  | Run once per year               |
| `@reboot`  | Run script on system reboot     |

**Example:**  
Run a script after reboot:
```bash
@reboot /home/user/startup_script.sh
```

---

## 📋 Viewing and Managing Cron Jobs

```bash
# List all crontab jobs
crontab -l

# Edit crontab
crontab -e

# Remove all crontab jobs
crontab -r
```

---

## 🕒 `at` Command for One-Time Jobs

The `at` command schedules a one-time task.

```bash
# Syntax
at [time] [options]

# Example: Reboot the system after 1 minute
echo "reboot" | at now + 1 min
```

### 📋 Managing `at` Jobs

```bash
# List scheduled at jobs
atq

# Remove a scheduled at job by ID
atrm <job-id>
```

---

## 📝 Summary

| Tool        | Purpose                 |
|-------------|--------------------------|
| **Cron**    | Repetitive tasks (Recurring) |
| **At**      | One-time tasks             |

---
