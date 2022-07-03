FROM awerlang/browsers

# Development tools
RUN zypper --non-interactive in bash-completion fira-code-fonts git-core git-delta make nodejs npm strace terraform util-linux

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

# Browser
COPY web /usr/local/bin/
ENV BROWSER=web

ENV PATH=~/.npm-global/bin:$PATH
ENV XAUTHORITY=/tmp/.Xauthority

ENTRYPOINT ["/usr/bin/dbus-run-session"]
CMD ["code", "--wait", "--disable-telemetry"]
