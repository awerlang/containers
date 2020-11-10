#!/bin/bash
nohup setsid --fork chromium --no-sandbox --no-xshm --enable-automation "$@" &>/dev/null
