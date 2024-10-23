FROM awerlang/buildpack-deps as builder

ADD RPM-GPG-KEY-SafenetAuthenticationClient /tmp/
RUN curl -fsSL -o /tmp/safenet.zip https://www.globalsign.com/en/safenet-drivers/USB/10.8/GlobalSign-SAC-CentOS-9.zip && \
    unzip -j -d /tmp/safenet /tmp/safenet.zip && \
    sha256sum --check --status - <<<'749ca96ec421856fca8e76735d66fe7d191bcc0bc665199c7d8b6dd4e6104ff4  /tmp/safenet/SafenetAuthenticationClient-10.8.1050-1.el9.x86_64.rpm' && \
    rm -rf /tmp/safenet.zip

FROM awerlang/browsers

RUN zypper --non-interactive in pcsc-tools opensc

USER user

ENV FIREFOX_PROFILE=default-release
RUN firefox -headless -no-remote -CreateProfile ${FIREFOX_PROFILE}
RUN find ${HOME}/.mozilla/firefox -name *.${FIREFOX_PROFILE} && \
{                                               \
    echo 'library=/usr/lib64/libeTPkcs11.so';   \
    echo 'name=SafeNet eToken';                 \
} >> $(find ${HOME}/.mozilla/firefox -name *.${FIREFOX_PROFILE})/pkcs11.txt

USER root

COPY --from=builder /tmp /tmp
RUN rpm --import /tmp/RPM-GPG-KEY-SafenetAuthenticationClient && \
    rpm -hi --nodeps /tmp/safenet/SafenetAuthenticationClient-10.8.1050-1.el9.x86_64.rpm && \
    sed -i 's/^LanguageId=[a-z][a-z]-[A-Z][A-Z]$/LanguageId=pt-BR/' /etc/eToken.conf

ADD https://get.webpkiplugin.com/Downloads/2.16.0/setup-rpm-64 /tmp/webpki-setup-64.rpm
RUN ln -s /bin/env /bin/sudo && \
    rpm -hi /tmp/webpki-setup-64.rpm

USER user
