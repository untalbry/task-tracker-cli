# BASH TASK CLI 

## How to use:

### Adding a new task

```bash
task-cli add "Buy groceries"
```

Output: `Task added successfully (ID: 1)`

---

### Updating and deleting tasks

```bash
task-cli update 1 "Buy groceries and cook dinner"
```

```bash
task-cli delete 1
```

---

### Marking a task as in progress or done

```bash
task-cli mark-in-progress 1
```

```bash
task-cli mark-done 1
```

---

### Listing all tasks

```bash
task-cli list
```

---

### Listing tasks by status

```bash
task-cli list done
```

```bash
task-cli list todo
```

```bash
task-cli list in-progress
```
