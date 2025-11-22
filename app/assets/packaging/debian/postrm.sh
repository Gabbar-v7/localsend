#!/bin/bash
set -e

echo "Sorry to see you go :("

UFW_FILENAME="ufw-localsend"
UFW_SYSTEM_DIR="/etc/ufw/applications.d"

PROFILE_DST="$UFW_SYSTEM_DIR/$UFW_FILENAME"

if [ -f "$PROFILE_DST" ]; then
  rm "$PROFILE_DST"
  echo "UFW profile uninstalled at $PROFILE_DST"
  rm /var/lib/dpkg/localsend-postrm.sh
fi
