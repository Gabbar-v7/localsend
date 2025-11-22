#!/bin/bash
set -e

echo "Installed LocalSend successfully"

echo "Installing LocalSend UFW profile..."

UFW_FILENAME="ufw-localsend"
UFW_PROFILE_DIR="/usr/share/localsend_app/data/flutter_assets/assets/packaging"
UFW_SYSTEM_DIR="/etc/ufw/applications.d"

PROFILE_SRC="$UFW_PROFILE_DIR/$UFW_FILENAME"
PROFILE_DST="$UFW_SYSTEM_DIR/$UFW_FILENAME"

# Install UFW profile if UFW is present
if [ -d "$UFW_SYSTEM_DIR" ]; then
  if [ -f "$PROFILE_SRC" ]; then
    cp "$PROFILE_SRC" "$PROFILE_DST"
    chmod 644 "$PROFILE_DST"
    chown root:root "$PROFILE_DST"
    echo "UFW profile installed at $PROFILE_DST"

    # Move the postrm script to /var/lib/dpkg/info
    chmod +x /usr/share/localsend_app/data/flutter_assets/assets/packaging/debian/postrm.sh
    mv /usr/share/localsend_app/data/flutter_assets/assets/packaging/debian/postrm.sh /var/lib/dpkg/info/localsend-postrm.sh

  else
    echo "Warning: UFW profile source file not found: $PROFILE_SRC"
  fi
fi

exit 0
