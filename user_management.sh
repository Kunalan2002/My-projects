#!/bin/bash

echo "=================================="
echo "          USER MANAGEMENT         "
echo "=================================="
echo ""

read -p "Enter the username you want to check or create : " TARGET_USER

if id "$TARGET_USER" &>/dev/null; then
      echo "Status: User '$TARGET_USER' already exists"
else 
       echo "Status: user '$TARGET_USER' does not exists"
fi

