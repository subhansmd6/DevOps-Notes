
# Nexus Notes

## What is Nexus?
- Nexus is an OSS (Open Source Software), Java-based, Artifactory Repository.
- It can be used to store build artifacts.
- We can retrieve build artifacts whenever required.

---

## Difference between GitHub and Nexus

| GitHub | Nexus |
| :----- | :---- |
| SCM (Source Code Management) | Store artifacts (JARs, WARs, EARs, etc.) |

---

## Pre-requisites
- 1 GB dedicated RAM
- Java
- Default port number: **8081**

---

## Installation Steps

1. After installing Java, go to the official Nexus website.
2. Select the latest version (compressed link), copy the link address.
3. Download and extract the compressed file.

---

## Setup Steps

- Prepare the directory.
- Add the user (e.g., `nexus`) using:
  
  ```bash
  useradd nexus
  ```

- Change permissions recursively:

  ```bash
  chmod -R
  ```

- There will be two directories: `nexus` and `sonatype-work`.  
  We should give permissions to both the directories.

- Change to the `bin` directory:

  ```bash
  cd bin/
  ```

- Edit `nexus.rc` file:

  ```bash
  vi nexus.rc
  ```

- Add the user name and uncomment it.

- Create Nexus as a service using the command:

  ```bash
  ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
  ```

- Login as nexus user:

  ```bash
  su - nexus
  ```

- Enable system services:

  ```bash
  sudo systemctl enable nexus
  ```

- Start Nexus:

  ```bash
  sudo systemctl start nexus
  ```

- Check status:

  ```bash
  sudo systemctl status nexus
  ```

- Access Nexus in the browser.  
  Default credentials:

  ```
  Username: admin
  Password: admin123
  ```

- Get the password from:

  ```
  /opt/sonatype-work/nexus3/admin.password
  ```

## Additional Important Points

### Firewall Rules
If you are on a cloud server (AWS EC2, Azure VM), ensure port 8081 is opened in security groups/firewall settings.

### Running Nexus as a Non-Root User
It is best practice **NOT** to run Nexus as root for security reasons.  
Always create a separate `nexus` user.

### Persistence / Data Backup
All critical Nexus data is under the `sonatype-work` directory.  
Take regular backups of this directory to prevent data loss.

### Upgrading Nexus
When upgrading, always back up your `sonatype-work` directory.  
Test the upgrade in a staging environment if possible.

### Important Log Files

- **Application logs**  
  `<nexus-directory>/logs/nexus.log`

- **Systemd logs (if using systemctl)**  
  `journalctl -u nexus.service`

