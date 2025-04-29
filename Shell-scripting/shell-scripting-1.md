# Shell Scripting – Notes (29/4/25)

## Introduction to Shell Scripting

- ✅ Linux Shell Scripting  
- ✅ Automate task, system admin  
- ✅ Runs Programs  
- ✅ Automates repetitive task  
- ✅ Automation

---

## Variables and Datatypes

- **Variables**: Used for storing data (strings, numbers, etc.)
- Shell scripts are **loosely typed**

### Examples:
```bash
name="devops"   # string  
count=6         # integer
```

---

## Echo Command

```bash
echo $name    # prints devops
```

### Example: No type declaration

```bash
name="kishore"   # just a variable
age=25
```

- Type can change anytime:

```bash
var=5  
var="hello"  # no error
```

---

## Advantages of Loose Typing

1. You can write scripts faster  
2. More flexibility  

### Examples:

```bash
x=10  
echo $x     # output: 10

x="Hello"  
echo $x     # output: Hello

x=$(date)  
echo $x     # prints current date & time
```

---

## Type Declaration Comparison

| Feature            | Shell           | Python            | Java                  |
|--------------------|------------------|--------------------|------------------------|
| Type declaration   | ❌ Not needed     | ❌ Not needed       | ✅ Must declare type    |
| Typing style       | Loosely typed    | Dynamically typed  | Statically typed       |
| Can't change type  | Yes              | Yes                | No (fixed after declare) |
| Example            | x=5              | x=5                | int x = 5              |
|                    | x="4i"           | x = "5i"           | x = "5"; ❌ (type mismatch) |
| Flexibility        | Very highly      | High               | Stick                  |

---

## Type Summary

- **Loosely Typed** → No type checking at all  
- **Dynamically Typed** → Type decided at runtime  
- **Statically Typed** → Type fixed at compile time  

---

## Conditional Statements (If-Else)

### Syntax:
```bash
if [ condition ]; then  
  # commands to run if condition is true  
else  
  # commands to run if condition is false  
fi
```

### Example:
```bash
if [ $count -ge 10 ]; then  
  echo "number is string"  
fi
```

---

## Comparison Operators

- `-gt` → greater than  
- `-lt` → less than  
- `-ge` → greater than or equal to  
- `-le` → less than or equal to  
- `-eq` → equal to  
- `-ne` → not equal to  
- `-z`  → check if string is empty (zero length)  
- `-n`  → check if string is not empty  

---

## Check if File Exists

### Syntax:
```bash
if [ -f /path/to/file ]; then  
  echo "file exists"  
else  
  echo "file does not exist"  
fi
```

- `-s` → file exists **and** is not empty
