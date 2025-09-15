#!/bin/bash

if [ $EUID -gt 0 ]; then  
    echo "Need to start container as root"
fi

GLIBC_TUNABLES=glibc.rtld.execstack=2 /etc/init.d/warsaw start || echo "Could not start warsaw (root)"

xdg_runtime_dir=/run/user/$(id -u user)
mkdir -p "${xdg_runtime_dir}"
chmod 700 "${xdg_runtime_dir}"
chown user:users "${xdg_runtime_dir}"
exec setpriv --reuid=user --regid=users --init-groups \
        --inh-caps=-setuid,-setgid,-chown,-dac_override,-audit_write \
        --reset-env \
        env XDG_RUNTIME_DIR=${xdg_runtime_dir} LANG=$LANG LANGUAGE=$LANGUAGE LC_ALL=$LC_ALL startup.sh
