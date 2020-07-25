FROM awerlang/buildpack-deps as builder

RUN curl -fsSL -o microsoft.asc https://packages.microsoft.com/keys/microsoft.asc

ADD https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init /tmp/rustup-init
RUN chmod +xr /tmp/rustup-init

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
        libXss1 && \
    zypper clean --all

# Development tools
RUN zypper --non-interactive in gcc git-core make nodejs12 && \
    zypper clean --all

RUN zypper --non-interactive in \
        alsa-devel \
        dbus-1-devel \
        libopenssl-devel \
        libpulse-devel && \
    zypper clean --all

# Chromium
RUN zypper --non-interactive in \
    chromium && \
    zypper clean --all

# VS Code
COPY --from=builder microsoft.asc .
RUN rpm --import microsoft.asc && \
    echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo && \
    zypper --non-interactive in code && \
    zypper clean --all

USER user

# Rust
COPY --from=builder /tmp/rustup-init /tmp/rustup-init
RUN /tmp/rustup-init -y && \
    mkdir /tmp/cargo/

COPY *.sh /usr/local/bin/
RUN cp /usr/local/bin/web.sh /home/user/bin/web && \
    chmod +x /home/user/bin/web
COPY --chown=user:users settings.json /home/user

ENTRYPOINT ["/bin/bash"]
CMD ["/usr/local/bin/startup.sh"]
