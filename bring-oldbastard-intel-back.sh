#!/bin/bash
# bring-oldbastard-intel-back.sh
# Restores Intel iGPU (i915) and reverts AMD-only config.

BACKUP_BASE="$HOME/Projects/gnu-new/display/backups"
LOG="$HOME/bring-intel-back.log"

echo "----- $(date) ----- Restoring Intel support" | tee -a "$LOG"

# Remove the blacklist for i915
if [ -f /etc/modprobe.d/blacklist-intel.conf ]; then
    echo "Removing Intel blacklist..." | tee -a "$LOG"
    sudo rm /etc/modprobe.d/blacklist-intel.conf
else
    echo "Intel blacklist not found. Nothing to remove." | tee -a "$LOG"
fi

# Restore previous Xorg config if a backup exists
LAST_BACKUP=$(ls -td "$BACKUP_BASE"/* 2>/dev/null | head -n 1)
if [ -n "$LAST_BACKUP" ]; then
    echo "Restoring backup from $LAST_BACKUP..." | tee -a "$LOG"
    sudo rm -rf /etc/X11/xorg.conf.d
    sudo cp -r "$LAST_BACKUP/xorg.conf.d" /etc/X11/
else
    echo "No backup found. Skipping restore." | tee -a "$LOG"
fi

# Rebuild initramfs
echo "Rebuilding initramfs (this may take a moment)..." | tee -a "$LOG"
sudo dracut --force

echo "Intel iGPU restored. Reboot to take effect." | tee -a "$LOG"
