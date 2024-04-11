FROM awerlang/gui

RUN zypper --non-interactive in MozillaFirefox \
    chromium \
    file-roller \
    kitty \
    kupfer \
    leafpad \
    libpci3 \
    thunar \
    thunar-plugin-archive \
    util-linux

COPY * /usr/local/bin

ENV QT_X11_NO_MITSHM=1
ENV _X11_NO_MITSHM=1
ENV _MITSHM=0

CMD [ "container-init" ]
