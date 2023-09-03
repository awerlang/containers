FROM awerlang/buildpack-deps as builder

ADD RPM-GPG-KEY-SafenetAuthenticationClient /tmp/
RUN curl -fsSL -o /tmp/safenet.zip https://www.globalsign.com/en/safenet-drivers/USB/10.8/GlobalSign-SAC-CentOS-9.zip && \
    unzip -j -d /tmp/safenet /tmp/safenet.zip && \
    sha256sum --check --status - <<<'749ca96ec421856fca8e76735d66fe7d191bcc0bc665199c7d8b6dd4e6104ff4  /tmp/safenet/SafenetAuthenticationClient-10.8.1050-1.el9.x86_64.rpm' && \
    rm -rf /tmp/safenet.zip

FROM awerlang/browsers

RUN zypper --non-interactive in \
        icedtea-web java-1_8_0-openjdk \
        mozilla-nss-tools \
        opensc openssl pcsc-ccid pcsc-lite pcsc-tools \
        polkit-default-privs util-linux

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

ADD https://wiki.thema.inf.br/wiki/upload/2017/6/thema-ca-05162528.crt /etc/pki/trust/anchors/thema-ca.crt
RUN update-ca-certificates && \
    chmod +r /etc/pki/trust/anchors/thema-ca.crt && \
    mkdir -p /etc/firefox/policies && \
    echo > /etc/firefox/policies/policies.json '                        \
        {                                                               \
            "policies": {                                               \
                "Certificates": {                                       \
                    "Install": ["/etc/pki/trust/anchors/thema-ca.crt"]  \
                }                                                       \
            }                                                           \
        }' && \
    mkdir -p /opt/safenet/cfg && \
    {                                               \
        echo 'name = SafeNet';                      \
        echo 'library = /usr/lib64/libeTPkcs11.so'; \
        echo 'disabledMechanisms = {';              \
        echo '  CKM_SHA1_RSA_PKCS';                 \
        echo '}';                                   \
    } > /opt/safenet/cfg/pkcs11.cfg && \
    sed -i 's/security.provider.10=sun.security.pkcs11.SunPKCS11/#security.provider.10=sun.security.pkcs11.SunPKCS11/' /usr/lib64/jvm/java-1.8.0-openjdk-1.8.0/jre/lib/security/java.security && \
    echo 'security.provider.10=sun.security.pkcs11.SunPKCS11 /opt/safenet/cfg/pkcs11.cfg' >> /usr/lib64/jvm/java-1.8.0-openjdk-1.8.0/jre/lib/security/java.security && \
    sed -i 's/jdk.jar.disabledAlgorithms=MD2, MD5, RSA keySize < 1024/jdk.jar.disabledAlgorithms=MD2, RSA keySize < 1024/' /usr/lib64/jvm/java-1.8.0-openjdk-1.8.0/jre/lib/security/java.security && \
    sed -i 's/^JAVA_ARGS=( )$/JAVA_ARGS=( -client -Djavax.net.ssl.keyStoreProvider=SunPKCS11-SafeNet -Dswing.aatext=TRUE -Dawt.useSystemAAFontSettings=on )/' /usr/bin/javaws.itweb && \
    {                                                           \
        echo 'org.debian.pcsc-lite.access_pcsc yes:yes:yes';    \
        echo 'org.debian.pcsc-lite.access_card yes:yes:yes';    \
    } >> /etc/polkit-default-privs.local && \
    set_polkit_default_privs

COPY *.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/*.sh

ENTRYPOINT /usr/local/bin/root.sh
