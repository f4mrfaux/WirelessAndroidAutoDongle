#!/bin/bash

set -u
set -e

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
fi

# Use Orange Pi optimized config file for aawgd.conf
if [ -e ${TARGET_DIR}/etc/aawgd.conf.orangepi ]; then
    cp ${TARGET_DIR}/etc/aawgd.conf.orangepi ${TARGET_DIR}/etc/aawgd.conf
    echo "Using optimized Orange Pi config for aawgd"
fi