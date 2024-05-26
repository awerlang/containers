FROM opensuse/tumbleweed

ENV ZYPP_SINGLE_RPMTRANS=1
RUN sed -i 's/.*useColors.*/useColors = always/' /etc/zypp/zypper.conf && \
    zypper modifyrepo --keep-packages --all && \
    zypper modifyrepo --disable repo-non-oss && \
    zypper --non-interactive in file glibc-locale shadow

ARG LOCAL_UID
ARG LOCAL_GID
RUN useradd -u ${LOCAL_UID} -g ${LOCAL_GID} user
