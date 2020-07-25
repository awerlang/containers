export PATH=$HOME/bin:$HOME/.cargo/bin:$PATH
export CARGO_TARGET_DIR=/tmp/cargo/target
export XAUTHORITY=/tmp/.Xauthority
export BROWSER=web

if [[ ! -f $HOME/.config/Code/User/settings.json ]]; then
    code --install-extension ms-azuretools.vscode-docker \
         --install-extension rust-lang.rust \
         --install-extension dbaeumer.vscode-eslint \
         --install-extension esbenp.prettier-vscode \
         --install-extension vadimcn.vscode-lldb

    mv $HOME/settings.json $HOME/.config/Code/User/
fi

dbus-launch /usr/share/code/code --verbose --disable-telemetry --no-sandbox --disable-gpu
