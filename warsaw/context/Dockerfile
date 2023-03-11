FROM awerlang/browsers

RUN zypper --non-interactive in python3 util-linux zenity

ADD https://cloud.gastecnologia.com.br/bb/downloads/ws/openSUSE/warsaw_setup.rpm /tmp/warsaw_setup.rpm
RUN sha256sum --check --status - <<<'78474c584bd9422f5ea99803ca64e8641a046890084c2071fc787e9a02cdfd7c  /tmp/warsaw_setup.rpm' && \
    rpm -hi --nosignature /tmp/warsaw_setup.rpm

COPY *.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

ENTRYPOINT /usr/local/bin/root.sh
