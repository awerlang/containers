FROM awerlang/browsers

RUN zypper --non-interactive in icu krb5-client

ADD https://go.microsoft.com/fwlink/?linkid=2198880 /tmp/azuredatastudio-linux.rpm
RUN rpm -hi --nosignature /tmp/azuredatastudio-linux.rpm

USER user
