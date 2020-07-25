#!/bin/bash

firefox -no-remote -CreateProfile ${FIREFOX_PROFILE}
cat >> "$(find ${HOME}/.mozilla/firefox -name *.${FIREFOX_PROFILE})/pkcs11.txt" <<EOF
library=/usr/lib64/libeTPkcs11.so
name=SafeNet eToken
EOF
