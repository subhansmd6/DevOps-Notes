
# Ansible Project Collection

## ✅ Project 1: Apache Web Server Installation and Configuration (Beginner)

**Goal**: Install and configure Apache (httpd) on multiple Linux servers.

### Key Concepts:
- Inventory file
- Playbook basics
- `yum` or `apt` module
- `copy` and `template` modules
- Handlers and notify

### Tasks:
1. Create an inventory file with your target servers.
2. Write a playbook to:
   - Install Apache.
   - Deploy a custom index.html using `template`.
   - Ensure Apache is enabled and started.
3. Use handlers to restart the service if the template changes.

### Playbook:
```yaml
- name: Deploy a static application
  hosts: all
  become: yes
  tasks:
    - name: install apache
      yum:
        name: httpd
        state: latest

    - name: start the server
      service:
        name: httpd
        state: started
        enabled: yes

    - name: deploying stage
      template:
        src: /etc/ansible/index.html
        dest: /var/www/html/index.html
      notify: Restart Apache

  handlers:
    - name: Restart Apache
      ansible.builtin.service:
        name: httpd
        state: restarted
```

---

## ✅ Project 2: Create Multiple Users with SSH Keys and Sudo Access (Intermediate)

**Goal**: Automatically provision new users with SSH access and sudo privileges.

### Key Concepts:
- Variables and loops
- `user`, `authorized_key`, `copy`, `lineinfile`
- Conditional tasks

### Tasks:
1. Store user details in a variable (YAML file).
2. Create each user.
3. Add public SSH key.
4. Grant passwordless sudo using `lineinfile`.

### 📁 Project Structure:
```
create_users_project/
├── inventory
├── create_users.yml
└── vars/
    └── users.yml
```

### 📘 `inventory`:
```ini
[servers]
your_target_server ansible_host=192.168.1.100 ansible_user=ubuntu
```

### 📘 `vars/users.yml`:
```yaml
users:
  - name: alice
    ssh_key: "ssh-rsa AAAAB3Nza... alice@example.com"
    create: true

  - name: bob
    ssh_key: "ssh-rsa AAAAB3Nza... bob@example.com"
    create: true

  - name: charlie
    ssh_key: "ssh-rsa AAAAB3Nza... charlie@example.com"
    create: false  # Won't be created due to condition
```

### 📘 `create_users.yml`:
```yaml
---
- name: Create multiple users with SSH and sudo access
  hosts: servers
  become: yes
  vars_files:
    - vars/users.yml

  tasks:
    - name: Create users conditionally
      user:
        name: "{{ item.name }}"
        shell: /bin/bash
        state: present
        create_home: yes
      loop: "{{ users }}"
      when: item.create

    - name: Add authorized SSH key
      authorized_key:
        user: "{{ item.name }}"
        key: "{{ item.ssh_key }}"
        state: present
      loop: "{{ users }}"
      when: item.create

    - name: Grant passwordless sudo
      lineinfile:
        path: "/etc/sudoers.d/{{ item.name }}"
        line: "{{ item.name }} ALL=(ALL) NOPASSWD:ALL"
        create: yes
        mode: '0440'
      loop: "{{ users }}"
      when: item.create
```

---

## ✅ Project 3: Install and Configure Nginx with Custom HTML Page

**Goal**: Install Nginx on target servers and serve a custom `index.html`.

### 🔧 Modules Used:
- `yum` or `apt`
- `template` or `copy`
- `service`
- `handlers`

### Tasks:
1. Install Nginx.
2. Copy a custom HTML file to `/usr/share/nginx/html/index.html`.
3. Enable and start Nginx.
4. Use a handler to restart Nginx if the HTML page is updated.

### Playbook:
```yaml
- name: Deploy a static application
  hosts: subhan
  become: yes

  tasks:
    - name: Enable nginx1 via amazon-linux-extras
      command: amazon-linux-extras enable nginx1
      args:
        creates: /etc/yum.repos.d/nginx.repo

    - name: Install Nginx
      yum:
        name: nginx
        state: latest

    - name: Start and enable Nginx
      service:
        name: nginx
        state: started
        enabled: yes

    - name: Deploy static index.html
      copy:
        src: index.html
        dest: /usr/share/nginx/html/index.html
      notify: Restart nginx

  handlers:
    - name: Restart nginx
      service:
        name: nginx
        state: restarted
```

---

## ✅ Project 4: Setup a Cron Job for System Update

**Goal**: Automate `yum update -y` every night at 2 AM using cron.

### 🔧 Modules Used:
- `cron`

### Tasks:
1. Create a cron job for root user.
2. The job will run `yum update -y` at 2 AM daily.

### Playbook:
```yaml
---
- name: Setup daily system update cron job at 2AM for root
  hosts: all
  become: yes

  tasks:
    - name: Add cron job to update system daily at 2AM
      cron:
        name: "Daily system update"
        user: root
        minute: "0"
        hour: "2"
        job: "/usr/bin/yum update -y"
        state: present
```
