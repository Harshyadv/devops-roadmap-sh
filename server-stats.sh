#!/bin/bash

# System Monitoring Dashboard

echo -e "\n\033[1;36m=========================================="
echo -e "          SYSTEM MONITORING"
echo -e "==========================================\033[0m"

echo -e "\n\033[1;33m[ CPU USAGE ]\033[0m"
top -bn1 | grep "Cpu(s)"

echo -e "\n\033[1;33m[ MEMORY USAGE ]\033[0m"
free -m | awk 'NR==2 {printf "Used: %sMB | Free: %sMB | Total: %sMB (%.2f%%)\n", $3, $4, $2, $3*100/$2}'

echo -e "\n\033[1;33m[ STORAGE USAGE - ROOT ]\033[0m"
df -h / | awk 'NR==2 {printf "Used: %s | Free: %s | Total: %s (%s)\n", $3, $4, $2, $5}'

echo -e "\n\033[1;33m[ TOP 5 PROCESSES - MEMORY ]\033[0m"
ps aux --sort=-%mem | tail -n +2 | head -n 5

echo -e "\n\033[1;33m[ TOP 5 PROCESSES - CPU ]\033[0m"
ps aux --sort=-%cpu | tail -n +2 | head -n 5

echo -e "\n\033[1;36m=========================================="
echo -e "             END OF REPORT"
echo -e "==========================================\033[0m\n"
