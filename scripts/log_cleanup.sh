#!/bin/bash

LOG_DIR="/opt/company/logs"
BACKUP_DIR="/opt/company/backups"

LOG_FILES=$(ls "$LOG_DIR"/*.log 2>/dev/null)

if [ -z "$LOG_FILES" ]; then
    echo "No log files found to archive on $(date)"
else
    sudo mv "$LOG_DIR"/*.log "$BACKUP_DIR"/
    echo "Logs archived successfully on $(date)"
fi

