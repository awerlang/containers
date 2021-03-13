FROM awerlang/buildpack-deps as builder

RUN curl -fsSL -o /tmp/irpf.zip https://downloadirpf.receita.fazenda.gov.br/irpf/2021/irpf/arquivos/IRPF2021-1.2.zip && \
    unzip -d /opt /tmp/irpf.zip

FROM awerlang/jdk11

USER user
WORKDIR /home/user

COPY --from=builder --chown=user:users /opt .

ENV LANG="pt_BR.UTF-8" \
    XAUTHORITY=/tmp/.Xauthority

CMD ["java", "-client", "-Dswing.aatext=TRUE", "-Dawt.useSystemAAFontSettings=on", "-jar", "IRPF2021/irpf.jar"]
