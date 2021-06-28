FROM awerlang/buildpack-deps as builder

RUN curl -fsSL -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip && \
    sha256sum --check --status - <<<'6b66e1faf0ad4ece28c42a1877e95bbb1355396231d161d78b8ca8a99accc2d7  /tmp/terraform.zip' && \
    unzip -d /usr/local/bin /tmp/terraform.zip
RUN curl -fsSL -o /tmp/delta.tar.gz https://github.com/dandavison/delta/releases/download/0.8.1/delta-0.8.1-x86_64-unknown-linux-gnu.tar.gz && \
    sha256sum --check --status - <<<'8379e491b5679eb50bb97b87a369273f2f7c63289126592f6367020df09d750f  /tmp/delta.tar.gz' && \
    tar -xvf /tmp/delta.tar.gz --strip-components 1 -C /usr/local/bin --wildcards --no-anchored delta && \
    ls -lh /usr/local/bin

FROM awerlang/browsers

# Development tools
RUN zypper --non-interactive addrepo https://download.opensuse.org/repositories/M17N/openSUSE_Leap_15.2/M17N.repo && \
    zypper --gpg-auto-import-keys refresh M17N && \
    zypper --non-interactive in bash-completion fira-code-fonts git-core make nodejs npm strace

# VS Code
ADD https://packages.microsoft.com/keys/microsoft.asc microsoft.asc
RUN rpm --import microsoft.asc && \
    echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo && \
    zypper modifyrepo --keep-packages code && \
    zypper --non-interactive in code

USER user

# VS Code
RUN code --install-extension ms-azuretools.vscode-docker \
    --install-extension dbaeumer.vscode-eslint \
    --install-extension eamodio.gitlens \
    --install-extension humao.rest-client \
    --install-extension alefragnani.bookmarks \
    --install-extension hashicorp.terraform \
    --install-extension visualstudioexptteam.vscodeintellicode
COPY --chown=user:users settings.json /home/user/.config/Code/User/

# npm / yarn
RUN mkdir ~/.npm-global && \
    npm config set prefix '~/.npm-global' && \
    npm install -g yarn

# Terraform
COPY --from=builder /usr/local/bin /usr/local/bin

# Browser
COPY web /usr/local/bin/
ENV BROWSER=web

ENV PATH=~/.npm-global/bin:$PATH
ENV XAUTHORITY=/tmp/.Xauthority

ENV QT_X11_NO_MITSHM=1
ENV _X11_NO_MITSHM=1
ENV _MITSHM=0

ENTRYPOINT ["/usr/bin/dbus-run-session"]
CMD ["code", "--wait", "--disable-telemetry", "--no-sandbox", "--disable-gpu", "--no-xshm", "--disable-dev-shm-usage", "--disable-features=VizDisplayCompositor"]
