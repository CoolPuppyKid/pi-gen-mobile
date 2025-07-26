#!/bin/bash
set -e


on_chroot << EOF
useradd --disabled-password --gecos "" -m -u 1000 phone

echo "phone:0000" | chpasswd

mkdir -p /etc/systemd/system/getty@tty1.service.d

cat < /etc/systemd/system/getty@tty1.service.d/autologin.conf <<EOC
[Service]
ExecStart=
ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin phone %I $TERM
EOC

EOF