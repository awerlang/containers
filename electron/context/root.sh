#!/bin/bash

mkdir /run/dbus
dbus-daemon --system

setpriv --reuid=user --regid=users --init-groups --inh-caps=-all --reset-env env DISPLAY=$DISPLAY LANG=$LANG startup.sh
