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
