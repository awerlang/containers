FROM awerlang/opensuse as builder

ADD https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init /tmp/rustup-init
RUN chmod +xr /tmp/rustup-init

FROM awerlang/gcc

USER user

COPY --from=builder /tmp/rustup-init /tmp/rustup-init
RUN /tmp/rustup-init -y

WORKDIR /src

RUN mkdir /tmp/cargo/
ENV CARGO_TARGET_DIR=/tmp/cargo/target

ENTRYPOINT ["/home/user/.cargo/bin/cargo"]
