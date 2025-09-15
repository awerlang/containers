#!/bin/bash

if ! timeout 10 bash -c 'until nc -z localhost 30900; do sleep 1; done'; then
    zenity --error --title="Warsaw" --text="WebSocket at port 30900 is not in listening state"
fi

/etc/init.d/warsaw start || echo "Could not start warsaw (user)"

exec container-init
