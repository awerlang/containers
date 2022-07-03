#!/bin/bash

export XAUTHORITY=/tmp/.Xauthority

rm -rf /home/user/.cache/*

SACMonitor &

firefox -P ${FIREFOX_PROFILE} &> ~/browser.log
