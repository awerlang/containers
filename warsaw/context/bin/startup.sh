#!/bin/bash

/etc/init.d/warsaw start || echo "Could not start warsaw (user)"

exec container-init
