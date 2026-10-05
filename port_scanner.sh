#!/bin/bash

echo "==================================="
echo "            PORT SCANNER           "
echo "==================================="

read -p "Enter the target ip address: " TARGET_IP

echo "Scanning common ports on $TARGET_IP..."
echo ""

PORTS=(21 22 80 443 445 3389)

for PORT in "${PORTS[@]}"; do
     if timeout 1 bash -c  "echo > /dev/tcp/$TARGET_IP/$PORT" 2>/dev/null; then
          echo "[+] port $PORT is OPEN"
     else
          echo "[-] port $PORT is CLOSED"
     fi
done

echo ""
echo "Scan Complete!" 
