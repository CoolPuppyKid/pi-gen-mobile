#!/bin/bash
set -e


on_chroot << EOF
sudo useradd -m -u 1000 phone
EOF