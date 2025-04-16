# 🚀 SonarQube Setup Guide

A step-by-step guide to installing and configuring SonarQube on a Linux server.

📅 **Last Updated:** 16-04-2025

---

## 🔍 What is SonarQube?

SonarQube is an open-source platform for **software quality management**. It continuously analyzes and measures the quality of source code, generating detailed reports in **HTML** or **PDF** formats if issues are found.

It is a **web-based tool** and supports multiple programming languages, including:

- Java  
- C  
- C++  
- JavaScript  
- And more...

It also supports various databases such as:

- MySQL  
- PostgreSQL  
- Oracle  
- Microsoft SQL Server

### 🚨 SonarQube Helps Identify:

- 🔁 Duplicated Code  
- 📏 Violations of Coding Standards  
- 🧪 Missing or Failing Unit Tests  
- 🔀 Overly Complex Code  
- 💬 Inadequate or Missing Comments

---

## 👷‍♂️ DevOps Responsibility

As a DevOps Engineer, you're responsible for:
- Installing and configuring SonarQube
- Managing user access
- Integrating with CI/CD pipelines (e.g., Jenkins)

---

## ⚙️ Pre-requisites

- Java (compatible version)
- Minimum 2 GB RAM (recommended for small-scale setups)
- Linux OS (Ubuntu/CentOS preferred)

---

## 🐧 Installation on Linux

1. **Download SonarQube** from the [official website](https://www.sonarsource.com/products/sonarqube/downloads/).
2. Unzip it:
   ```bash
   unzip sonarqube-*.zip
🔄 Change Default Port (Optional)
Default web port is 9000

To change, edit the config file inside:
conf/sonar.properties

🧑‍💻 Run as Non-root User
Create a new user:

bash
Copy
Edit
useradd sonar
Edit sudoers:

bash
Copy
Edit
visudo
# Add this line
sonar  ALL=(ALL)  NOPASSWD: ALL
Set ownership and permissions:

bash
Copy
Edit
chown -R sonar:sonar /opt/sonarqube
chmod -R 775 /opt/sonarqube
🚀 Start SonarQube Server
Navigate to:

bash
Copy
Edit
cd /opt/sonarqube/bin/linux-x86-64/
sh sonar.sh start
Access it from your browser:

cpp
Copy
Edit
http://<your-server-ip>:9000
🔐 First-time Login & Security Settings
Default login:

Username: admin

Password: admin

Change password on first login.

Navigate to:

pgsql
Copy
Edit
Settings → Security → Enable Force User Authentication
