#!/bin/bash

echo "======================================"
echo "       FILE INTEGRITY MONITOR         "
echo "======================================"

echo ""

read -p "Enter the absolute path of the file to monitor: " TARGET_FILE

if [ ! -f "$TARGET_FILE" ]; then
     echo "Error: file '$TARGET_FILR' does not exist."
     exit 1
fi


HASH_FILE="$TARGET_FILE.md5"


if [ ! -f "$HASH_FILE" ]; then
    echo "No baseline found for '$TARGET_FILE'."
    echo "Generating new base line hash ......"

    md5sum "$TARGET_FILE" | awk '{print $1}' > "$HASH_FILE"
    echo "Baseline created successfully! Run this script again later to check for changes."
    exit 0
fi

echo "Bashline found. Checking file integrity..."

SAVED_HASH=$(cat "$HASH_FILE")

CURRENT_HASH=$(md5sum "$TARGET_FILE" |awk '{print $1}')

if [ "$SAVED_HASH" == "$CURRENT_HASH" ]; then
    echo "[+] Status: ok. the file has not been modified."
else
    echo "[!] Warning: file intergrity Compromised! the file has been modified."
fi

