dfuc - DNS Forwarding using Cloudflare
======================================

dfuc (pronounced "the f*ck?") is a DNS forwarding service that forwards DNS requests to trusted DNS servers via
Cloudflare WARP to protect against DNS spoofing by ISPs.

Running
=======

1. Clone the repository

   ```
   git clone https://github.com/awasisto/dfuc
   ```

2. Change into the `dfuc` directory

   ```
   cd dfuc
   ```

3. Build the Docker image

   ```
   docker build -t dfuc .
   ```

4. Run the Docker container

   ```
   docker run -d \
     --name=dfuc \
     --cap-add=NET_ADMIN \
     --cap-add=SYS_MODULE \
     -e DNS=<your_preferred_dns_1>,<your_preferred_dns_2> `#optional` \
     -p 53:53/tcp \
     -p 53:53/udp \
     -v /lib/modules:/lib/modules \
     --sysctl net.ipv4.conf.all.src_valid_mark=1 \
     --sysctl net.ipv6.conf.all.disable_ipv6=0 \
     --restart unless-stopped \
     dfuc
   ```

   dfuc uses AdGuard DNS `94.140.14.14,94.140.15.15` by default. You can specify your preferred DNS servers by setting
   the `DNS` environment variable using the `-e` option. Here are some popular DNS servers you can choose:
   - Cloudflare: `1.1.1.1,1.0.0.1`
   - Google: `8.8.8.8,8.8.4.4`
   - OpenDNS (Cisco): `208.67.222.222,208.67.220.220`
   - Quad9: `9.9.9.9,149.112.112.112`
