#!/bin/bash

mkdir /run/dbus
dbus-daemon --system
pcscd --debug

chown user:users /tmp/.Xauthority
setpriv --reuid=user --regid=users --init-groups \
        --inh-caps=-setuid,-setgid,-chown \
        --reset-env \
        env DISPLAY=$DISPLAY LANG=$LANG FIREFOX_PROFILE=$FIREFOX_PROFILE /usr/local/bin/startup.sh

rm -rf /tmp/*
