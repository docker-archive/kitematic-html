FROM scratch

ADD ./rootfs.tar /
ADD ./opkg.conf         /etc/opkg.conf
ADD ./opkg-install      /usr/bin/opkg-install
ADD ./functions.sh      /lib/functions.sh
RUN opkg-cl install https://downloads.openwrt.org/snapshots/trunk/x86/64/packages/base/libgcc_4.8-linaro-1_x86_64.ipk
RUN opkg-cl install https://downloads.openwrt.org/snapshots/trunk/x86/64/packages/base/libc_0.9.33.2-1_x86_64.ipk
RUN opkg-install nginx
RUN mkdir /var/lib/nginx
ADD nginx.conf /etc/nginx/nginx.conf

ADD start.sh /start.sh
ADD index.html /index.html

VOLUME ["/website_files"]
EXPOSE 80
CMD ["sh", "/start.sh"]
