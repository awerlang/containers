if [[ ! -d ~/.npm-global ]]; then
    mkdir ~/.npm-global
    npm config set prefix '~/.npm-global'
fi

export PATH=$HOME/bin:$HOME/.cargo/bin:$HOME/.npm-global/bin:$PATH
export CARGO_TARGET_DIR=/tmp/cargo/target
export XAUTHORITY=/tmp/.Xauthority
export BROWSER=web

if [[ ! -f $HOME/.config/Code/User/settings.json ]]; then
    code --install-extension ms-azuretools.vscode-docker \
         --install-extension rust-lang.rust \
         --install-extension dbaeumer.vscode-eslint \
         --install-extension bradlc.vscode-tailwindcss \
         --install-extension octref.vetur \
         --install-extension vadimcn.vscode-lldb

    mv $HOME/settings.json $HOME/.config/Code/User/
fi

dbus-launch /usr/share/code/code --verbose --disable-telemetry --no-sandbox --disable-gpu --no-xshm
