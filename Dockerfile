FROM linuxserver/wireguard:1.0.20210914-legacy

ENV DNS1=94.140.14.14
ENV DNS2=94.140.15.15

RUN apt update && \
    apt install -y --no-install-recommends dnsutils && \
    apt clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY /root /

EXPOSE 53/tcp
EXPOSE 53/udp
