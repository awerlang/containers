FROM awerlang/browsers

RUN rpm -e --nodeps systemd && \
    zypper --non-interactive addlock systemd && \
    zypper --non-interactive in python3 zenity

ADD https://cloud.gastecnologia.com.br/bb/downloads/ws/openSUSE/warsaw_setup.rpm /tmp/warsaw_setup.rpm
RUN sha256sum --check --status - <<<'628dce07d6c63b0356fee365865ede19e2aa612584bb2147408251daad09e25f  /tmp/warsaw_setup.rpm' && \
    rpm -hi --nosignature /tmp/warsaw_setup.rpm && \
    rm /tmp/warsaw_setup.rpm

COPY bin /usr/local/bin

CMD [ "root.sh" ]
