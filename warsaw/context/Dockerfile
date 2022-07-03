FROM awerlang/browsers

RUN zypper --non-interactive in python3 util-linux zenity

ADD https://cloud.gastecnologia.com.br/bb/downloads/ws/openSUSE/warsaw_setup.rpm /tmp/warsaw_setup.rpm
RUN sha256sum --check --status - <<<'a0b55a2eb8bffabee70b7625f22bd2668d74bd219e245d3076fca3283142cb2d  /tmp/warsaw_setup.rpm' && \
    rpm -hi --nosignature /tmp/warsaw_setup.rpm

COPY *.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

ENTRYPOINT /usr/local/bin/root.sh
