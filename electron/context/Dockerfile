FROM awerlang/buildpack-deps as builder

ARG ELECTRON_URL
RUN curl -fsSL -o ${ELECTRON_URL} && \
    unzip -d /opt /tmp/electron.zip

ARG LOCAL_UID
COPY client.conf /etc/pulse/
RUN sed -i 's/${UID}/'${LOCAL_UID}'/g' /etc/pulse/client.conf

FROM awerlang/gui

RUN zypper --non-interactive in \
        libasound2 \
        libatk-1_0-0 \
        libatomic1 \
        libatspi0 \
        libcups2 \
        libgio-2_0-0 \
        libgobject-2_0-0 \
        libgtk-3-0 \
        libpango-1_0-0 \
        libpulse0 \
        libX11-6 \
        libX11-xcb1 \
        libXcomposite1 \
        libXcursor1 \
        libXdamage1 \
        libXext6 \
        libXi6 \
        libXrandr2 \
        libXss1 \
        libXtst6 \
        mozilla-nss && \
    zypper clean --all

COPY --from=builder /etc/pulse/client.conf /etc/pulse/client.conf
COPY --from=builder --chown=user:users /opt /home/user/electron/

COPY *.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

ENTRYPOINT /usr/local/bin/root.sh
