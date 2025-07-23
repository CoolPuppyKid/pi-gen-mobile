#!/bin/bash
set -e

on_chroot << 'EOF'
  systemctl set-default graphical.target
  systemctl enable dbus systemd-logind

  mkdir -p /etc/systemd/system/getty@tty1.service.d
  cat > /etc/systemd/system/getty@tty1.service.d/autologin.conf <<EOC
    [Service]
    ExecStart=
    ExecStart=-/sbin/agetty --autologin phone --noclear %I \$TERM
  EOC


  runuser -u phone -- mkdir -p /home/phone/.config/systemd/user/default.target.wants

  runuser -u phone -- ln -sf \
    /usr/lib/systemd/user/phosh.service \
    /home/phone/.config/systemd/user/default.target.wants/phosh.service

  systemctl daemon-reload
  loginctl enable-linger phone
EOF
