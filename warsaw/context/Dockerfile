FROM awerlang/browsers

RUN rpm -e --nodeps systemd && \
    zypper --non-interactive addlock systemd && \
    zypper --non-interactive in python3 zenity

ADD https://cloud.gastecnologia.com.br/bb/downloads/ws/openSUSE/warsaw_setup.rpm /tmp/warsaw_setup.rpm
RUN sha256sum --check --status - <<<'78474c584bd9422f5ea99803ca64e8641a046890084c2071fc787e9a02cdfd7c  /tmp/warsaw_setup.rpm' && \
    rpm -hi --nosignature /tmp/warsaw_setup.rpm && \
    rm /tmp/warsaw_setup.rpm

COPY bin /usr/local/bin

CMD [ "root.sh" ]
