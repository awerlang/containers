#!/bin/bash

/etc/init.d/warsaw start

xdg_runtime_dir=/run/user/$(id -u user)
rm -rf "${xdg_runtime_dir}"
mkdir -p "${xdg_runtime_dir}"
chmod 700 "${xdg_runtime_dir}"
chown user:users "${xdg_runtime_dir}"
setpriv --reuid=user --regid=users --init-groups \
        --inh-caps=-setuid,-setgid,-chown,-dac_override,-audit_write \
        --reset-env \
        env LANG=$LANG LANGUAGE=$LANGUAGE startup.sh
