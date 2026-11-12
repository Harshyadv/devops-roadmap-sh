#!/bin/bash
echo -e "Total CPU Usage"
top -bn1 | grep "Cpu(s)"

echo -e "\nTotal Memory"
free -m | awk 'NR==2 {printf "Used: %sMB | Free: %sMB | Total: %sMB (%.2f%%)\n", $3, $4, $2, $3*100/$2}'

echo -e "\nTotal Storage at Root directory"
df -h / | awk 'NR==2 {printf "Used: %s | Free: %s | Total: %s (%s)\n", $3, $4, $2, $5}'

echo -e "\nTop 5 process by mem usage"
ps aux --sort=-%mem | tail -n +2 | head -n 5

echo -e "\nTop 5 process by cpu usage"
ps aux --sort=-%cpu | tail -n +2 | head -n 5
