#!/bin/bash

# Script: server-stats.sh
# Description: Gathers and displays server performance statistics.
# Author: Munir Mahmud
# GitHub: https://github.com/munirmahmud/roadmap-devops-projects/
# Date: 04-07-2025

# Exit immediately on error
set -e

# Function: Header
print_header() {
    echo "--------------------------------------------------"
    echo "          SERVER PERFORMANCE STATISTICS           "
    echo "--------------------------------------------------"
}

# Function: CPU Usage
cpu_usage() {
    echo -e "\n Total CPU Usage:"
    top -bn1 | grep "Cpu(s)" | awk '{print "Used: " $2 + $4 "%, Idle: " $8 "%"}'
}

# Function: Memory Usage
memory_usage() {
    echo -e "\n Total Memory Usage:"
    free -h | awk '/^Mem:/ {printf("Used: %s / %s (%.2f%%)\n", $3, $2, $3*100/$2)}'
}

# Function: Disk Usage
disk_usage() {
    echo -e "\n  Total Disk Usage:"
    df -h --total | awk '/^total/ {printf("Used: %s / %s (%s used)\n", $3, $2, $5)}'
}

# Function: Top 5 Processes by CPU
top_cpu_processes() {
    echo -e "\n Top 5 Processes by CPU Usage:"
    ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6
}

# Function: Top 5 Processes by Memory
top_memory_processes() {
    echo -e "\n Top 5 Processes by Memory Usage:"
    ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6
}

# Function: Extra - OS Info
os_info() {
    echo -e "\n OS Version:"
    lsb_release -a 2>/dev/null || cat /etc/os-release
}

# Function: Extra - Uptime
uptime_info() {
    echo -e "\n Uptime & Load Average:"
    uptime
}

# Function: Extra - Logged in Users
logged_in_users() {
    echo -e "\n Logged in Users:"
    who
}

# Function: Extra - Failed login attempts
failed_logins() {
    echo -e "\n Failed Login Attempts (last 24h):"
    journalctl -u ssh --since "1 day ago" 2>/dev/null | grep "Failed password" | wc -l
}

# Main
main() {
    print_header
    cpu_usage
    memory_usage
    disk_usage
    top_cpu_processes
    top_memory_processes

    # Stretch Goals
    os_info
    uptime_info
    logged_in_users
    failed_logins
}

main
