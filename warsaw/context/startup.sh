#!/bin/bash

/usr/local/bin/warsaw/core
XAUTHORITY=/tmp/.Xauthority firefox -no-remote -private-window --class Banking --name Banking
