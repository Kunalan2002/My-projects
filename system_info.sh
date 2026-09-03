#!/bin/bash

echo "========================================"
echo " SYSTEM INFORMATION REPORT"
echo "========================================"

echo ""
echo "Operating System:"
grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2|tr -d '"'

echo ""
echo "Kernel Version:"
uname -r


echo ""
echo "CPU:"
lscpu|grep "Model name"


echo ""
echo "RAM:"
free -h

echo ""
echo "Disk Usage:"
df -h

echo ""
echo "Current Users:"
who

echo ""
echo "System Uptime:"
uptime

echo ""
echo "========================================"
