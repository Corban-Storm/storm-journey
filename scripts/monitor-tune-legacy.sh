##!/bin/bash
# monitor-tune-legacy.sh
# Early utility script to adjust brightness and report missing monitor connections.
# Checks for HDMI/VGA availability and applies basic settings using xrandr.
# Superseded later by systemd-based automation and more advanced display config.

LOGFILE="$HOME/monitor-tune.log"
echo "----- $(date) ----- Starting monitor tune" >> "$LOGFILE"

# Wait a few seconds to ensure X is ready
sleep 3

# Adjust gamma & brightness
xrandr --output HDMI-4 --brightness 1.1 --gamma 1.05:1.05:1.1 || echo "HDMI-4 not detected" >> "$LOGFILE"
xrandr --output DP-4   --brightness 0.9 --gamma 1.05:1.05:1.1 || echo "DP-4 not detected" >> "$LOGFILE"

echo "Gamma and brightness applied." >> "$LOGFILE"
