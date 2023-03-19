FROM linuxserver/wireguard:1.0.20210914

ENV DNS=94.140.14.14,94.140.15.15

COPY /root /

EXPOSE 53/tcp
EXPOSE 53/udp
