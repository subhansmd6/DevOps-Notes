### Date:25-04-2025

---

## 🔐 Linux File Permission Model
- Format: `drwxrwxrwx`
  - `d` → Directory
  - `r` → Read (can view contents)
  - `w` → Write (can modify or delete)
  - `x` → Execute (can enter directory or run file)

### 🔢 Numeric Permission Values:
- `r = 4`, `w = 2`, `x = 1` → Combined using addition
- Examples:
  - `7 = rwx` (Full permissions)
  - `5 = r-x` (Read + execute)
  - `4 = r--` (Read only)

### 🔄 Changing Permissions
- `chmod -R 777 test/` → Full permissions to test folder
- `chgrp devgroup foldername` → Change group ownership
- `chown jenkins:devops foldername` → Change file owner and group
- `chown 755 user:group file/folder` → Change ownership and set permissions

📌 **Note**: Jenkins is the new owner of build; group is associated with build process.

---

## 📁 Inodes in Linux
- **Inode** stands for *Index Node*
- Stores metadata for files:
  - File type
  - File size
  - Timestamps
  - Owner UID, GID
  - Permissions
  - Link count
  - Disk block locations

🔎 View inode number:
```bash
ls -i filename
```

---

## 🔗 Hard Links vs Soft Links

### 📌 Filename
- Exists in directory
- Human readable
- Duplicates possible

### 📌 Inode
- Contains metadata
- Unique to file system
- System readable only

### 📌 Hard Links
- Point directly to the inode
- All files share the same inode
```bash
ln file1.txt file2.txt
```

### 📌 Soft Links (Symbolic)
- Point to the file name (path)
```bash
ln -s /var/log logs-link
```



