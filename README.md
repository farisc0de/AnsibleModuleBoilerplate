# Ansible Module Boilerplate

Bash Ansible Module Boilerplate

## Features

- [x] Argument parsing
- [x] Argument validation
- [x] Help message

## Exmaple

```bash

#!/bin/bash

source $1

// Add your functions here

function action1() {
    // Add your code here

    if [ $? -ne 0 ]; then
        failed=true
        msg="Failed to perform action1"
        print_error "$failed" "$msg"
    fi

    print_status "true" "Action1 completed successfully"
}

function print_error() {
    printf '{"failed": %s, "msg": "%s"}' "$1" "$2"
    exit 1
}

function print_status() {
    printf '{"changed": %s, "msg": "%s"}' "$1" "$2"
}

case $action in
    action1)
        // Add your code here
    *)
        failed=true
        msg="Invalid action"
        print_error "$failed" "$msg"
    ;;
esac

exit 0    
```

## How to use

```bash
ansible-playbook -i localhost, -e action=action1 -e var1=value1 -e var2=value2 -m /path/to/module
```

```yaml
- name: Test module
  hosts: localhost
  tasks:
    - name: Test action1
      mymodule:
        action: action1
        var1: value1
        var2: value2
```

## License

MIT
