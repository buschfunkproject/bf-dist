#!/bin/bash -e

#install -m 644 files/boot/config.txt "${ROOTFS_DIR}/boot/"
#install -m 644 files/boot/cmdline.txt "${ROOTFS_DIR}/boot/"

install -m 755 files/configsys/configsys "${ROOTFS_DIR}/usr/bin/"
install -m 644 files/configsys/crontab "${ROOTFS_DIR}/etc/cron.d/configsys"

on_chroot << \EOF
touch /boot/ssh
mkdir -p /boot/autoexec
touch /boot/autoexec/always.sh
touch /boot/autoexec/once.sh

echo "@reboot root /usr/bin/configsys > /tmp/configsys.log" > /etc/cron.d/configsys
EOF

install -m 755 files/install-wifi "${ROOTFS_DIR}/usr/bin/"

on_chroot << \EOF
chmod a+x /usr/bin/install-wifi
EOF
