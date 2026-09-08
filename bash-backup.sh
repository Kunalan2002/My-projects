#!/bin/bash

echo "======================================"
echo "         BASH BACKUP SCRIPT"
echo "======================================"

echo ""

read -p "Enter the folder you want to back up: " SOURCE

if [ ! -d "$SOURCE" ]; then
    echo "Error: Folder does not exist!"
    exit 1
fi

BACKUP_DATE=$(date +%Y-%m-%d_%H-%M-%S)

BACKUP_DIR="backups"

mkdir -p "$BACKUP_DIR"

BACKUP_FILE="$BACKUP_DIR/backup_$BACKUP_DATE.tar.gz"

echo ""
echo "Creating backup..."
echo ""

if tar -czf "$BACKUP_FILE" "$SOURCE"; then
    echo "Backup created successfully!"
    echo "Backup file: $BACKUP_FILE"
else
    echo "Backup failed!"
    exit 1
fi

echo ""
echo "======================================"
echo "           BACKUP COMPLETE"
echo "======================================"