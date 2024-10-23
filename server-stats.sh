#!/bin/bash

# Get CPU usage
cpu_idle=$(vmstat 1 2 | awk '{print $13}')
cpu_usage=$((100 - cpu_idle))

# Get memory usage
total_mem=$(free -b | grep Mem | awk '{print $2}')
used_mem=$(free -b | grep Mem | awk '{print $3}')
free_mem=$((total_mem - used_mem))
mem_usage=$(echo "scale=2; (used_mem / total_mem) * 100" | bc)

# Get disk usage (assuming / is the main partition)
df -h / | tail -n 1 | awk '{print $4, $5}'  # Get used space and percentage

# Top 5 processes by CPU usage
top_cpu_processes=$(ps -eo pid,pcpu,comm | head -n 6 | tail -n 5)

# Top 5 processes by memory usage
top_mem_processes=$(ps -eo pid,pmem,comm | head -n 6 | tail -n 5)

# Stretch Goals
os_version=$(cat /etc/os-release | grep VERSION= | cut -d= -f2 | tr -d '"')
uptime=$(uptime -p | awk '{print $2,$3}')
load_average=$(uptime | awk '{print $10,$11,$12}')
logged_in_users=$(who | awk '{print NR}')
failed_logins=$(lastb | grep "Failed login" | wc -l)  # Requires "last" command

# Print server stats
echo "**Server Stats**"
echo "  * OS Version: $os_version"
echo "  * Uptime: $uptime"
echo "  * Load Average: $load_average"
echo "  * Logged In Users: $logged_in_users"
echo "  * Failed Login Attempts (last boot): $failed_logins"
echo ""
echo "**CPU Usage:** $cpu_usage%"
echo ""
echo "**Memory Usage:**"
echo "  * Total: $(free -m | grep Mem | awk '{print $2}') MB"
echo "  * Used: $(free -m | grep Mem | awk '{print $3}') MB ($mem_usage%)"
echo "  * Free: $(free -m | grep Mem | awk '{print $4}') MB"
echo ""
echo "**Disk Usage (/):**"
echo "  * Used: $1"
echo "  * Free: $2"
echo ""
echo "**Top 5 Processes by CPU Usage:**"
echo "$top_cpu_processes"
echo ""
echo "**Top 5 Processes by Memory Usage:**"
echo "$top_mem_processes"