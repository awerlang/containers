FROM awerlang/buildpack-deps as builder

RUN curl -fsSL -o /tmp/irpf.zip http://downloadirpf.receita.fazenda.gov.br/irpf/2020/irpf/arquivos/IRPF2020-2.0.zip && \
    unzip -d /opt /tmp/irpf.zip

FROM awerlang/jdk8

USER user
WORKDIR /home/user

COPY --from=builder --chown=user:users /opt .

ENV LANG="pt_BR.UTF-8" \
    XAUTHORITY=/tmp/.Xauthority

CMD ["java", "-client", "-Dswing.aatext=TRUE", "-Dawt.useSystemAAFontSettings=on", "-jar", "IRPF2020/irpf.jar"]
