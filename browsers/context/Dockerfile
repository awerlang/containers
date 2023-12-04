FROM awerlang/gui

RUN zypper --non-interactive in MozillaFirefox \
    chromium \
    file-roller \
    kitty \
    kupfer \
    leafpad \
    libpci3 \
    thunar \
    thunar-plugin-archive

COPY * /usr/local/bin

CMD [ "kupfer" ]
