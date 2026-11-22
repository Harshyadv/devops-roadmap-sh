# Scripts Reference & Usage Guide

Complete documentation for all automation scripts in this repository.

---

## 1. Server Stats (`server-stats.sh`)
Displays real-time system health metrics including CPU usage, memory usage, disk space, and top resource-consuming processes.

### Usage
```bash
chmod +x server-stats.sh
./server-stats.sh
```
---

## 2. Log Archive Tool (`log-archive.sh`)

Compresses a target log directory into a timestamped `.tar.gz` archive, records an operational audit trail, and pipes `stderr` into structured error logs.

### Usage
```bash
chmod +x log-archive.sh
./log-archive.sh
```
