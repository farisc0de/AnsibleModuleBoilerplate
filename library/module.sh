#!/bin/bash

source $1

function print_error() {
    printf '{"failed": %s, "msg": "%s"}' "$1" "$2"
    exit 1
}

function print_status() {
    printf '{"changed": %s, "msg": "%s"}' "$1" "$2"
}

case $action in
    *)
        failed=true
        msg="Invalid action"
        print_error "$failed" "$msg"
    ;;
esac

exit 0
