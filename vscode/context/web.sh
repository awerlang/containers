#!/bin/bash
nohup setsid --fork chromium --no-sandbox --disable-gpu --no-xshm --enable-automation "$@" &>/dev/null
