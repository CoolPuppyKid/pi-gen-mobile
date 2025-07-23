#!/bin/bash
set -e

on_chroot << EOF
apt-get update
apt-get remove --purge -y elogind libelogind0
apt-get autoremove --purge -y
EOF

echo "Sanity check complete"