#!/bin/sh
wget --no-check-certificate https://raw.githubusercontent.com/frizkyiman/auto-sync-time/main/sbin/sync_time.sh -O /sbin/sync_time.sh && chmod +x /sbin/sync_time.sh
wget --no-check-certificate https://raw.githubusercontent.com/frizkyiman/auto-sync-time/main/usr/bin/clock -O /usr/bin/clock && chmod +x /usr/bin/clock
