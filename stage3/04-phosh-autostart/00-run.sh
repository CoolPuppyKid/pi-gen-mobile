#!/bin/bash
set -e

on_chroot << 'EOF'
  systemctl enable phosh
  
EOF
