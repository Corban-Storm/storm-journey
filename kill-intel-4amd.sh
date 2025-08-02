#!/bin/bash
# kill-intel-4amd.sh
# Disables Intel iGPU (i915) and forces AMDGPU as the primary driver.

BACKUP_DIR="$HOME/Projects/gnu-new/display/backups/$(date +%F_%H-%M-%S)"
LOG="$HOME/kill-intel-4amd.log"

echo "----- $(date) ----- Starting AMD-only setup" | tee -a "$LOG"

# Create backup folder
mkdir -p "$BACKUP_DIR"
echo "Backing up /etc/X11/xorg.conf.d to $BACKUP_DIR" | tee -a "$LOG"
sudo cp -r /etc/X11/xorg.conf.d "$BACKUP_DIR" 2>/dev/null

# Blacklist Intel iGPU (i915)
echo "Blacklisting Intel driver (i915)..." | tee -a "$LOG"
echo "blacklist i915" | sudo tee /etc/modprobe.d/blacklist-intel.conf

# Create AMD-only config
echo "Creating AMD-only Xorg config..." | tee -a "$LOG"
sudo mkdir -p /etc/X11/xorg.conf.d
sudo tee /etc/X11/xorg.conf.d/10-amdgpu.conf > /dev/null <<'EOF'
Section "Device"
    Identifier "AMD"
    Driver "amdgpu"
    Option "TearFree" "true"
    Option "DRI" "3"
    Option "PrimaryGPU" "true"
EndSection
EOF

# Rebuild initramfs
echo "Rebuilding initramfs (this may take a moment)..." | tee -a "$LOG"
sudo dracut --force

echo "All done! AMD-only mode enabled. A reboot is required." | tee -a "$LOG"
