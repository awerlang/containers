FROM opensuse/leap

RUN sed -i 's/.*useColors.*/useColors = always/' /etc/zypp/zypper.conf && \
    zypper modifyrepo --keep-packages --all && \
    zypper modifyrepo --disable repo-non-oss repo-update-non-oss && \
    zypper --non-interactive in glibc-locale

ARG LOCAL_UID
ARG LOCAL_GID
RUN useradd -mr -u ${LOCAL_UID} -g ${LOCAL_GID} user
