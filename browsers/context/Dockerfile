FROM awerlang/gui

RUN zypper addrepo --keep-packages http://download.opensuse.org/repositories/mozilla/openSUSE_Leap_15.3/ mozilla && \
    zypper --gpg-auto-import-keys refresh mozilla && \
    zypper --non-interactive in --allow-vendor-change MozillaFirefox chromium

COPY * /usr/local/bin
