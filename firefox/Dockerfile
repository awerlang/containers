FROM awerlang/gui

RUN zypper --non-interactive in MozillaFirefox && \
    zypper clean --all

ENTRYPOINT /usr/bin/firefox
