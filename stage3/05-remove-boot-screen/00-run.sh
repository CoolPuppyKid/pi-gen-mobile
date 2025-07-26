#!/bin/bash
set -e


on_chroot << EOF
systemctl disable firstboot-wizard.service || true
systemctl disable pi-wizard.service || true
EOF