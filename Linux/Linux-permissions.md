# Understanding `chmod 770` in Linux

## Command:
```bash
chmod 770 <filename>
```

## Breakdown of Permissions (Octal to Symbolic):

```
770  →  4+2+1  4+2+1  0
       (rwx)   (rwx)  (---)
        ↑        ↑      ↑
       User    Group   Others
```

- **User:** `rwx` (Read + Write + Execute) = 7  
- **Group:** `rwx` (Read + Write + Execute) = 7  
- **Others:** `---` (No permissions) = 0

## Permission Values:
- Read  = 4  
- Write = 2  
- Execute = 1

## Summary:
- The **owner (user)** and **group** can **read**, **write**, and **execute**.
- **Others** have **no permissions**.


# Understanding `chown` Command in Linux

## Command Syntax

```
sudo chown -R <username>:<groupname> <file/directory>
```

## Explanation

- `sudo`: Executes the command with superuser privileges.
- `chown`: Command to **change the ownership** of a file or directory.
- `-R`: Stands for **recursive**. It applies the ownership change to all files and subdirectories within the specified directory.
- `<username>`: The **new owner** of the file or directory.
- `<groupname>`: The **new group** associated with the file or directory.
- `<file/directory>`: The **target file or directory** whose ownership is to be changed.

## Example

```
sudo chown -R john:developers /opt/project
```

This changes the ownership of `/opt/project` and everything inside it to:
- User: `john`
- Group: `developers`

