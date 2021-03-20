FROM awerlang/buildpack-deps as builder

RUN curl -fsSL -o /tmp/azuredatastudio-linux.rpm https://sqlopsbuilds.azureedge.net/stable/796abbdf5fdd341e3528e30a6b777c93e115eb02/azuredatastudio-linux-1.26.1.rpm

FROM awerlang/gui

RUN zypper --non-interactive in \
    libasound2 \
    libatk-1_0-0 \
    libcups2 \
    libdrm2 \
    libgbm1 \
    libgtk-2_0-0 \
    libgio-2_0-0 \
    libgobject-2_0-0 \
    libgtk-3-0 \
    libpango-1_0-0 \
    libsecret-1-0 \
    libX11-6 \
    libX11-xcb1 \
    libxcb-dri3-0 \
    libXcomposite1 \
    libXcursor1 \
    libXdamage1 \
    libXext6 \
    libXi6 \
    libxkbfile1 \
    libXrandr2 \
    libXss1 \
    libXtst6 \
    mozilla-nspr \
    mozilla-nss

RUN zypper --non-interactive in icu

COPY --from=builder /tmp /tmp
RUN rpm -hi --nosignature /tmp/azuredatastudio-linux.rpm

USER user
WORKDIR /home/user

ENV QT_X11_NO_MITSHM=1
ENV _X11_NO_MITSHM=1
ENV _MITSHM=0

CMD ["azuredatastudio", "--verbose", "--disable-telemetry", "--no-sandbox", "--disable-gpu", "--no-xshm", "--disable-dev-shm-usage", "--disable-features=VizDisplayCompositor"]
