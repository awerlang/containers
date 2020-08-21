#!/bin/bash

mkdir /run/dbus
dbus-daemon --system
pcscd --debug

chown user:users /tmp/.Xauthority
setpriv --reuid=user --regid=users --init-groups --inh-caps=-all --no-new-privs --reset-env env DISPLAY=$DISPLAY LANG=$LANG /usr/local/bin/startup.sh

rm -rf /tmp/*
