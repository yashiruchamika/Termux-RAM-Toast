#!/bin/bash
termux-api-start
while true; do
    # Get available RAM in MB
    available_ram=$(free -m | awk '/^Mem:/{print $7}')

    if [ "$available_ram" -lt 500 ]; then
        # If available RAM is less than 500 MB
        termux-toast -g top -c green -b red "Available RAM: ${available_ram}MB"
    else
        # If available RAM is greater than or equal to 500 MB
        termux-toast -g top -c green -b yellow "Available RAM: ${available_ram}MB"
    fi

    # Wait for a specified interval (e.g., 5 seconds) before checking again
    sleep 5
done
