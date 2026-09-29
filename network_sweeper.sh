#!/bin/bash

echo "++++++++++++++++++++++++++++++++++++++"
echo "             NETWORK SWEEPER          "
echo "++++++++++++++++++++++++++++++++++++++"
echo ""

read -p "Enter the network prefix (e.g., 10.0.2):" NETWORK

echo "Scanning netwrok $NETWORK.X for active hosts...."
echo ""


for IP in {1..254}; do
    ping -c 1 -W 1 "$NETWORK.$IP" &> /dev/null && echo "Host $NETWORK.$IP is up" &
done
wait

echo ""
echo "scan complete"

