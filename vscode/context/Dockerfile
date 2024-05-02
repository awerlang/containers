FROM awerlang/browsers

# Development tools
RUN zypper --non-interactive in bash-completion fira-code-fonts git-core git-delta make nodejs npm strace

# VS Code & Microsoft Edge
ADD https://packages.microsoft.com/keys/microsoft.asc microsoft.asc
RUN rpm --import microsoft.asc && \
    echo -e "[vscode]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo && \
    echo -e "[msedge]\nname=Microsoft Edge\nbaseurl=https://packages.microsoft.com/yumrepos/edge\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/msedge.repo && \
    zypper modifyrepo --keep-packages vscode msedge && \
    zypper --non-interactive in code microsoft-edge-stable

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
    npm install -g yarn && \
    echo 'export PATH="$(npm config get prefix)/bin:$PATH"' >> ~/.profile
