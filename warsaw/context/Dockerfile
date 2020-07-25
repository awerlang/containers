FROM awerlang/buildpack-deps as builder

RUN curl -fsSL -o /tmp/warsaw_setup.rpm https://cloud.gastecnologia.com.br/bb/downloads/ws/openSUSE/warsaw_setup.rpm && \
    sha256sum --check --status - <<<'cd179033d1c4468499ecb789f1a7f1a60ab573c5e90f01ea8746a52bdbd052f4  /tmp/warsaw_setup.rpm'

FROM awerlang/firefox

RUN zypper --non-interactive in python3 zenity && \
    zypper clean --all

COPY --from=builder /tmp/warsaw_setup.rpm /tmp/warsaw_setup.rpm
RUN rpm -hi --nosignature /tmp/warsaw_setup.rpm

COPY *.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

ENTRYPOINT /usr/local/bin/root.sh
