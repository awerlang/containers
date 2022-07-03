FROM awerlang/buildpack-deps as builder

RUN curl -fsSL -o /tmp/azuredatastudio-linux.rpm https://go.microsoft.com/fwlink/?linkid=2198880

FROM awerlang/gui

RUN zypper --non-interactive in icu krb5-client

COPY --from=builder /tmp /tmp
RUN rpm -hi --nosignature /tmp/azuredatastudio-linux.rpm

USER user
WORKDIR /home/user

CMD ["azuredatastudio", "--wait", "--disable-telemetry"]
