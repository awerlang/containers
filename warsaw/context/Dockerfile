FROM awerlang/firefox

RUN zypper --non-interactive in python3 zenity

ADD https://cloud.gastecnologia.com.br/bb/downloads/ws/openSUSE/warsaw_setup.rpm /tmp/warsaw_setup.rpm
RUN sha256sum --check --status - <<<'cd179033d1c4468499ecb789f1a7f1a60ab573c5e90f01ea8746a52bdbd052f4  /tmp/warsaw_setup.rpm' && \
    rpm -hi --nosignature /tmp/warsaw_setup.rpm

COPY *.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

ENTRYPOINT /usr/local/bin/root.sh
