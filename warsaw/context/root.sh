#!/bin/bash

/etc/init.d/warsaw start
setpriv --reuid=user --regid=users --init-groups --inh-caps=-all --reset-env env DISPLAY=$DISPLAY LANG=$LANG startup.sh
