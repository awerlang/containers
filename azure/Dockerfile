FROM awerlang/buildpack-deps as builder

RUN curl -fsSL -o /tmp/azuredatastudio-linux.rpm https://go.microsoft.com/fwlink/?linkid=2168271

FROM awerlang/gui

RUN zypper --non-interactive in icu

COPY --from=builder /tmp /tmp
RUN rpm -hi --nosignature /tmp/azuredatastudio-linux.rpm

USER user
WORKDIR /home/user

ENV QT_X11_NO_MITSHM=1
ENV _X11_NO_MITSHM=1
ENV _MITSHM=0

CMD ["azuredatastudio", "--verbose", "--disable-telemetry", "--no-sandbox", "--disable-gpu", "--no-xshm", "--disable-dev-shm-usage", "--disable-features=VizDisplayCompositor"]
