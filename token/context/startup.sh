#!/bin/bash

export XAUTHORITY=/tmp/.Xauthority
export FIREFOX_PROFILE=default-release

if [[ ! -d $HOME/.mozilla ]]; then
    first-run.sh || exit 1
fi

SACMonitor &

firefox -no-remote -P ${FIREFOX_PROFILE}

rm -rf /tmp/*
