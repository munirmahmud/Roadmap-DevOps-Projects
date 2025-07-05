#!/bin/bash

# Script: log-archive.sh
# Description: Compresses and archives logs from a given directory
# Author: Munir Mahmud
# GitHub: https://github.com/munirmahmud/roadmap-devops-projects/
# Date: 04-07-2025

set -euo pipefail

# === CONFIGURATION ===
ARCHIVE_ROOT="/var/log_archives"
LOG_FILE="/var/log/log-archive.log"
DATE_FORMAT="%Y%m%d_%H%M%S"

# === FUNCTIONS ===

# Prints usage instructions
usage() {
    echo "Usage: $0 <log-directory>"
    exit 1
}

# Logs a message to the log file
log_action() {
    local message="$1"
    echo "$(date "+%Y-%m-%d %H:%M:%S") - $message" >> "$LOG_FILE"
}

# Validates input and environment
validate_input() {
    if [[ $# -ne 1 ]]; then
        usage
    fi

    if [[ ! -d "$1" ]]; then
        echo "Error: '$1' is not a valid directory"
        exit 2
    fi

    if [[ ! -r "$1" ]]; then
        echo "Error: Cannot read from '$1'"
        exit 3
    fi

    mkdir -p "$ARCHIVE_ROOT"
}

# Main logic for compressing and archiving logs
archive_logs() {
    local log_dir="$1"
    local timestamp
    timestamp=$(date +"$DATE_FORMAT")
    local archive_file="logs_archive_${timestamp}.tar.gz"
    local archive_path="${ARCHIVE_ROOT}/${archive_file}"

    tar -czf "$archive_path" -C "$log_dir" . 2>/dev/null

    local archive_size
    archive_size=$(du -sh "$archive_path" | awk '{print $1}')
    
    echo "✅ Logs archived: $archive_path ($archive_size)"
    log_action "Archived logs from '$log_dir' to '$archive_path' ($archive_size)"
}

# === ENTRY POINT ===

validate_input "$@"
archive_logs "$1"
