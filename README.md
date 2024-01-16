dfuc - DNS Forwarding using Cloudflare
======================================

dfuc (pronounced "the f*ck?") is a DNS forwarding service that forwards DNS requests to trusted DNS servers via
Cloudflare WARP to protect against DNS spoofing by ISPs.

Usage
=====

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
     -e DNS1=<your_preferred_dns_1> `#optional` \
     -e DNS2=<your_preferred_dns_2> `#optional` \
     -p 53:53/tcp \
     -p 53:53/udp \
     -v /lib/modules:/lib/modules \
     --sysctl net.ipv4.conf.all.src_valid_mark=1 \
     --restart unless-stopped \
     dfuc
   ```

   dfuc uses AdGuard DNS `94.140.14.14` and `94.140.15.15` by default. You can specify your preferred DNS servers by setting
   the `DNS1` and `DNS2` environment variables using the `-e` option.

5. On the device you want to use the DNS service provided by dfuc, set its DNS server to the IP address of the machine
   running dfuc