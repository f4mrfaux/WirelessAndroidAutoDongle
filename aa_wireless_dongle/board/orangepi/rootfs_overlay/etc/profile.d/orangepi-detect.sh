#!/bin/sh

# Set environment variable for OrangePi detection
if grep -q "Orange Pi Zero 2W" /proc/device-tree/model 2>/dev/null; then
    export ORANGEPI_DEVICE=1
    export AAWG_BT_POWER_CLASS=8  # Higher BT power class for Orange Pi
    export AAWG_BT_SCAN_MODE=2    # More aggressive scanning for better range
    # Higher USB controller buffer sizes for better USB performance
    export AAWG_USB_TX_QUEUE_LEN=16
    export AAWG_USB_BUFFER_SIZE=16384
fi