#!/bin/bash
# ------------------------------------------------------
# Script Name : log_cleanup.sh
# Purpose     : Move application log files to backup
# Author      : Aditya Singh Tomar
# Run As      : deploy user (via cron or manual)
# ------------------------------------------------------

# Directory where application logs are stored
LOG_DIR="/opt/company/logs"

# Directory where log backups will be stored
BACKUP_DIR="/opt/company/backups"

# Collect all .log files from the logs directory
# Redirect errors to /dev/null in case no log files exist
LOG_FILES=$(ls "$LOG_DIR"/*.log 2>/dev/null)

# Check if any log files are present
if [ -z "$LOG_FILES" ]; then
    # If no log files are found, log this information with timestamp
    echo "No log files found to archive on $(date)"
else
    # Move all log files to the backup directory
    # No sudo is used because the script is run by a user
    # who already has permission (deploy user)
    mv "$LOG_DIR"/*.log "$BACKUP_DIR"/

    # Log successful execution with timestamp
    echo "Log files archived successfully on $(date)"
fi


