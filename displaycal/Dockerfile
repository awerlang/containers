FROM awerlang/gui

RUN zypper --non-interactive in python2 DisplayCAL && \
    zypper clean --all

USER user
WORKDIR /home/user

CMD ["displaycal"]
