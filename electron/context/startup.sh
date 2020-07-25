#!/bin/bash

runx() {
    XAUTHORITY=/tmp/.Xauthority "$@"
}

APP=$(awk -F'"' '/"name"/ {print $4; exit}' /home/user/electron/package.json)
runx dbus-run-session /home/user/electron/${APP}
