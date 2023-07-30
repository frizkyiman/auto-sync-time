#!/bin/bash

# Synchronization time using ntpclient
sync_time_with_ntpclient() {
    local ip=$1
    if ntpclient -s -h pool.ntp.org -l -i 2 -p 1 -r -o -l -i 2 -s -a $ip; then
        echo "Time synced successfully."
    else
        echo "Time sync failed."
    fi
}

input="$1"
fix_google="google.com"

if [[ -z "$input" || ! $input =~ ^[a-zA-Z0-9.-]+$ ]]; then
    input="$fix_google"
fi

ip_address=$(ip route get "$input" | awk '/^.*src/ { print $NF }')

if [[ -z "$ip_address" ]]; then
    ip_address=$(nslookup "$input" | awk '/^Address: / { print $2 }' | tail -n1)
fi

if [[ -n "$ip_address" ]]; then
    echo "Runs a time sync for $input..."
    sync_time_with_ntpclient "$ip_address"
else
    echo "Could not find IP address or hostname for $input."
fi
