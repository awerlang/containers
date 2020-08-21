#!/bin/bash

export XAUTHORITY=/tmp/.Xauthority
export FIREFOX_PROFILE=default-release

rm -rf /home/user/.cache/*

if [[ ! -d $HOME/.mozilla ]]; then
    first-run.sh || exit 1
fi

SACMonitor &

firefox -no-remote -P ${FIREFOX_PROFILE}
