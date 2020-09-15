FROM awerlang/gui

# Supporting GUI libraries
RUN zypper --non-interactive in \
        glib2-tools \
        gtk2-tools \
        libasound2 \
        libgtk-3-0 \
        libsecret-1-0 \
        libsoftokn3 \
        libX11-xcb1 \
        libxkbfile1 \
        libXss1

# Development tools
RUN zypper --non-interactive in gcc git-core make nodejs12 npm12

RUN zypper --non-interactive in \
        alsa-devel \
        dbus-1-devel \
        libopenssl-devel \
        libpulse-devel

# Chromium
RUN zypper --non-interactive in chromium

# VS Code
ADD https://packages.microsoft.com/keys/microsoft.asc microsoft.asc
RUN rpm --import microsoft.asc && \
    echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo && \
    zypper modifyrepo --keep-packages code && \
    zypper --non-interactive in code

USER user

# Rust
ADD https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init /tmp/rustup-init
RUN chmod +xr /tmp/rustup-init && \
    /tmp/rustup-init -y && \
    mkdir /tmp/cargo/

COPY *.sh /usr/local/bin/
RUN cp /usr/local/bin/web.sh /home/user/bin/web && \
    chmod +x /home/user/bin/web
COPY --chown=user:users settings.json /home/user

ENTRYPOINT ["/bin/bash"]
CMD ["/usr/local/bin/startup.sh"]
